//
//  ViewController.m
//  UserManagement
//
//  Created by NUS Staff on 1/14/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import "SignUpViewController.h"
#import "TableViewController.h"
#import "EditViewController.h"
@interface ViewController ()


@end


@implementation ViewController
@synthesize txtEmail;
@synthesize txtPassword;
@synthesize btnLogin;
@synthesize btnPassword;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.listuser = [[NSMutableArray alloc] init];
   // [self loadInitialData];
    self.Account=[self readfile];
    [btnLogin setBackgroudforButtonwith:[UIColor colorWithRed:0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [btnPassword setBackgroudforButtonwith:[UIColor colorWithRed:0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0]];
    NSArray *Array=[self.Account componentsSeparatedByString:@"\n"];
    for (NSString *ac in Array) {
        if(![ac isEqualToString:@""])
        {
        User*ur=[[User alloc] init];
        ur.Email=[ac componentsSeparatedByString:@" "][0];
        ur.Password=[ac componentsSeparatedByString:@" "][1];
        ur.FName=[ac componentsSeparatedByString:@" "][2];
        ur.LName=[ac componentsSeparatedByString:@" "][3];
        ur.Gender=[ac componentsSeparatedByString:@" "][4];
        [self.listuser addObject: ur];
        }
    }
    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapRecognizer];
}

-(void)handleBackgroundTap:(UITapGestureRecognizer*)sender{
    [txtPassword resignFirstResponder];
    [txtEmail resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    -(NSString*)readfile{
        NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString* fileName = @"DataUser.txt";
        NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
        NSMutableString *textFromFile;
        if(filePath)
        {
            textFromFile=[NSMutableString stringWithContentsOfFile:fileAtPath encoding:NSUTF8StringEncoding error:nil];
            return textFromFile;
        }
        return @"";
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

    if([segue.identifier isEqualToString:@"conditionSegue"])
    {
        UINavigationController *NVC =(UINavigationController*)[segue destinationViewController];
        
        TableViewController *TVC = (TableViewController *)NVC.viewControllers[0];
        
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
    [self viewDidLoad];
}
- (IBAction)btnEditSave_Click:(UIStoryboardSegue *)unwindSegue {
     [self viewDidLoad];
}
@end
