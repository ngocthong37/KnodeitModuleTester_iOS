//
//  ViewController.h
//  UserManagement
//
//  Created by NUS Staff on 1/14/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpViewController.h"
#import "BaseViewControlClass.h"
#import "BaseButton.h"
@interface ViewController : BaseClass


@property NSMutableArray *listuser;

@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet BaseButton *btnLogin;
@property (strong, nonatomic) IBOutlet BaseButton *btnPassword;
@property (strong, nonatomic) NSString *Account;
- (IBAction)btnLogin_Click:(id)sender;
- (IBAction)btnFgPass_Click:(id)sender;
@end

