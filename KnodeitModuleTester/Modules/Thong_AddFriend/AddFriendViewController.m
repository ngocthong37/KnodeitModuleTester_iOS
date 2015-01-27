//
//  AddFriendViewController.m
//  Demo
//
//  Created by Ngoc Thong on 1/27/15.
//
//

#import "AddFriendViewController.h"
#import "Friend+Helper.h"
#import "User+Helper.h"


#define random(min,max) ((arc4random() % (max-min+1)) + min)
@interface AddFriendViewController ()

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self BackgroundTap];

}

-(void)BackgroundTap{
    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapRecognizer];
}
-(void)handleBackgroundTap:(UITapGestureRecognizer*)sender{
    [tf_firstName resignFirstResponder];
    [tf_fullName resignFirstResponder];
    [tf_lastName resignFirstResponder];
    [tf_mobile resignFirstResponder];
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

- (IBAction)bt_cancel_click:(id)sender {
    [self performSegueWithIdentifier:@"segue_add_list" sender:nil];
}

- (IBAction)bt_save_click:(id)sender {
    Friend *friend=[[Friend alloc]init];
    friend.firstName=tf_firstName.text;
    friend.fullName=tf_fullName.text;
    friend.lastName=tf_lastName.text;
    friend.mobile=tf_mobile.text;
    
    int temp=random(100, 1000);
    friend.photo=[NSString stringWithFormat:@"%d.jpeg",temp];
    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%d.jpeg",temp]];
    [UIImageJPEGRepresentation(imageview.image, 0.5f) writeToFile:imagePath atomically:YES];
    
    User *currentUser = [self.delegate user];
    NSArray *friends=[[NSArray alloc]initWithObjects:friend, nil];
    [Friend parseFriend:friends forUser:currentUser];
    
    [self.delegate reload];
    [self performSegueWithIdentifier:@"segue_add_list" sender:nil];
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
    
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    imageview.image=image;
}
@end