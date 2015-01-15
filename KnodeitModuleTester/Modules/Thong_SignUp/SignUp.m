//
//  SignUp.m
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import "SignUp.h"
#import "NSString+Validator.h"
#import "Data_Text.h"

Data_Text *data_text;
@interface SignUp ()

@end

@implementation SignUp

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

- (IBAction)bt_signup_click:(id)sender {
    //code xu ly dien kien
    
    //xu ly email
    if(tf_email.text.length==0)
    {
        [self Alert:@"Email is null"];
        return;
    }
    else if(![tf_email.text validateEmail])
    {
        [self Alert:@"Wrong Email"];
        return;
    }
    else
    {
        NSString *textFromFile=[data_text readfile];
        NSArray *ArrayUsers=[textFromFile componentsSeparatedByString:@"\n"];
        for(int i=0;i<ArrayUsers.count;i++)
        {
            NSString *email=[ArrayUsers[i] componentsSeparatedByString:@"\t"][0];
            if([email isEqualToString:tf_email.text])
            {
                [self Alert:@"Email is exist"];
                return;
            }
        }
    }
    
    //xu ly password va confirm
    if(tf_password.text.length==0)
    {
        [self Alert:@"Password is null"];
        return;
    }
    else if(tf_password.text.length<5)
    {
        [self Alert:@"Minimal length 5"];
        return;
    }
    if(tf_confirm.text.length==0)
    {
        [self Alert:@"Confirm is null"];
        return;
    }
    else if(tf_confirm.text.length<5)
    {
        [self Alert:@"Minimal length 5"];
        return;
    }
    if(![tf_confirm.text isEqualToString:tf_password.text])
    {
        [self Alert:@"Wrong Confirm"];
        return;
    }
    
    // luu nguoi dung moi
    NSString *aString=[NSString stringWithFormat:@"%@\t%@",tf_email.text,tf_password.text];
    [data_text writefile_addtext:aString];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)bt_cancel_click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)Alert:(NSString*)message{
    UIAlertView  *alert= [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil,nil];
    [alert show];
}



@end
