//
//  SimpleTableCell.m
//  UserManagement
//
//  Created by NUS Staff on 1/20/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell

@synthesize lbFName;
@synthesize lbGender;
@synthesize lbLName;
@synthesize imgUser;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
