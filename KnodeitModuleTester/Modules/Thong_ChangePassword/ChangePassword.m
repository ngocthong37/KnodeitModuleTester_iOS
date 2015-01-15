//
//  ChangePassword.m
//  Demo
//
//  Created by Ngoc Thong on 1/15/15.
//
//

#import "ChangePassword.h"
#import "Data_Text.h"

Data_Text *data_text;
@interface ChangePassword ()

@end

@implementation ChangePassword

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
    lb_email.text=[self.user componentsSeparatedByString:@"\t"][0];
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

- (IBAction)bt_cancel_click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)bt_change_click:(id)sender {
    if (tf_oldpassword.text.length==0 || tf_newpassword.text.length==0 || tf_confirm.text.length==0) {
        [self Alert:@"password is null"];
        return;
    } else if(tf_oldpassword.text.length<5 || tf_newpassword.text.length<5 || tf_confirm.text.length<5){
        [self Alert:@"Minimal length 5"];
        return;
    }
    
    if(![tf_oldpassword.text isEqualToString:[self.user componentsSeparatedByString:@"\t"][1]])
    {
        [self Alert:@"Wrong Old Password"];
        return;
    }
    
    if(![tf_newpassword.text isEqualToString:tf_confirm.text]){
        [self Alert:@"Wrong Confirm"];
        return;
    }
    
    NSString *aString=[data_text readfile];
    aString=[aString stringByReplacingOccurrencesOfString:[self user] withString:[NSString stringWithFormat:@"%@\t%@",lb_email.text,tf_newpassword.text]];

    [data_text writefile:aString];
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
