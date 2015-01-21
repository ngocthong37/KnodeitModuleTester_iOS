//
//  SignUp.h
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import <UIKit/UIKit.h>
@interface SignUpViewController : KNBaseViewController< UIImagePickerControllerDelegate,UINavigationControllerDelegate >{
    
    __weak IBOutlet UITextField *tf_email;
    __weak IBOutlet UITextField *tf_password;
    __weak IBOutlet UITextField *tf_confirm;
    __weak IBOutlet UIImageView *imgUser;

}
- (IBAction)bt_signup_click:(id)sender;
- (IBAction)bt_cancel_click:(id)sender;
- (IBAction)bt_img:(id)sender;



@end
