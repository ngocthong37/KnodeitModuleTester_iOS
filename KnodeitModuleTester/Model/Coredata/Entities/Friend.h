//
//  Friend.h
//  POC
//
//  Created by Peter van de Put on 25/05/2014.
//  Copyright (c) 2014 Yourdeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friend : NSManagedObject
@property (nonatomic, retain) NSString * recordID;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * mobile;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * photo;
@end
