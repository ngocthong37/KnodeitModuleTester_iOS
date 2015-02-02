//
//  Friend+Helper.m
//  Demo
//
//  Created by Ngoc Thong on 1/27/15.
//
//

#import "Friend+Helper.h"

@implementation Friend (Help)
-(id)init{
    
    self = [[CoreDataManager sharedInstance] intitializeAnEntityObjectByEntityName:@"Friend" withClass:[Friend class] withIsForSaving:false];
    if (self) {
    }
    return self;
}

-(void)copyDataFromObject:(Friend*)source{
    self.user=source.user;
}

#pragma mark - Friend
+(Friend *)friendAlreadyExistInDB:(NSString *)recordid :(User*)user{
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Friend" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"fullName LIKE %@ and user.email like %@",recordid,user.email];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if([fetchedObjects count]==1){
        return  (Friend *)[fetchedObjects objectAtIndex:0];
    }
    else{
        return nil;
    }
}

+(Friend *)friendAlreadyExistInDB:(NSString *)recordid{
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Friend" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"fullName LIKE %@ ",recordid];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if([fetchedObjects count]==1){
        return  (Friend *)[fetchedObjects objectAtIndex:0];
    }
    else{
        return nil;
    }
}


+ (NSMutableArray*)fetchAllFriends:(NSString*)email{
    
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    NSMutableArray * allFriends = [NSMutableArray arrayWithCapacity:0];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Friend"
                                   inManagedObjectContext:context];
    

    [fetchRequest setEntity:entity];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"user.email LIKE %@",email];
    [fetchRequest setPredicate:predicate];

    NSError *error=nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if(fetchedObjects){
        for (NSManagedObject *obj in fetchedObjects){
            
            //strong typecast
            Friend *friend = (Friend *)obj;
            [allFriends addObject:friend];
        }
    }
    
    return allFriends;
}
+ (NSMutableArray*)fetchAllFriends{
    
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    NSMutableArray * allFriends = [NSMutableArray arrayWithCapacity:0];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Friend"
                                   inManagedObjectContext:context];
    
    
    [fetchRequest setEntity:entity];
    NSError *error=nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if(fetchedObjects){
        for (NSManagedObject *obj in fetchedObjects){
            
            //strong typecast
            Friend *friend = (Friend *)obj;
            [allFriends addObject:friend];
        }
    }
    
    return allFriends;
}


+ (NSArray *) parseFriend:(NSArray*) friends forUser:(User *)user{
    NSMutableArray * friendsList =[NSMutableArray arrayWithCapacity:0];
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    
    for ( Friend * friendRecord in friends ){
        Friend *friend = [Friend friendAlreadyExistInDB:friendRecord.fullName :user];
        
        if (!friend) {
            
            friend =[NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:context];
        }
        friend.firstName=friendRecord.firstName;
        friend.fullName=friendRecord.fullName;
        friend.lastName=friendRecord.lastName;
        friend.mobile=friendRecord.mobile;
        friend.photo=friendRecord.photo;
        
        // get user from db basing on user input parameter
        
        User *currentUser = [User userAlreadyExistInDB:user.email];
        friend.user = currentUser;
        [friendsList addObject:friend];
    }
    
    NSError *error = nil;
    if (![context  save:&error]){
        
    }
    
    return friendsList;
}

+ (NSArray*) deleteFriends:(NSArray*) friends{
    
    NSMutableArray * friendsList =[NSMutableArray arrayWithCapacity:0];
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    
    for (Friend * friendRecord in friends ){
        Friend *friend = [Friend friendAlreadyExistInDB:friendRecord.fullName];
        
        if (friend) {
            
            [context deleteObject:friend];
            
            [friendsList addObject:friend];
        }
    }
    
    NSError *error = nil;
    if (![context  save:&error]){
        
    }
    
    return friendsList;
}

+ (BOOL) deleteAllFriends{
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    NSMutableArray *friends = [self fetchAllFriends];
    
    for (Friend *item in friends) {
        
        [context deleteObject:item];
    }
    
    NSError *error = nil;
    if (![context  save:&error]){
        
    }
    
    return true;
}

@end