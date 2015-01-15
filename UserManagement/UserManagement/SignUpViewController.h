//
//  SignUpViewController.h
//  UserManagement
//
//  Created by NUS Staff on 1/14/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
{
    NSString *stringSecond;
}
@property (strong, nonatomic) NSMutableArray *listuser;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfigPassword;
@property (strong, nonatomic) NSString *email;
- (IBAction)btnSignUp_Click:(id)sender;

@end
