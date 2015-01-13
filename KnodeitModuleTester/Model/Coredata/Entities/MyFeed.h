//
//  MyFeed.h
//  POC
//
//  Created by Peter van de Put on 25/05/2014.
//  Copyright (c) 2014 Yourdeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MyFeed : NSManagedObject

@property (nonatomic, retain) NSString * filePath;
@property (nonatomic, retain) NSString * revealDate;
@property (nonatomic, retain) NSString * friendsString;
@property (nonatomic, retain) NSNumber * uploaded;
@property (nonatomic, retain) NSString * feedID;


@end
 
