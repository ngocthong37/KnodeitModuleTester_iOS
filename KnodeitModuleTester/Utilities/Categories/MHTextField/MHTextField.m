//
//  MHTextField.m
//
//  Created by Mehfuz Hossain on 4/11/13.
//  Copyright (c) 2013 Mehfuz Hossain. All rights reserved.
//

#import "MHTextField.h"

@interface MHTextField()
{
    UITextField *_textField;
    BOOL _disabled;
}

@property (nonatomic) BOOL keyboardIsShown;
@property (nonatomic) CGSize keyboardSize;
@property (nonatomic) BOOL isKeyboardHeightCalculated;

@property (nonatomic) BOOL hasScrollView;
@property (nonatomic) BOOL invalid;

@property (nonatomic, setter = setToolbarCommand:) BOOL isToolBarCommand;
@property (nonatomic, setter = setDoneCommand:) BOOL isDoneCommand;

@property (nonatomic , strong) UIBarButtonItem *previousBarButton;
@property (nonatomic , strong) UIBarButtonItem *nextBarButton;

@property (nonatomic, strong) NSMutableArray *textFields;

@end

@implementation MHTextField

@synthesize required;
@synthesize scrollView;
@synthesize toolbar;
@synthesize keyboardIsShown;
@synthesize keyboardSize;
@synthesize isKeyboardHeightCalculated;
@synthesize invalid;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self){
        
        [self setup];
    }
    
    return self;
}

- (void) awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}

- (void)setup
{
    
    [self setTintColor:[UIColor blackColor]];
    
    
    [self setTextAlignment:NSTextAlignmentCenter];
    self.textColor=[UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
    
    toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 0, self.window.frame.size.width, 36);
    
    // set style
    [toolbar setBarStyle:UIBarStyleDefault];
    
    self.previousBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self action:@selector(previousButtonIsClicked:)];
    
    
    self.nextBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(nextButtonIsClicked:)];
    
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonIsClicked:)];
    
    NSArray *barButtonItems = @[self.previousBarButton, self.nextBarButton, flexBarButton, doneBarButton];
    
    toolbar.items = barButtonItems;
    
    self.textFields = [[NSMutableArray alloc]init];
    
    [self markTextFieldsWithTagInView:self.superview];
}

- (void)markTextFieldsWithTagInView:(UIView*)view
{
    int index = 0;
    if ([self.textFields count] == 0){
        for(UIView *subView in view.subviews){
            if ([subView isKindOfClass:[MHTextField class]]){
                MHTextField *textField = (MHTextField*)subView;
                textField.tag = index;
                [self.textFields addObject:textField];
                index++;
            }
        }
    }
}

- (void) doneButtonIsClicked:(id)sender
{
    [self setDoneCommand:YES];
    [self resignFirstResponder];
    [self setToolbarCommand:YES];
}

