//
//  BaseButton.m
//  UserManagement
//
//  Created by NUS Staff on 1/16/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
-(void)setBackgroudforButtonwith:(UIColor *)Color
{
    self.backgroundColor=Color;
}
@end
