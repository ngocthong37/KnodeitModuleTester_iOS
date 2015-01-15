//
//  Login.h
//  Demo
//
//  Created by Ngoc Thong on 1/14/15.
//
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController{
    
    __weak IBOutlet UITextField *tf_email;
    __weak IBOutlet UITextField *tf_password;
}
- (IBAction)bt_login_click:(id)sender;
- (IBAction)bt_signup_click:(id)sender;


-(NSString*)readfile;
-(void)Alert:(NSString*)message;
@end
