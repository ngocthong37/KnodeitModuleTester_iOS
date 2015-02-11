//
//  DetailViewController.m
//  Demo
//
//  Created by Ngoc Thong on 1/29/15.
//
//

#import "DetailViewController.h"
#import "ListViewController.h"

@interface DetailViewController (){
    NSString *email;
    NSArray *dataPicker;
    User *currentUser;
    NSMutableDictionary *user;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    email=[self.delegate user].email;
    
    //[self createPickerGender];
    [self load];
    [self BackgroundTap];
}
-(void)load{
//    currentUser=[User userAlreadyExistInDB:email];
//    tf_fullName.text=currentUser.fullName;
//    tf_gender.text=currentUser.gender;

//    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",currentUser.email]];
//    imageview.image=[UIImage imageWithContentsOfFile:imagePath];
    
    
    [self load_profile];
}

-(void)load_profile{
    lb1.text=@"token";
    lb2.text=@"id";
    
    user=[self.delegate current_user];
    tf_1.text=user[@"authentication_token"];
    tf_2.text=[user[@"id"]stringValue];
    tf_1.enabled=false;
    tf_2.enabled=false;
    imageview.hidden=true;
    bt_img.hidden=true;
    bt_save.enabled=false;
   }


-(void)BackgroundTap{
    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapRecognizer];
}
-(void)handleBackgroundTap:(UITapGestureRecognizer*)sender{
    [tf_gender resignFirstResponder];
    [tf_fullName resignFirstResponder];

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


- (IBAction)bt_img_click:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate=self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    //imagePickerController.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    imageview.image=image;
}


- (IBAction)bt_save_click:(id)sender {
    currentUser.fullName=tf_fullName.text;
    currentUser.gender=tf_gender.text;
    
    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",currentUser.email]];
    [UIImageJPEGRepresentation(imageview.image, 0.5f) writeToFile:imagePath atomically:YES];

    NSArray *Users=[[NSArray alloc]initWithObjects:currentUser, nil];
    [User parseUser:Users];
    
    [self load];
}

- (IBAction)bt_cancel_click:(id)sender {
    [self load];
}
@end
