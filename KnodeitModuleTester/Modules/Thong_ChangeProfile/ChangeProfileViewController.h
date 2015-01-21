//
//  ChangeProfileViewController.h
//  Demo
//
//  Created by Ngoc Thong on 1/20/15.
//
//

#import <UIKit/UIKit.h>

@interface ChangeProfileViewController : KNBaseViewController <UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    
    __weak IBOutlet UIImageView *imageview;
    __weak IBOutlet MHTextField *tf_gender;
    __weak IBOutlet MHTextField *tf_name;
}

- (IBAction)bt_close_click:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bt_save;
- (IBAction)bt_save_click:(id)sender;
- (IBAction)bt_changeimage_click:(id)sender;

@property NSString *data;
@end
