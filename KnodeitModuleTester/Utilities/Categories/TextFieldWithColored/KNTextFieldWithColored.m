//
//  KNTextFieldWithColored.m
//  EverAfter
//
//  Created by Jianying Shi on 6/25/14.
//
//

#import "KNTextFieldWithColored.h"

#define kDefaultBorderWidth 1.2f
#define kDefaultBorderColor [UIColor colorWithRed:52.0f/255 green:184.0f/255 blue:221.0f/255 alpha:1]
#define kLeftMargin         10

@implementation KNTextFieldWithColored
{
    BOOL bErrorState;
    NSString * errorString;
    NSString * backedPlaceholeder;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setBorderStyle:UITextBorderStyleNone];
 
    self.layer.borderColor = kDefaultBorderColor.CGColor;
    self.layer.borderWidth = kDefaultBorderWidth;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, kLeftMargin, kLeftMargin/2);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, kLeftMargin, kLeftMargin/2);
}

- (void) drawPlaceholderInRect:(CGRect)rect {
    NSDictionary *attributes;
    if ( bErrorState )
    {
        attributes = @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:self.font.pointSize], NSForegroundColorAttributeName : [UIColor redColor]};
        [self.placeholder drawInRect:CGRectInset(rect, kLeftMargin/2, kLeftMargin/2) withAttributes:attributes];
    }
    else{
        attributes = @{ NSFontAttributeName: [UIFont italicSystemFontOfSize:self.font.pointSize], NSForegroundColorAttributeName : [UIColor colorWithWhite:0.8 alpha:0.6]};

    }
    [self.placeholder drawInRect:CGRectInset(rect, kLeftMargin/2, kLeftMargin/2) withAttributes:attributes];
}

- (void) setErrorStateWithText:(NSString*) errorText
{
    bErrorState = YES;
    backedPlaceholeder = self.placeholder;
    self.text = @"";
    self.placeholder = errorText;
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 1.2*kDefaultBorderWidth;

}

- (void)textFieldDidBeginEditing:(NSNotification *) notification
{
    if ( bErrorState )
    {
        bErrorState = NO;
        self.layer.borderColor = kDefaultBorderColor.CGColor;
        self.layer.borderWidth = kDefaultBorderWidth;
        self.placeholder = backedPlaceholeder;
    }
    
    
    [super textFieldDidBeginEditing:notification];
}

@end
