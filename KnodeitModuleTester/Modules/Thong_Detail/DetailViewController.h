//
//  DetailViewController.h
//  Demo
//
//  Created by Ngoc Thong on 1/29/15.
//
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"

@interface DetailViewController : KNBaseViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource,UIPickerViewDelegate>{
    
    __weak IBOutlet UIImageView *imageview;
    __weak IBOutlet MHTextField *tf_fullName;
    __weak IBOutlet MHTextField *tf_gender;
    __weak IBOutlet UIButton *bt_img;
    __weak IBOutlet UIBarButtonItem *bt_save;
    
    //dung cho webservice
    __weak IBOutlet UILabel *lb1;
    __weak IBOutlet UILabel *lb2;
    __weak IBOutlet MHTextField *tf_1;
    __weak IBOutlet MHTextField *tf_2;
}
- (IBAction)bt_img_click:(id)sender;
- (IBAction)bt_save_click:(id)sender;
- (IBAction)bt_cancel_click:(id)sender;

@property id<UserDelegate>delegate;

@end
