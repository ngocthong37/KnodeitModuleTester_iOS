//
//  ChangeProfileViewController.m
//  Demo
//
//  Created by Ngoc Thong on 1/20/15.
//
//

#import "ChangeProfileViewController.h"
#import "Data_Text.h"

@interface ChangeProfileViewController ()

@end

NSArray *profile;
NSArray *dataPicker;

@implementation ChangeProfileViewController
@synthesize data=_data;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    profile=[_data componentsSeparatedByString:@"\t"];
    
    [self load_profile];
    
   dataPicker=@[@"Male", @"Female",@"Other"];
    UIPickerView *picker=[[UIPickerView alloc]init];
    picker.dataSource=self;
    picker.delegate=self;
    tf_gender.inputView=picker;
    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapRecognizer];
}

-(void)handleBackgroundTap:(UITapGestureRecognizer*)sender{
    [tf_name resignFirstResponder];
    [tf_gender resignFirstResponder];
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

-(void)load_profile{
    tf_name.text=profile[2];
    tf_gender.text=profile[3];
    image.image=[UIImage imageNamed:profile[4]];
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)bt_save_click:(id)sender {
    Data_Text *data_text=[[Data_Text alloc]init];
    NSString *aString=[data_text readfile];
    NSArray *temp=[_data componentsSeparatedByString:@"\t"];
    NSString *cString=[NSString stringWithFormat:@"%@\t%@\t%@\t%@\t%@.jpeg",temp[0],temp[1],tf_name.text,tf_gender.text,tf_gender.text];
    aString=[aString stringByReplacingOccurrencesOfString:_data withString:cString];
    [data_text writefile:aString];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
    image.image=img;
    //    NSLog(@"%@",imageURL);
}

@end
