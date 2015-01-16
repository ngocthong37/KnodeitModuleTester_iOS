//
//  EditViewController.h
//  UserManagement
//
//  Created by NUS Staff on 1/15/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface EditViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtConfigPass;
@property (strong, nonatomic) IBOutlet UITextField *txtPass;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *pass;

@end
