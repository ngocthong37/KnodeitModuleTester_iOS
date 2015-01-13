//
//  USER.h
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface USER : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;

@end
