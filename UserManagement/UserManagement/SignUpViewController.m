//
//  SignUpViewController.m
//  UserManagement
//
//  Created by NUS Staff on 1/14/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "SignUpViewController.h"
#import "ViewController.h"
#import "User.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize txtConfigPassword;
@synthesize txtPassword;
@synthesize txtEmail;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txtEmail.text = self.email;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSignUp_Click:(id)sender {
    int flag=0;
    for (User *ur in self.listuser) {
        if([self.txtEmail.text isEqualToString:ur.Email])
        {
            flag=1;
            break;
        }
    }
    if(![txtConfigPassword.text isEqualToString:txtPassword.text])
    {
        flag=2;
    }
    if(flag==1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"ERROR"
                                                      message:@"Email already exist"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show];
    }
    else if(flag==2)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"ERROR"
                                                      message:@"Config Password and Password not the same"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show];
    }
    else
    {
        User *newUser;
        newUser.Email=self.txtEmail.text;
        newUser.Password=self.txtEmail.text;
        [self.listuser addObject: newUser];
    }
    
}

@end
