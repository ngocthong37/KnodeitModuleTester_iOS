//
//  BaseClass.m
//  UserManagement
//
//  Created by NUS Staff on 1/16/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "BaseViewControlClass.h"

@interface BaseClass ()

@end

@implementation BaseClass

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor colorWithRed:0.0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
