//
//  AddFriendViewController.h
//  Demo
//
//  Created by Ngoc Thong on 1/27/15.
//
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"

@interface AddFriendViewController : KNBaseViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate, UIGestureRecognizerDelegate>{
    __weak IBOutlet MHTextField *tf_firstName;
    __weak IBOutlet MHTextField *tf_fullName;
    __weak IBOutlet MHTextField *tf_lastName;
    __weak IBOutlet MHTextField *tf_mobile;
    __weak IBOutlet UIImageView *imageview;
    
    //webservice
    __weak IBOutlet UILabel *lb_1;
    __weak IBOutlet UILabel *lb_2;
    __weak IBOutlet UILabel *lb_3;
    __weak IBOutlet UILabel *lb_4;
    __weak IBOutlet MHTextField *tf_1;
    __weak IBOutlet MHTextField *tf_2;
    __weak IBOutlet MHTextField *tf_3;
    __weak IBOutlet MHTextField *tf_4;
    
    
}
- (IBAction)bt_cancel_click:(id)sender;
- (IBAction)bt_save_click:(id)sender;
- (IBAction)bt_img:(id)sender;


@property id<UserDelegate>delegate;
@end
