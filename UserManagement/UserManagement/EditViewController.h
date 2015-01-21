//
//  EditViewController.h
//  UserManagement
//
//  Created by NUS Staff on 1/15/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
<<<<<<< HEAD
#import "BaseViewControlClass.h"
@interface EditViewController :BaseClass <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPass;
@property (strong, nonatomic) IBOutlet UITextField *txtFName;
@property (strong, nonatomic) IBOutlet UITextField *txtLName;
@property (strong, nonatomic) IBOutlet UITextField *txtGender;
@property (strong, nonatomic) IBOutlet UIImageView *imgUser;
@property (strong, nonatomic) IBOutlet UIButton *btnChangeImg;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnEdit;

@property (strong, nonatomic) NSMutableArray *listuser;

@property (strong, nonatomic) NSArray *listgender;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *pass;
@property (strong, nonatomic) NSString *fname;
@property (strong, nonatomic) NSString *lname;
@property (strong, nonatomic) NSString *gender;
- (IBAction)btnEdit_Click:(id)sender;
=======
@interface EditViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtConfigPass;
@property (strong, nonatomic) IBOutlet UITextField *txtPass;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *pass;

>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
@end
