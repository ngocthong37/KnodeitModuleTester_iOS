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
#import "Friend+Helper.h"

@interface ChangeProfileViewController ()

@end

//NSArray *profile;
User *user;
Friend *friend;
NSArray *dataPicker;
NSString *imagePath;

@implementation ChangeProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    user=[self.delegate user];
    friend=[self.delegate friend];
    
    [self load_profile];
    [self BackgroundTap];
}




-(void)BackgroundTap{
    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapRecognizer];
}
-(void)handleBackgroundTap:(UITapGestureRecognizer*)sender{
    [tf_firstName resignFirstResponder];
    [tf_mobile resignFirstResponder];
    [tf_lastName resignFirstResponder];
    [tf_fullName resignFirstResponder];
}

-(void)load_profile{

    //profile=[self.delegate.user componentsSeparatedByString:@"\t"];
//    tf_name.text=profile[2];
//    tf_gender.text=profile[3];
//    
//    imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",profile[0]]];
    
//    tf_name.text=user.fullName;
//    tf_gender.text=user.gender;
//    imagePath=[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",user.email]];
//    imageview.image=[UIImage imageWithContentsOfFile:imagePath];
    
    tf_firstName.text=friend.firstName;
    tf_mobile.text=friend.mobile;
    tf_lastName.text=friend.lastName;
    tf_fullName.text=friend.fullName;
    imagePath=[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@",friend.photo]];
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

-(void)Alert:(NSString*)message{
    UIAlertView  *alert= [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil,nil];
    [alert show];
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
    
    NSString *imageName=[self.delegate friend].photo;
    NSArray* friends=[[NSArray alloc]initWithObjects:[self.delegate friend], nil];
    [Friend deleteFriends:friends];
    
    friend=[Friend friendAlreadyExistInDB:tf_fullName.text :[self.delegate user]];
    if(friend)
    {
        [self Alert:@"Full name is exist"];
        return;
    }
    friend=[[Friend alloc]init];
    friend.fullName=tf_fullName.text;
    friend.mobile=tf_mobile.text;
    friend.lastName=tf_lastName.text;
    friend.firstName=tf_firstName.text;
    friend.photo=imageName;

    
    friends=[[NSArray alloc]initWithObjects:friend, nil];
    [Friend parseFriend:friends forUser:user];
    
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
