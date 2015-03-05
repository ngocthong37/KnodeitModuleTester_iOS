//
//  CustomTableViewCell.m
//  Demo
//
//  Created by Ngoc Thong on 1/20/15.
//
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize imageview=_imageview;
@synthesize lb_name=_name;
@synthesize lb_1=_1;
@synthesize lb_2=_2;

- (void)awakeFromNib {
    // Initialization code
    UIColor *text_color=[UIColor whiteColor];
    self.lb_name.textColor=text_color;
    self.lb_1.textColor=text_color;
    self.lb_2.textColor=text_color;
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
