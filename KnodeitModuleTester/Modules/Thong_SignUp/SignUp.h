//
//  SignUp.h
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import <UIKit/UIKit.h>
@interface SignUp : UIViewController{
    
    __weak IBOutlet UITextField *tf_email;
    __weak IBOutlet UITextField *tf_password;
    __weak IBOutlet UITextField *tf_confirm;

}
- (IBAction)bt_signup_click:(id)sender;
- (IBAction)bt_cancel_click:(id)sender;



@end
