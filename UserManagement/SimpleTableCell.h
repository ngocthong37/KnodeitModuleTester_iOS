//
//  SimpleTableCell.h
//  UserManagement
//
//  Created by NUS Staff on 1/20/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgUser;
@property (strong, nonatomic) IBOutlet UILabel *lbFName;
@property (strong, nonatomic) IBOutlet UILabel *lbLName;
@property (strong, nonatomic) IBOutlet UILabel *lbGender;

@end
