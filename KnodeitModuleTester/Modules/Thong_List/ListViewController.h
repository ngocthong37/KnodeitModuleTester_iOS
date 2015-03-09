//
//  ListViewController.h
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

@property NSMutableDictionary *current_user;
@property NSString* password;
@end
@interface ListViewController : KNBaseViewController<UITableViewDataSource, UITableViewDelegate, UserDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)bt_logout_click:(id)sender;
- (IBAction)bt_add_click:(id)sender;

@end
