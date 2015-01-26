//
//  SignUp.m
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import "SignUpViewController.h"
#import "NSString+Validator.h"
#import "Data_Text.h"
#import "User+Helper.h"


@interface SignUpViewController ()

@end

Data_Text *data_text;
NSArray *dataPicker;
NSString *textFromFile;
@implementation SignUpViewController

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
    
    [self createPickerGender];
    [self BackgroundTap];
    textFromFile=[data_text readfile];
}

-(void)createPickerGender{
    dataPicker=@[@"Male", @"Female",@"Other"];
    UIPickerView *picker=[[UIPickerView alloc]init];
    picker.dataSource=self;
    picker.delegate=self;
    tf_gender.inputView=picker;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return dataPicker.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return dataPicker[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    tf_gender.text=dataPicker[row];
    [tf_gender resignFirstResponder];
}

-(void)BackgroundTap{
    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapRecognizer];
}
-(void)handleBackgroundTap:(UITapGestureRecognizer*)sender{
    [tf_name resignFirstResponder];
    [tf_gender resignFirstResponder];
    [tf_email resignFirstResponder];
    [tf_password resignFirstResponder];
    [tf_confirm resignFirstResponder];
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
//        NSArray *ArrayUsers=[textFromFile componentsSeparatedByString:@"\n"];
//        for(int i=0;i<ArrayUsers.count;i++)
//        {
//            NSString *email=[ArrayUsers[i] componentsSeparatedByString:@"\t"][0];
//            if([email isEqualToString:tf_email.text])
//            {
//                [self Alert:@"Email is exist"];
//                return;
//            }
//        }
        
        if([User userAlreadyExistInDB:tf_email.text])
        {
            [self Alert:@"Email is exist"];
            return;
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
//    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",tf_email.text]];
//    [UIImageJPEGRepresentation(imgUser.image, 0.5f) writeToFile:imagePath atomically:YES];
//    
//    NSString *aString=[NSString stringWithFormat:@"%@\t%@\t%@\t%@",tf_email.text,tf_password.text,tf_name.text,tf_gender.text];
//    [data_text writefile_addtext:aString];
//
    
    [self save_user:tf_email.text :tf_password.text :tf_name.text :tf_gender.text ];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)save_user:(NSString*)email :(NSString*)password :(NSString*)fullName :(NSString*)gender{
    User *user=[[User alloc]init];
    user.email=email;
    user.password=password;
    user.fullName=fullName;
    user.gender=gender;
    NSArray *users=[[NSArray alloc]initWithObjects:user, nil];
    [user parseUser:users];
}


- (IBAction)bt_cancel_click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)bt_img:(id)sender {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate=self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    //imagePickerController.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imagePickerController animated:YES completion:nil];

}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    // NSString *imageURL=[info objectForKey:UIImagePickerControllerReferenceURL];
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    
    
//    UIImage *image=[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    
//    UIImage *image=[UIImage imageWithContentsOfFile:imageURL];


    imgUser.image=image;
//    NSLog(@"%@",imageURL);
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
