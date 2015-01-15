//
//  ChangePassword.h
//  Demo
//
//  Created by Ngoc Thong on 1/15/15.
//
//

#import <UIKit/UIKit.h>

@interface ChangePassword : UIViewController{
    __weak IBOutlet UILabel *lb_email;
    __weak IBOutlet UITextField *tf_oldpassword;
    __weak IBOutlet UITextField *tf_newpassword;
    __weak IBOutlet UITextField *tf_confirm;
}
@property NSString *user;
- (IBAction)bt_cancel_click:(id)sender;
- (IBAction)bt_change_click:(id)sender;
@end
