//
//  Login.h
//  Demo
//
//  Created by Ngoc Thong on 1/14/15.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : KNBaseViewController <UITextFieldDelegate>{
    
    __weak IBOutlet MHTextField *tf_email;
    __weak IBOutlet MHTextField *tf_password;
}
- (IBAction)bt_login_click:(id)sender;
- (IBAction)bt_signup_click:(id)sender;

-(void)handleBackgroundTap:(UITapGestureRecognizer*)sender;

-(void)Alert:(NSString*)message;

@end
