//
//  KNRegisterTemplateViewController.h
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//
// Interface of template register view controller which has user name, email, password, confirm password.
#import "KNBaseViewController.h"
#import "KNTextFieldWithColored.h"

@interface KNRegisterTemplateViewController : KNBaseViewController


// Action for register button
-(IBAction)doRegister:(id)sender;

// Textfield of user name
@property (weak, nonatomic) IBOutlet KNTextFieldWithColored *tfUsername;

// Textfield of email
@property (weak, nonatomic) IBOutlet KNTextFieldWithColored *tfEmail;

// Textfield of password
@property (weak, nonatomic) IBOutlet KNTextFieldWithColored *tfPassword;

// Textfield of password confirm
@property (weak, nonatomic) IBOutlet KNTextFieldWithColored *tfConfirm;


// Callback when the user is registered
-(void) registeredUser:(NSDictionary*) userData;

@end
