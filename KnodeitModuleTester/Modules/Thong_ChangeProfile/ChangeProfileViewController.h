//
//  ChangeProfileViewController.h
//  Demo
//
//  Created by Ngoc Thong on 1/20/15.
//
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"

@interface ChangeProfileViewController : KNBaseViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    
    __weak IBOutlet UIImageView *imageview;
    __weak IBOutlet MHTextField *tf_mobile;
    __weak IBOutlet MHTextField *tf_firstName;
    __weak IBOutlet MHTextField *tf_lastName;
    __weak IBOutlet MHTextField *tf_fullName;
    __weak IBOutlet UIButton *BT_IMG;
}
@property int profile_id;
- (IBAction)bt_close_click:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bt_save;
- (IBAction)bt_save_click:(id)sender;
- (IBAction)bt_changeimage_click:(id)sender;


@property id<UserDelegate>delegate;

@end
