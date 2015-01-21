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
#import "TableViewController.h"
#import "EditViewController.h"
@interface ViewController ()


@end


@implementation ViewController
@synthesize txtEmail;
@synthesize txtPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listuser = [[NSMutableArray alloc] init];
   // [self loadInitialData];
    self.Account=[self readfile];
    NSArray *Array=[self.Account componentsSeparatedByString:@"\n"];
    for (NSString *ac in Array) {
        User*ur=[[User alloc] init];
        ur.Email=[ac componentsSeparatedByString:@" "][0];
        ur.Password=[ac componentsSeparatedByString:@" "][1];
        [self.listuser addObject: ur];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)readfile{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"User" ofType:@"txt"];
    NSLog(filePath);
    if (filePath) {
        NSString *myText = [NSString stringWithContentsOfFile:filePath];
        if (myText)
        {
            return myText;
        }  
    }
    return nil;
}

- (IBAction)btnLogin_Click:(id)sender {
    bool flag=true;
    for (User*ur in self.listuser) {
        if([ur.Email isEqualToString:txtEmail.text] && [ur.Password isEqualToString:txtPassword.text])
        {
            flag=true;
            [self performSegueWithIdentifier:@"conditionSegue" sender:nil];
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
    if([segue.identifier isEqualToString:@"conditionSegue"])
    {
        TableViewController *TVC =(TableViewController*)[segue destinationViewController];
        TVC.listuser=self.listuser;
        UIAlertView  *alert= [[UIAlertView alloc] initWithTitle:@"Wellcome"
                                                        message:txtEmail.text
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,nil];
        [alert show];

    }
    
}
- (IBAction)btnCancel_Click:(UIStoryboardSegue *)unwindSegue {
}
- (IBAction)btnEditSave_Click:(UIStoryboardSegue *)unwindSegue {
    EditViewController *source = [unwindSegue sourceViewController];
    if(![source.txtPass.text isEqualToString:source.txtConfigPass.text])
    {
        UIAlertView  *alert= [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                        message:@"Password and Config Password not the same"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,nil];
        [alert show];
    }
    else
    {
        UIAlertView  *alert= [[UIAlertView alloc] initWithTitle:@"Waring"
                                                           message:@"Password Change Success"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,nil];
        [alert show];
        for (User* ur in self.listuser) {
            if(ur.Email==source.txtEmail.text)
            {
                ur.Password=source.txtPass.text;
            }
        }
    }
}
@end
