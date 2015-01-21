//
//  CustomCellTableViewCell.h
//  UserManagement
//
//  Created by NUS Staff on 1/20/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel* lbFName;
@property (nonatomic,weak) IBOutlet UILabel* lbLName;
@property (nonatomic,weak) IBOutlet UILabel* lbGender;
@property (nonatomic,weak) IBOutlet UIImageView* imgUser;

@end
