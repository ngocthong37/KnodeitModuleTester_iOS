//
//  Message.h
//  POC
//
//  Created by Peter van de Put on 25/05/2014.
//  Copyright (c) 2014 Yourdeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Message : NSManagedObject

@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSDate * revealDate;

@end
