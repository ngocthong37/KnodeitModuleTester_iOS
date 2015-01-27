//
//  List.h
//  Demo
//
//  Created by Ngoc Thong on 1/15/15.
//
//

#import <UIKit/UIKit.h>

@protocol UserDelegate <NSObject>

-(void)reload;
@property User* user;
@property Friend* friend;
@end
@interface ListViewController : KNBaseTableViewController<UITableViewDataSource, UITableViewDelegate, UserDelegate>

- (IBAction)bt_logout_click:(id)sender;
- (IBAction)bt_add_click:(id)sender;

@end
