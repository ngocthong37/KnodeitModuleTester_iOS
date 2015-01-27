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
}
- (IBAction)bt_cancel_click:(id)sender;
- (IBAction)bt_save_click:(id)sender;
- (IBAction)bt_img:(id)sender;


@property id<UserDelegate>delegate;
@end
