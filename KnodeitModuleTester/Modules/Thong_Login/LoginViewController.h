//
//  LoginViewController.h
//  Demo
//
//  Created by Ngoc Thong on 1/14/15.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : KNBaseViewController <UITextFieldDelegate>{
    
}
@property (weak, nonatomic) IBOutlet UIButton *btLogin;
@property (weak, nonatomic) IBOutlet UIButton *btSignUp;
@property (weak, nonatomic) IBOutlet MHTextField *_tf_email;
@property (weak, nonatomic) IBOutlet MHTextField *_tf_password;


- (IBAction)bt_login_click:(id)sender;
- (IBAction)bt_signup_click:(id)sender;


@end
