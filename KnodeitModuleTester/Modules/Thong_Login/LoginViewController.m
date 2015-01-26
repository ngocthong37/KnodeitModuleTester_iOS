//
//  Login.m
//  Demo
//
//  Created by Ngoc Thong on 1/14/15.
//
//

#import "LoginViewController.h"
#import "NSString+Validator.h"
#import "Data_Text.h"

Data_Text *data_text;
@interface LoginViewController ()

@end

@implementation LoginViewController

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
    data_text=[[Data_Text alloc]init];
    //tf_email.keyboardType=UIKeyboardTypeEmailAddress;
    [self BackgroundTap];
    
    tf_email.text=@"thong@gmail.com";
    tf_password.text=@"thong";
}

//-(void)file{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"USERS" ofType:@"txt"];
//    NSData *userFileData = [[NSData alloc] initWithContentsOfFile:path];
//    [userFileData writeToFile:@"USERS.txt" atomically:YES];
//     //[[NSFileManager defaultManager] createFileAtPath:@"/Documents/UESRS.txt" contents:userFileData attributes:nil];
//
//}

-(void)BackgroundTap{
    
    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapRecognizer];
}
-(void)handleBackgroundTap:(UITapGestureRecognizer*)sender{
    [tf_email resignFirstResponder];
    [tf_password resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(Boolean)login:(NSString*)email :(NSString*)password{

    User *user=[User userAlreadyExistInDB:email];
    NSLog(@"%@",user);
    if(!user)
        return false;
    else if(![user.password isEqualToString:password])
            return false;
    else
        return true;
}


- (IBAction)bt_login_click:(id)sender {
    /*
    NSMutableString *textFromFile=[NSMutableString stringWithFormat:@"%@",data_text.readfile];
    NSArray *ArrayUsers=[textFromFile componentsSeparatedByString:@"\n"];
    bool flag=false;
    
    NSString *uid_pwd=[NSString stringWithFormat:@"%@\t%@",tf_email.text,tf_password.text];
    for(int i=0;i<ArrayUsers.count;i++)
    {
        //if([ArrayUsers[i] isEqualToString:uid_pwd])
        if([ArrayUsers[i] hasPrefix:uid_pwd])
        {
            flag=true;
            break;
        }
    }
    
    
    if(flag)
    {
        [self performSegueWithIdentifier:@"segue_login_list" sender:nil];
        tf_email.text=@"";
        tf_password.text=@"";
    }
    else
    {
        [self Alert:@"Wrong email or password"];
    }
     */
    
    tf_email.isEmailField=true;
    if(![tf_email validate])
    {
        [self Alert:@"Wrong Email"];
        return;
    }
    
    bool b=[self login:tf_email.text :tf_password.text];
    if(b)
    {
        [self performSegueWithIdentifier:@"segue_login_list" sender:nil];
        tf_email.text=@"";
        tf_password.text=@"";
    }
    else
    {
        [self Alert:@"Wrong email or password"];
    }
}



- (IBAction)bt_signup_click:(id)sender {
    
}

-(void)Alert:(NSString*)message{
    UIAlertView  *alert= [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil,nil];
    [alert show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if([textField.restorationIdentifier isEqualToString:@"tf_email"])
        [self becomeActive:tf_password];
    else if([textField.restorationIdentifier isEqualToString:@"tf_password"])
        //[self bt_login_click:nil];
        [self handleBackgroundTap:nil];
    return true;
}

- (void)becomeActive:(UITextField*)textField
{
    //[self setToolbarCommand:YES];
    [self resignFirstResponder];
    [textField becomeFirstResponder];
}


@end
