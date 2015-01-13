//
//  KNRegisterTemplateViewController.m
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//

#import "KNRegisterTemplateViewController.h"
#import "Manager.h"
#import "NSString+Validator.h"

@interface KNRegisterTemplateViewController ()

@end

@implementation KNRegisterTemplateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setEdgesForExtendedLayout:UIRectEdgeTop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [self setTfUsername:nil];
    [self setTfEmail:nil];
    [self setTfPassword:nil];
    [self setTfConfirm:nil];
    
    [super viewDidUnload];
    
}


#pragma mark - IB Actions

-(IBAction)doRegister:(id)sender
{
    
    [self dismissKeyboard];
    
    BOOL bError = NO;
    if(self.tfUsername.text.length == 0) {
        [self.tfUsername setErrorStateWithText:@"Input Username!"];
//        [self showMessage:@"Please enter Username"];
        bError = YES;
    }
    
    if(self.tfEmail.text.length == 0) {
//        [self showMessage:@"Please enter Email"];
        [self.tfEmail setErrorStateWithText:@"Input Email!"];
        bError = YES;
    }
    else if(![self.tfEmail.text validateEmail]) {
//        [self showMessage:@"Invalid Email Address"];
        [self.tfEmail setErrorStateWithText:@"Wrong Email!"];
        bError = YES;
    }
    
    if ( self.tfPassword.text.length == 0 )
    {
        [self.tfPassword setErrorStateWithText:@"Input Password"];
        bError = YES;
    } else  if(self.tfPassword.text.length < 5) {
//        [self showMessage:@"Password must be at least 5 characters"];
        [self.tfPassword setErrorStateWithText:@"Minimal length 5!"];
        bError = YES;
    }
    
    if(self.tfConfirm.text.length == 0)
    {
        [self.tfConfirm setErrorStateWithText:@"Input Password"];
        bError = YES;
    } else if(self.tfConfirm.text.length < 5) {
        //        [self showMessage:@"Password must be at least 5 characters"];
        [self.tfConfirm setErrorStateWithText:@"Minimal length 5!"];
        bError = YES;
    }
    else if(![self.tfPassword.text isEqualToString:self.tfConfirm.text]) {
        [self.tfConfirm setErrorStateWithText:@"Should Match two passwords!"];
        bError = YES;
    }

    if ( bError )
        return;
    
    [KNCommunicationManager actionRegisterUser:self.tfUsername.text withEmail:self.tfEmail.text withPassword:self.tfPassword.text completion:^(NSData *data, BOOL success) {
        if(success){
            NSError* error=nil;
            NSDictionary* returnData = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:data  options:kNilOptions  error:&error];
            NSString* errString =  returnData[@"err"];
            if (errString.length>0)
                [self showMessage:errString];
            else{
                [UserManager sharedInstance].currentUser = returnData;
                [self registeredUser:returnData];
                
            }
        }
        else{
            [self showMessage:@"Couldn't register"];
        }
    }];

    
}

#pragma mark - message

-(void)showMessage:(NSString *)msg{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Error" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - keyboard

- (void)dismissKeyboard
{
    if([self.tfUsername isFirstResponder])
        [self.tfUsername resignFirstResponder];
    if([self.tfEmail isFirstResponder])
        [self.tfEmail resignFirstResponder];
    if([self.tfPassword isFirstResponder])
        [self.tfPassword resignFirstResponder];
    if([self.tfConfirm isFirstResponder])
        [self.tfConfirm resignFirstResponder];
}


#pragma mark - Registered 

-(void) registeredUser:(NSDictionary*) userData{
    
}

@end
