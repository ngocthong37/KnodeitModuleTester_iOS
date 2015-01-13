//
//  SignUp.h
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import <UIKit/UIKit.h>
#import "KNAppDelegate.h"
#import <CoreData/CoreData.h>

@interface SignUp : UIViewController{
    
    __weak IBOutlet UITextField *tf_email;
    __weak IBOutlet UITextField *tf_password;
    __weak IBOutlet UITextField *tf_confirm;
    __weak IBOutlet UILabel *lb;
}

- (IBAction)bt_signup_click:(id)sender;

@end
