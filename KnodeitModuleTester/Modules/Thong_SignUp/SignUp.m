//
//  SignUp.m
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import "SignUp.h"
#import "NSString+Validator.h"

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
        NSString *textFromFile=[self readfile];
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
        [self Alert:@"inimal length 5"];
        return;
    }
    if(tf_confirm.text.length==0)
    {
        [self Alert:@"Confirm is null"];
        return;
    }
    else if(tf_confirm.text.length<5)
    {
        [self Alert:@"inimal length 5"];
        return;
    }
    if([tf_confirm.text isEqualToString:tf_password.text])
    {
        [self Alert:@"Wrong Confirm"];
        return;
    }
    
    // luu nguoi dung moi
    NSString *aString=[NSString stringWithFormat:@"%@\t%@",tf_email.text,tf_password.text];
    [self writefile:aString];
    
}
- (IBAction)bt_cancel_click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//ghi file
-(void)writefile:(NSString*)aString{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"USERS.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    NSString *addString=[NSString stringWithFormat:@"%@\n%@",self.readfile,aString];
    [[addString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
}

//doc file
-(NSString*)readfile{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"USERS.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    NSMutableString *textFromFile;
    if(filePath)
    {
        textFromFile=[NSMutableString stringWithContentsOfFile:fileAtPath encoding:NSUTF8StringEncoding error:nil];
        return textFromFile;
    }
    return @"";
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
