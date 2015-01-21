//
//  CustomTableViewCell.h
//  Demo
//
//  Created by Ngoc Thong on 1/20/15.
//
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *lb_name;
@property (weak, nonatomic) IBOutlet UILabel *lb_gender;

@end
