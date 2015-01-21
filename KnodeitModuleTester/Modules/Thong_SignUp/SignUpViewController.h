//
//  SignUp.h
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import <UIKit/UIKit.h>
@interface SignUpViewController : KNBaseViewController< UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>{
    
    __weak IBOutlet MHTextField *tf_name;
    __weak IBOutlet MHTextField *tf_gender;
    __weak IBOutlet MHTextField *tf_email;
    __weak IBOutlet MHTextField *tf_password;
    __weak IBOutlet MHTextField *tf_confirm;
    __weak IBOutlet UIImageView *imgUser;

}
- (IBAction)bt_signup_click:(id)sender;
- (IBAction)bt_cancel_click:(id)sender;
- (IBAction)bt_img:(id)sender;



@end
