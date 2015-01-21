//
//  SignUpViewController.h
//  UserManagement
//
//  Created by NUS Staff on 1/14/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "BaseViewControlClass.h"
@interface SignUpViewController : BaseClass  <UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
=======

@interface SignUpViewController : UIViewController
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
{
    NSString *stringSecond;
}
@property (strong, nonatomic) NSMutableArray *listuser;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfigPassword;
@property (strong, nonatomic) NSString *email;
<<<<<<< HEAD
@property (strong, nonatomic) IBOutlet BaseButton *btnSignUp;
@property (strong, nonatomic) IBOutlet BaseButton *btnCancel;
@property (strong, nonatomic) IBOutlet UIImageView *imgUser;
@property (strong, nonatomic) IBOutlet UIButton *btnChangeImage;
@property (strong, nonatomic) IBOutlet UIPickerView *PKGender;
- (IBAction)btnChangeImage_Click:(id)sender;
- (IBAction)btnSignUp_Click:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtGender;
@property (strong, nonatomic) NSArray *gender;
=======
- (IBAction)btnSignUp_Click:(id)sender;

>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
@end
