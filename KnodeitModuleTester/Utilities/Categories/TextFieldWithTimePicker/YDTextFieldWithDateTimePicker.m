//
//  YDTextFieldWithTimePicker.m
//  POC
//
//  Created by Peter van de Put on 24/05/2014.
//  Copyright (c) 2014 Yourdeveloper. All rights reserved.
//

#import "YDTextFieldWithDateTimePicker.h"
@interface YDTextFieldWithDateTimePicker()<UITextFieldDelegate>

@end
@implementation YDTextFieldWithDateTimePicker
{
    UIDatePicker *datePicker;
    NSDateFormatter *dropDownTimeFormatter;
}
- (CGRect)caretRectForPosition:(UITextPosition *)position {
    return CGRectZero;
}
-(void)timeChanged:(UIDatePicker*)tPicker{
    
    [self setSelectedItem:[dropDownTimeFormatter stringFromDate:tPicker.date]];
}
-(void)initialize
{
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [self setBorderStyle:UITextBorderStyleRoundedRect];
    [self setDelegate:self];
    
    dropDownTimeFormatter = [[NSDateFormatter alloc] init];
    //create local
    NSLocale *currentLocale = [NSLocale currentLocale];
    //Create a default Calendar
    NSCalendar *defaultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
     [dropDownTimeFormatter setCalendar:defaultCalendar];
     [dropDownTimeFormatter setLocale:currentLocale];
   // [dropDownTimeFormatter setDateStyle:NSDateFormatterShortStyle];
   // [dropDownTimeFormatter setTimeStyle:NSDateFormatterShortStyle];
    dropDownTimeFormatter.dateFormat = @"MM/dd/yyyy HH:mm";
    
    datePicker = [[UIDatePicker alloc] init];
    [datePicker setAutoresizingMask:(UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight)];
    [datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    datePicker.minimumDate=[NSDate date];
    datePicker.minuteInterval = 5;
    int daysToAdd = 1;
    NSDate* tomorrow = [[NSDate date] dateByAddingTimeInterval:60*60*24*daysToAdd];
    [datePicker setDate:tomorrow animated:YES];
    
    self.text =[dropDownTimeFormatter stringFromDate:tomorrow];
    [datePicker addTarget:self action:@selector(timeChanged:) forControlEvents:UIControlEventValueChanged];
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    
    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
    self.inputAccessoryView = toolbar;
    self.inputAccessoryView = toolbar;
    self.inputAccessoryView = toolbar;
    self.inputView = datePicker;

    
}
-(void)doneClicked:(UIBarButtonItem*)button
{
    
 
    [self endEditing:YES];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
        {
        [self initialize];
        }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
        {
        [self initialize];
        }
    return self;
}

-(void)setSelectedItem:(NSString *)selectedItem
{
    NSDate *date = [dropDownTimeFormatter dateFromString:selectedItem];
    if (date)
        {
        _selectedItem = selectedItem;
        self.text = @"";
        [self insertText:selectedItem];
        [datePicker setDate:date animated:YES];
        }
}




@end
