//
//  ChangeProfileViewController.m
//  Demo
//
//  Created by Ngoc Thong on 1/20/15.
//
//

#import "ChangeProfileViewController.h"
#import "Data_Text.h"

#import "Friend+Helper.h"

@interface ChangeProfileViewController ()

@end

//NSArray *profile;
User *user;
Friend *friend;
NSArray *dataPicker;
NSString *imagePath;
NSMutableDictionary *data_profile;

@implementation ChangeProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //load du lieu tu core data
    user=[self.delegate user];
    friend=[self.delegate friend];
    
    [self load];
    [self BackgroundTap];
    [self textfiled];
}

-(void)textfiled{
    [tf_firstName setleft:10];
    [tf_fullName setleft:10];
    [tf_lastName setleft:10];
    [tf_mobile setleft:10];
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

-(void)load{
    
    //profile=[self.delegate.user componentsSeparatedByString:@"\t"];
    //    tf_name.text=profile[2];
    //    tf_gender.text=profile[3];
    //
    //    imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",profile[0]]];
    
    //    tf_name.text=user.fullName;
    //    tf_gender.text=user.gender;
    //    imagePath=[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@.jpeg",user.email]];
    //    imageview.image=[UIImage imageWithContentsOfFile:imagePath];
    
    //load tu CoreData
    //    tf_firstName.text=friend.firstName;
    //    tf_mobile.text=friend.mobile;
    //    tf_lastName.text=friend.lastName;
    //    tf_fullName.text=friend.fullName;
    //    imagePath=[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@",friend.photo]];
    //    imageview.image=[UIImage imageWithContentsOfFile:imagePath];
    
    //load tu webservice
    [self load_profile_id];
}


-(void)load_profile_id{
    tf_fullName.placeholder=@"middle name";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"email": [self.delegate current_user][@"email"],
                             @"auth_token":[self.delegate current_user][@"authentication_token"]
                             };
    //    NSString *url=[NSString stringWithFormat:@"%@/%d?email=%@&auth_token=%@",kAPIProfile,self.profile_id,[self.delegate current_user][@"email"],[self.delegate current_user][@"authentication_token"]];
    
    NSString *url=[NSString stringWithFormat:@"%@/%d",kAPIProfile,self.profile_id];
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        NSError *err;
        NSData *dataJSon=[NSJSONSerialization dataWithJSONObject:responseObject options:0 error:&err];
        NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:dataJSon options:0 error:&err];
        
        NSMutableDictionary *profile=dic[@"profile"];
        
        if(profile[@"first_name"]!=(id)[NSNull null])
            tf_firstName.text=profile[@"first_name"];
        if(profile[@"last_name"]!=(id)[NSNull null])
            tf_lastName.text=profile[@"last_name"];
        if(profile[@"middle_name"]!=(id)[NSNull null])
            tf_fullName.text=profile[@"middle_name"];
        if(profile[@"person"][@"phone_number"]!=(id)[NSNull null])
            tf_mobile.text=profile[@"person"][@"phone_number"];
        if(profile[@"person"][@"image_url"][@"thumb"]!=(id)[NSNull null]){
            NSURL *image_url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kWebURL,profile[@"person"][@"image_url"][@"thumb"]]];
            [imageview setImageWithURL:image_url];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"Error: %@", error);
        [self Alert:[NSString stringWithFormat:@"%@",error]];
    }];
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
    
    
    //luu voi CoreData
    //    NSString *imageName=[self.delegate friend].photo;
    //    NSArray* friends=[[NSArray alloc]initWithObjects:[self.delegate friend], nil];
    //    [Friend deleteFriends:friends];
    //
    //    friend=[Friend friendAlreadyExistInDB:tf_fullName.text :[self.delegate user]];
    //    if(friend)
    //    {
    //        [self Alert:@"Full name is exist"];
    //        return;
    //    }
    //    friend=[[Friend alloc]init];
    //    friend.fullName=tf_fullName.text;
    //    friend.mobile=tf_mobile.text;
    //    friend.lastName=tf_lastName.text;
    //    friend.firstName=tf_firstName.text;
    //    friend.photo=imageName;
    //
    //
    //    friends=[[NSArray alloc]initWithObjects:friend, nil];
    //    [Friend parseFriend:friends forUser:user];
    //
    //    [UIImageJPEGRepresentation(imageview.image, 0.5f) writeToFile:imagePath atomically:YES];
    //
    //    [self.delegate reload];
    //    [self performSegueWithIdentifier:@"segue_profile_list" sender:nil];
    
    //luu voi webservice
    
    [self save_profile_webservice];
}

-(void)save_profile_webservice{
    int temp=rand();
    NSString *filename=[NSString stringWithFormat:@"%d.jpg",temp];
    NSData *image_data=UIImageJPEGRepresentation(imageview.image, 0.5);
    NSString *url=[NSString stringWithFormat:@"%@/%d",kAPIProfile,self.profile_id];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"email": [self.delegate current_user][@"email"],
                             @"auth_token":[self.delegate current_user][@"authentication_token"],
                             @"profile[first_name]":tf_firstName.text,
                             @"profile[last_name]":tf_lastName.text,
                             @"profile[middle_name]":tf_fullName.text
                             };
    //    NSString *url=[NSString stringWithFormat:@"%@/%d?email=%@&auth_token=%@",kAPIProfile,self.profile_id,[self.delegate current_user][@"email"],[self.delegate current_user][@"authentication_token"]];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"PUT" URLString:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:image_data name:@"profile[image]" fileName:filename mimeType:@"image/jpeg"];
    } error:nil];
    
    AFHTTPRequestOperation *op = [manager HTTPRequestOperationWithRequest:request success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        if([responseObject[@"success"]boolValue]){
            [self.delegate reload];
            [self performSegueWithIdentifier:@"segue_profile_list" sender:nil];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [[NSOperationQueue mainQueue] addOperation:op];
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
