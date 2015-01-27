//
//  Friend.h
//  Demo
//
//  Created by Ngoc Thong on 1/27/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * mobile;
@property (nonatomic, retain) NSString * photo;
@property (nonatomic, retain) User *user;

@end
