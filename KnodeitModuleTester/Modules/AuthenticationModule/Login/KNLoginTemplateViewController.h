//
//  KNLoginTemplateViewController.h
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//
//
// Interface of template log in view controller which has user name & password text field.
#import "KNBaseViewController.h"



@interface KNLoginTemplateViewController : KNBaseViewController

// Textfield of user name
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;

// Textfield of password
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

// Check button of remember password
@property (weak, nonatomic) IBOutlet UIButton *btnRemember;

// Flag to remember the user info to avoid re-input password.
@property (assign, nonatomic) BOOL rememberUserFlag;


// Action for login button
-(IBAction)doLogin:(id)sender;


// Callback when the user is logged successfully
-(void) loggedUser:(NSDictionary*) userData;

@end
