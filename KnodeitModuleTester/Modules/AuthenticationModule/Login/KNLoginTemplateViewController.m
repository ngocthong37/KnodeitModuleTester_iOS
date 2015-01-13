//
//  KNLoginTemplateViewController.m
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//

#import "KNLoginTemplateViewController.h"
#import "KNConstants.h"
#import "Manager.h"
#import "KeychainItemWrapper.h"

@interface KNLoginTemplateViewController ()

@end

@implementation KNLoginTemplateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.rememberUserFlag = [[NSUserDefaults standardUserDefaults] boolForKey:kRememberPassword];

    if ( self.rememberUserFlag )
    {
        
        KeychainItemWrapper *keychainPasswordItem = [[KeychainItemWrapper alloc] initWithIdentifier:kItemNameKeychainPassowrd accessGroup:nil];
        
        self.tfUsername.text = [keychainPasswordItem objectForKey:(__bridge id)kSecAttrAccount];
        self.tfPassword.text = [keychainPasswordItem objectForKey:(__bridge id)kSecValueData];
        
        if (self.tfUsername.text.length != 0 && self.tfPassword.text.length != 0)
        {
            [self doLogin:nil];
        }
    }
    self.btnRemember.selected = self.rememberUserFlag;
    
}

#pragma mark - IB Actions

-(IBAction)doLogin:(id)sender{
    [self dismissKeyboard];
    
    
    if (self.tfUsername.text.length == 0 || self.tfPassword.text.length == 0) {
        if (self.tfUsername.text.length >=1) {
            if (self.tfPassword.text.length==0) {
                [self showMessage:@"Empty Password"];
                
            }
        } else {
            [self showMessage:@"Enter username"];
            
        }
        
    } else {
        
        
        //try login
        
        [KNCommunicationManager actionLoginUser:self.tfUsername.text withPassword:self.tfPassword.text completion:^(NSData *data, BOOL success) {
            if(success){
                NSError* error=nil;
                NSDictionary* returnData = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:data  options:kNilOptions  error:&error];
                NSString* errString = returnData[@"err"];
                if (errString.length>0)
                    [self showMessage:errString];
                else{
                    [UserManager sharedInstance].currentUser = returnData;
                    
                    // Don't save again when logged using saved password
                    if ( self.rememberUserFlag && sender != nil)
                    {
                        KeychainItemWrapper *keychainPasswordItem = [[KeychainItemWrapper alloc] initWithIdentifier:kItemNameKeychainPassowrd accessGroup:nil];
                        
                        [keychainPasswordItem setObject:self.tfUsername.text forKey:(__bridge id)kSecAttrAccount];
                        [keychainPasswordItem setObject:self.tfPassword.text forKey:(__bridge id)kSecValueData];
                    }
                    [[NSUserDefaults standardUserDefaults] setBool:self.rememberUserFlag forKey:kRememberPassword];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    [self loggedUser:returnData];
                    
                }
            }
            else{
                [self showMessage:@"Couldn't login"];
            }

        }];
    }
}

- (IBAction)onClickRemember:(id)sender
{
    self.btnRemember.selected = !self.btnRemember.selected;
    self.rememberUserFlag = self.btnRemember.selected;
}

#pragma mark - Logged user
- (void) loggedUser:(NSDictionary *)userData{
    // Should define action after login
}

#pragma mark - Alert

-(void)showMessage:(NSString *)msg{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Error" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - dismiss keyboard

- (void)dismissKeyboard
{
    if([self.tfUsername isFirstResponder]) {
        [self.tfUsername resignFirstResponder];
    }
    if([self.tfPassword isFirstResponder]) {
        [self.tfPassword resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.tfPassword = nil;
    self.tfUsername = nil;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self setTfUsername:nil];
    [self setTfPassword:nil];
}
@end
