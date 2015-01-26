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
@property NSString* profile;

@end
@interface ListViewController : KNBaseTableViewController<UITableViewDataSource, UITableViewDelegate, UserDelegate>

- (IBAction)bt_logout_click:(id)sender;

@end
