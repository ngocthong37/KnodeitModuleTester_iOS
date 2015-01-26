//
//  ChangeProfileViewController.m
//  Demo
//
//  Created by Ngoc Thong on 1/20/15.
//
//

#import "ChangeProfileViewController.h"
#import "Data_Text.h"
#import "User+Helper.h"

@interface ChangeProfileViewController ()

@end

//NSArray *profile;
User *user;
NSArray *dataPicker;
NSString *imagePath;

@implementation ChangeProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    user=[self.delegate user];
    
    [self load_profile];
    
    [self createPickerGender];
    [self BackgroundTap];
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
}

-(void)load_profile{

    //profile=[self.delegate.user componentsSeparatedByString:@"\t"];
//    tf_name.text=profile[2];
//    tf_gender.text=profile[3];
//    
//    imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",profile[0]]];
    
    tf_name.text=user.fullName;
    tf_gender.text=user.gender;
    imagePath=[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",user.email]];
    imageview.image=[UIImage imageWithContentsOfFile:imagePath];
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

- (IBAction)bt_close_click:(id)sender {
    [self performSegueWithIdentifier:@"segue_profile_list" sender:nil];
}

- (IBAction)bt_save_click:(id)sender {
//    Data_Text *data_text=[[Data_Text alloc]init];
//    NSString *aString=[data_text readfile];
//    NSString *cString=[NSString stringWithFormat:@"%@\t%@\t%@\t%@",profile[0],profile[1],tf_name.text,tf_gender.text];
//    aString=[aString stringByReplacingOccurrencesOfString:self.delegate.profile withString:cString];
//    [data_text writefile:aString];
//    
//    
//    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"ddMMyyyy-HHmmss"];
//    NSString *ret = [formatter stringFromDate:[NSDate date]];
//    NSString *imageName = [NSString stringWithFormat:@"%@", ret ];
//    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",imageName]];
    
    user.fullName=tf_name.text;
    user.gender=tf_gender.text;
    
    NSArray* users=[[NSArray alloc]initWithObjects:user, nil];
    [user parseUser:users];
    
    [UIImageJPEGRepresentation(imageview.image, 0.5f) writeToFile:imagePath atomically:YES];
    
    [self.delegate reload];
    
    [self performSegueWithIdentifier:@"segue_profile_list" sender:nil];
    
}

- (IBAction)bt_changeimage_click:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate=self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *img=[info objectForKey:UIImagePickerControllerOriginalImage];
    imageview.image=img;
    //    NSLog(@"%@",imageURL);
}

@end
