//
//  CustomTableViewCell.m
//  Demo
//
//  Created by Ngoc Thong on 1/20/15.
//
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize image=_image;
@synthesize lb_name=_name;
@synthesize lb_gender=_gender;

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor=[UIColor colorWithRed:35.0/255 green:211.0/255 blue:255.0/255 alpha:1.0];
    self.lb_name.textColor=[UIColor blueColor];
    self.lb_gender.textColor=[UIColor blueColor];
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
