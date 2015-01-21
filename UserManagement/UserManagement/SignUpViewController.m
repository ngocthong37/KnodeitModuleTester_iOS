//
//  SignUpViewController.m
//  UserManagement
//
//  Created by NUS Staff on 1/14/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "SignUpViewController.h"
#import "LoginViewController.h"
#import "User.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize btnCancel;
@synthesize btnSignUp;
@synthesize imgUser;
@synthesize gender;
@synthesize PKGender;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtEmail.text = self.email;
    [btnCancel setBackgroudforButtonwith:[UIColor colorWithRed:0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [btnSignUp setBackgroudforButtonwith:[UIColor colorWithRed:0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0]];
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.dataSource = self;
    picker.delegate = self;
    self.txtGender.inputView = picker;
    self.gender = @[@"Male",@"Female",@"Other"];
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
#pragma mark picker view datasource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.gender.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.gender objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.txtGender.text = self.gender[row];
    [self.txtGender resignFirstResponder];
}


#pragma mark imagePickerController
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissModalViewControllerAnimated:YES];
    imgUser.image = image;
}


-(void)btnChangeImage_Click:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate=self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:imagePickerController animated:YES];

}

-(void)saveImage:(UIImage*)img
{
    NSString *imageName = self.txtEmail.text;
    
    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpg",imageName]];
    [UIImageJPEGRepresentation(img, 0.5f) writeToFile:imagePath atomically:YES];

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

-(void)writefile:(NSString*)aString{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"DataUser.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    NSString *addString=[NSString stringWithFormat:@"%@\n%@",self.readfile,aString];
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
        newUser.Password=self.txtPassword.text;
        newUser.FName=self.txtFName.text;
        newUser.LName=self.txtLName.text;
        newUser.Gender=self.txtGender.text;
        NSString* add=[NSString stringWithFormat:@"%@ %@ %@ %@ %@",self.txtEmail.text,self.txtPassword.text,self.txtFName.text, self.txtLName.text, self.txtGender.text];
        [self writefile:add];
        [self saveImage:imgUser.image];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Success"
                                                      message:@"Sign Up Success"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show];

    }
    
}


@end
