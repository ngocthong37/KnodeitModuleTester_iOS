//
//  EditViewController.m
//  UserManagement
//
//  Created by NUS Staff on 1/15/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "EditViewController.h"
<<<<<<< HEAD
#import "User.h"
#import "TableViewController.h"
=======

>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
@interface EditViewController ()

@end

@implementation EditViewController
<<<<<<< HEAD
@synthesize txtEmail;
@synthesize txtPass;
@synthesize txtFName;
@synthesize txtLName;
@synthesize txtGender;
@synthesize imgUser;
@synthesize btnEdit;
@synthesize btnChangeImg;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtEmail.text=self.email;
    txtPass.text=self.pass;
    txtFName.text=self.fname;
    txtLName.text=self.lname;
    txtGender.text=self.gender;
    txtFName.enabled=false;
    txtFName.selected=true;
    txtLName.enabled=false;
    txtLName.selected=true;
    txtGender.enabled=false;
    txtGender.selected=true;
    txtPass.enabled=false;
    txtPass.selected=true;
    txtEmail.enabled=false;
    btnChangeImg.hidden=true;
    imgUser.image=[UIImage imageNamed:@"user-blue.png"];
    imgUser.backgroundColor=[UIColor colorWithRed:160.0/255.0 green:160.0/255.0 blue:160.0/255.0 alpha:0.5];
    // Do any additional setup after loading the view.
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.dataSource = self;
    picker.delegate = self;
    txtGender.inputView = picker;
    self.listgender = @[@"Male",@"Female",@"Other"];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.listgender.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.listgender objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    txtGender.text = self.listgender[row];
    [txtGender resignFirstResponder];
=======

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtEmail.text=self.email;
    self.txtPass.text=self.pass;

    // Do any additional setup after loading the view.
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


<<<<<<< HEAD
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
    [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
}

- (IBAction)btnEdit_Click:(id)sender
{
    BOOL flag=false;
    if([[sender title] isEqualToString:@"Edit"] && flag==false)
    {
    txtFName.enabled=true;
    txtFName.selected=false;
    txtLName.enabled=true;
    txtLName.selected=false;
    txtGender.enabled=true;
    txtGender.selected=false;
    btnChangeImg.hidden=false;
    btnEdit.title=@"Save";
        imgUser.backgroundColor=[UIColor whiteColor];
    flag=true;
    }
    if([[sender title] isEqualToString:@"Save"] && flag==false)
    {
    txtFName.enabled=false;
    txtFName.selected=true;
    txtLName.enabled=false;
    txtLName.selected=true;
    txtGender.enabled=false;
    txtGender.selected=true;
    btnChangeImg.hidden=true;
    btnEdit.title=@"Edit";

    NSString *data=[self readfile];
    NSString *savedata=@"";
    NSString *userdata=@"";
    NSArray *array= [data componentsSeparatedByString:@"\n"];
    for (NSString* user in array)
    {
        if(![user isEqualToString:@""])
        {
            NSArray *add=[user componentsSeparatedByString:@" "];
            User *ur=[[User alloc] init];
            ur.Email=add[0];
            ur.Password=add[1];
            ur.FName=add[2];
            ur.LName=add[3];
            ur.Gender=add[4];
            if([ur.Email isEqualToString:txtEmail.text])
            {
                if(![ur.Gender isEqualToString:txtGender.text])
                {
                    ur.Gender=txtGender.text;
                }
                if(![txtLName.text isEqualToString:ur.LName])
                {
                    ur.LName=txtLName.text;
                }
                if(![txtFName.text isEqualToString:ur.FName])
                {
                    ur.FName=txtFName.text;
                }
            }
            userdata=[NSString stringWithFormat:@"%@ %@ %@ %@ %@\n",ur.Email,ur.Password,ur.FName,ur.LName,ur.Gender];
            savedata=[savedata stringByAppendingString:[NSString stringWithFormat:@"%@\n",userdata]];
        }
    }
        [self writefile:savedata];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Success"
                                                      message:@"Change User Infomation Success"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show];
    }
}

=======
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

<<<<<<< HEAD
=======

>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
@end
