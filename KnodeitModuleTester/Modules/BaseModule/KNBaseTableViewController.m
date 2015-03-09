//
//  KNBaseTableViewController.m
//  whippCustomer
//
//  Created by Thach Bui-Khac on 8/18/14.
//  Copyright (c) 2014 Knodeit.com. All rights reserved.
//

#import "KNBaseTableViewController.h"
#import "KNConstants.h"

@interface KNBaseTableViewController ()

@end

@implementation KNBaseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    self.view.backgroundColor = [UIColor colorWithRed:35.0/255 green:211.0/255 blue:255.0/255 alpha:1.0];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_3"]];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"na_bg"]]];

    
    
    
    //    // set font and style for navigation item title
    //    [self.navigationController.navigationBar setTitleTextAttributes:
    //     [NSDictionary
    //      dictionaryWithObjectsAndKeys:
    //      kCommonForegroundColor, NSForegroundColorAttributeName,
    //      [UIFont fontWithName:kRegularFontName size:17.0], NSFontAttributeName, nil]];
    //
    //    [[UIBarButtonItem appearance] setTitleTextAttributes:
    //     [NSDictionary
    //      dictionaryWithObjectsAndKeys:
    //      kCommonForegroundColor, NSForegroundColorAttributeName,
    //      [UIFont fontWithName:kLightFontName size:14.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //
    //    // Set title of Back button to empty
    //    self.navigationItem.backBarButtonItem =
    //    [[UIBarButtonItem alloc] initWithTitle:@""
    //                                     style:UIBarButtonItemStyleBordered
    //                                    target:nil
    //                                    action:nil];
    //
    //    self.navigationController.navigationBar.tintColor = kNavigationBarItemColor;
    //
    //    // Set background color for view
    //    self.view.backgroundColor = kViewBackgroundColor;
    
    //    self.appDelegate = (KNAppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
