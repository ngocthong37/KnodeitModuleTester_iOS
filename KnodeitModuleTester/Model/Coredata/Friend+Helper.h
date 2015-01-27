//
//  Friend+Helper.h
//  Demo
//
//  Created by Ngoc Thong on 1/27/15.
//
//

#import "Friend.h"

@interface Friend (Help)

+ (NSArray *) parseFriend:(NSArray*) friends forUser:(User *)user;
+ (NSMutableArray*)fetchAllFriends:(NSString*)email;
+ (NSArray*) deleteFriends:(NSArray*) friends;

+(Friend *)friendAlreadyExistInDB:(NSString *)recordid;
@end
