//
//  User.h
//  Demo
//
//  Created by Ngoc Thong on 1/26/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) NSString * gender;

@end
