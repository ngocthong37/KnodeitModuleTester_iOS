//
//  ViewController.m
//  UserManagement
//
//  Created by NUS Staff on 1/14/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "SignUpViewController.h"

@interface ViewController ()


@end


@implementation ViewController
@synthesize txtEmail;
@synthesize txtPassword;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.listuser = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)loadInitialData {
    User *user1 = [[User alloc] init];
    user1.Email = @"user1@yahoo.com";
    user1.Password=@"user123";
    User *user2 = [[User alloc] init];
    user2.Email = @"user2@yahoo.com";
    user2.Password=@"user123";
    User *user3 = [[User alloc] init];
    user3.Email = @"user3@yahoo.com";
    user3.Password=@"user123";
    User *user4 = [[User alloc] init];
    user4.Email = @"user4@yahoo.com";
    user4.Password=@"user123";
    [self.listuser addObject: user1];
    [self.listuser addObject: user2];
    [self.listuser addObject: user3];
    [self.listuser addObject: user4];
    
}



- (IBAction)btnLogin_Click:(id)sender {
    bool flag=true;
    for (User*ur in self.listuser) {
        if([ur.Email isEqualToString:txtEmail.text] && [ur.Password isEqualToString:txtPassword.text])
        {
            flag=true;
            break;
        }
        else
        {
            flag=false;
        }
    }
    if(!flag)
    {
        UIAlertView  *alert= [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                    message:@"Wrong Password or Email"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil,nil];
        [alert show];
    }
}

- (IBAction)btnFgPass_Click:(id)sender {

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"segueSignupView"] ){
    
        SignUpViewController *VC = (SignUpViewController*)[segue destinationViewController];
        VC.email= self.txtEmail.text;
        VC.listuser=self.listuser;
    }
}
- (IBAction)btnCancel_Click:(UIStoryboardSegue *)unwindSegue {
    UIViewController* sourceViewController = unwindSegue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[UIViewController class]])
    {
        NSLog(@"Coming from BLUE!");
    }
}
@end
