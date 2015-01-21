//
//  TableViewController.h
//  UserManagement
//
//  Created by NUS Staff on 1/15/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface TableViewController : UITableViewController
@property (strong,nonatomic) NSMutableArray *listuser;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *pass;
@property (strong, nonatomic) NSString *fname;
@property (strong, nonatomic) NSString *lname;
@property (strong, nonatomic) NSString *gender;
@property int rowedit;
@end