static inline UIViewAnimationOptions animationOptionsWithCurve(UIViewAnimationCurve curve)
{
    UIViewAnimationOptions opt = (UIViewAnimationOptions)curve;
    return opt << 16;
}
-(void) keyboardDidShow:(NSNotification *) notification
{
    if (_textField == nil) return;
    
    if (![_textField isKindOfClass:[MHTextField class]]) return;
    
    NSDictionary *notificationInfo = [notification userInfo];
    CGRect finalKeyboardFrame = [[notificationInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval keyboardAnimationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    NSInteger keyboardAnimationCurveNumber = [[notificationInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    UIViewAnimationOptions animationOptions = animationOptionsWithCurve(keyboardAnimationCurveNumber);
    
    self.keyboardSize = finalKeyboardFrame.size;
    
    // resize frame for scroll view
    if ([self getKeyboardIsShown] == false) {
        
        if ([self.superview isKindOfClass:[UIScrollView class]]) {
            
            [UIView animateWithDuration:keyboardAnimationDuration delay:0 options:animationOptions animations:^{
                
                [self calculateKeyboardHeightForScrollViewForStatus:true];
                [self scrollToField:false];
            } completion:nil];
            
        }
    }else{
        
        if ([self.superview isKindOfClass:[UIScrollView class]]) {
            
            [self scrollToField:true];
        }
    }
    
    [self setKeyboardStatusToHidden:true];
    self.keyboardIsShown = true;
}

-(void) keyboardWillHide:(NSNotification *) notification
{
 
    NSDictionary *info = [notification userInfo];
    NSTimeInterval duration = [[info valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        if (self.isDoneCommand || true) {
            
            if ([self.superview isKindOfClass:[UIScrollView class]]) {
                
                [self.scrollView setContentOffset:CGPointMake(0, 0) animated:false];
            }
        }
    }];
    
    // resize frame for scroll view
    if ([self getKeyboardIsShown]) {
        
        if ([self.superview isKindOfClass:[UIScrollView class]]) {
            
            [self calculateKeyboardHeightForScrollViewForStatus:false];
        }
    }
    
    [self setKeyboardStatusToHidden:true];
    self.keyboardIsShown = false;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:self];
}


- (void) nextButtonIsClicked:(id)sender
{
    NSInteger tagIndex = self.tag;
    MHTextField *textField =  [self.textFields objectAtIndex:++tagIndex];
    
    while (!textField.isEnabled && tagIndex < [self.textFields count])
        textField = [self.textFields objectAtIndex:++tagIndex];

    [self becomeActive:textField];
}

- (void) previousButtonIsClicked:(id)sender
{
    NSInteger tagIndex = self.tag;
    
    MHTextField *textField =  [self.textFields objectAtIndex:--tagIndex];
    
    while (!textField.isEnabled && tagIndex < [self.textFields count])
        textField = [self.textFields objectAtIndex:--tagIndex];
    
    [self becomeActive:textField];
}

- (void)becomeActive:(UITextField*)textField
{
    [self setToolbarCommand:YES];
    [self resignFirstResponder];
    [textField becomeFirstResponder];
}

- (void)setBarButtonNeedsDisplayAtTag:(int)tag
{
    BOOL previousBarButtonEnabled = NO;
    BOOL nexBarButtonEnabled = NO;
    
    for (int index = 0; index < [self.textFields count]; index++) {

        UITextField *textField = [self.textFields objectAtIndex:index];
    
        if (index < tag)
            previousBarButtonEnabled |= textField.isEnabled;
        else if (index > tag)
            nexBarButtonEnabled |= textField.isEnabled;
    }
    
    self.previousBarButton.enabled = previousBarButtonEnabled;
    self.nextBarButton.enabled = nexBarButtonEnabled;
}

- (void) selectInputView:(UITextField *)textField
{
    if (_isDateField){
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        if (![textField.text isEqualToString:@""]){
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd/YY"];
            [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
            [dateFormatter setDateStyle:NSDateFormatterShortStyle];
            [datePicker setDate:[dateFormatter dateFromString:textField.text]];
        }
        [textField setInputView:datePicker];
    }
}


- (void)datePickerValueChanged:(id)sender
{
    UIDatePicker *datePicker = (UIDatePicker*)sender;
    
    NSDate *selectedDate = datePicker.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [
     dateFormatter setDateFormat:@"MM/dd/YY"];
    
    [_textField setText:[dateFormatter stringFromDate:selectedDate]];
    
    [self validate];
}

- (void)scrollToField:(BOOL)animated
{
    
    if (_textField == nil) {
        
        return;
    }
    
    CGRect textFieldRect = _textField.frame;
    
    CGRect aRect = self.window.bounds;
    
    aRect.origin.y = -scrollView.contentOffset.y;
    
    CGFloat toolbarHeight = self.toolbar.frame.size.height;
    if  (self.toolbar.hidden) {
        
        toolbarHeight = 0;
    }
    
    aRect.size.height -= self.keyboardSize.height + toolbarHeight;
    
    CGPoint textRectBoundary = CGPointMake(textFieldRect.origin.x, textFieldRect.origin.y + textFieldRect.size.height + 20);
   
    if (!CGRectContainsPoint(aRect, textRectBoundary) || scrollView.contentOffset.y >= 0) {
        
        CGPoint scrollPoint = CGPointMake(0.0, self.superview.frame.origin.y + _textField.frame.origin.y + 20 - aRect.size.height);
        
        if (scrollPoint.y < 0) scrollPoint.y = 0;
        
        [scrollView setContentOffset:scrollPoint animated:animated];
    }
}

- (BOOL) validate
{
    //self.backgroundColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.5];
    
    if (required && [self.text isEqualToString:@""]){
        return NO;
    }
    //else if(_textField.keyboardType== UIKeyboardTypeEmailAddress){
    else if (_isEmailField){
        NSString *emailRegEx =
        @"(?:[A-Za-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[A-Za-z0-9!#$%\\&'*+/=?\\^_`{|}"
        @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[A-Za-z0-9](?:[a-"
        @"z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        @"9][0-9]?|[A-Za-z0-9-]*[A-Za-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
        
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        
        if (![emailTest evaluateWithObject:self.text]){
            return NO;
        }
    }

    //[self setBackgroundColor:[UIColor whiteColor]];
    
    return YES;
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    if (!enabled)
        [self setBackgroundColor:[UIColor lightGrayColor]];
}

#pragma mark - UITextField notifications

- (void)textFieldDidBeginEditing:(NSNotification *) notification
{
    UITextField *textField = (UITextField*)[notification object];
    
    _textField = textField;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self setBarButtonNeedsDisplayAtTag:(int)textField.tag];
    
    if ([self.superview isKindOfClass:[UIScrollView class]] && self.scrollView == nil)
        self.scrollView = (UIScrollView*)self.superview;
    
    [self selectInputView:textField];
    [self setInputAccessoryView:toolbar];
    
    [self setDoneCommand:NO];
    [self setToolbarCommand:NO];
}

- (void)textFieldDidEndEditing:(NSNotification *) notification
{
    UITextField *textField = (UITextField*)[notification object];

    [self validate];
    
    _textField = nil;
    
    if (_isDateField && [textField.text isEqualToString:@""] && _isDoneCommand){
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"MM/dd/YY"];
        
        [textField setText:[dateFormatter stringFromDate:[NSDate date]]];
    }
}

-(BOOL)getKeyboardIsShown{
    
    for (int i = 0; i < self.textFields.count; ++i) {
        
        MHTextField *tf = [self.textFields objectAtIndex:i];
        if (tf.keyboardIsShown) {
            
            return true;
        }
    }
    
    return false;
}

-(void)calculateKeyboardHeightForScrollViewForStatus:(BOOL)isShown{

    if (isShown) {
        
        CGSize bkgndSize = self.scrollView.contentSize;
        bkgndSize.height += self.keyboardSize.height;
        self.scrollView.contentSize = bkgndSize;
        self.isKeyboardHeightCalculated = true;
    }else{
    
        for (int i = 0; i < self.textFields.count; ++i) {
            
            MHTextField *tf = [self.textFields objectAtIndex:i];
            if (tf.isKeyboardHeightCalculated) {
                
                CGSize bkgndSize = self.scrollView.contentSize;
                bkgndSize.height -= tf.keyboardSize.height;
                self.scrollView.contentSize = bkgndSize;
                tf.isKeyboardHeightCalculated = false;
            }
        }
    }
}

-(void)setKeyboardStatusToHidden:(BOOL)isHidden{

    for (int i = 0; i < self.textFields.count; ++i) {
        
        MHTextField *tf = [self.textFields objectAtIndex:i];
        tf.keyboardIsShown = !isHidden;
    }
}
@end
