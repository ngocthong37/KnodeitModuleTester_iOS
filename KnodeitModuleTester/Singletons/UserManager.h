//
//  UserManager.h
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//
// Manager of current user info
#import <Foundation/Foundation.h>

@interface UserManager : NSObject

// Get singleton instance
+ (UserManager*)sharedInstance;

//Current user infomation
@property (strong,nonatomic) NSDictionary* currentUser;

- (BOOL) hasSavedUser;

@end
