//
//  User.h
//  Demo
//
//  Created by Ngoc Thong on 1/27/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSSet *friends;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addFriendsObject:(Friend *)value;
- (void)removeFriendsObject:(Friend *)value;
- (void)addFriends:(NSSet *)values;
- (void)removeFriends:(NSSet *)values;

@end
