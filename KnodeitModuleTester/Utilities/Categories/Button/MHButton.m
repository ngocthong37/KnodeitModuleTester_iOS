//
//  MHButton.m
//  Demo
//
//  Created by Ngoc Thong on 1/19/15.
//
//

#import "MHButton.h"

@implementation MHButton

#define bgColor [UIColor colorWithRed:52.0f/255 green:184.0f/255 blue:221.0f/255 alpha:1]
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)awakeFromNib{
    [super awakeFromNib];

    [self setup];
}


-(void)setup{
    //self.backgroundColor=bgColor;
}


@end
