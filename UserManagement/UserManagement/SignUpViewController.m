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
-(NSString*)readfile{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"User.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    NSMutableString *textFromFile;
    if(filePath)
    {
        textFromFile=[NSMutableString stringWithContentsOfFile:fileAtPath encoding:NSUTF8StringEncoding error:nil];
        return textFromFile;
    }
    return @"";
}
-(void)writefile:(NSString*)aString{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"User.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    NSString *addString=[NSString stringWithFormat:@"%@\n%@",[self readfile],aString];
    [[addString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
}


- (IBAction)btnSignUp_Click:(id)sender {
    int flag=0;
    for (User *ur in self.listuser) {
        if([self.txtEmail.text isEqualToString:ur.Email])
        {
            flag=1;
            break;
        }
    }
    if(![self.txtConfigPassword.text isEqualToString:self.txtPassword.text])
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
        NSString* add=[NSString stringWithFormat:@"%@ %@",self.txtEmail.text,self.txtPassword.text];
        [self writefile:add];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Success"
                                                      message:@"Sign Up Success"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show];

    }
    
}

@end
