//
//  CoreDataManager.h
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//
// Manager for core data ( local database )
#import <Foundation/Foundation.h>
#import "Friend.h"
#import "KNConstants.h"
#import "MyFeed.h"
#import "Message.h"

@interface CoreDataManager : NSObject

// Context for CoreData
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

// Object model for CoreData
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

// Persistent store coordinator for CoreData
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


// Save context
- (void)saveContext;

- (id)intitializeAnEntityObjectByEntityName:(NSString *)name withClass:(Class)class withIsForSaving:(BOOL)forSaving;

// Get singleton instance
+ (CoreDataManager*)sharedInstance;

@end
