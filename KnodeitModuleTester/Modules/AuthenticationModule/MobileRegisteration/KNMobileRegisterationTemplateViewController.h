//
//  KNMobileRegisterationTemplateViewController.h
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//
// Interface of template view controller which is used to register phone number with country code.

#import "KNBaseViewController.h"
#import "KNTextFieldWithColored.h"

@interface KNMobileRegisterationTemplateViewController : KNBaseViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

// Textfield of mobile number
@property (weak, nonatomic) IBOutlet KNTextFieldWithColored *mobileNumberTF;

// Textfield of country name
@property (weak, nonatomic) IBOutlet KNTextFieldWithColored *countryTF;

// check if country picker view is up
@property (nonatomic) BOOL isPickerViewUp;

// callback when current mobile number is registered
- (void) registeredMobile:(NSDictionary*)returnData;

@end
