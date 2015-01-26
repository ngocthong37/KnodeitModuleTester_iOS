//
//  User+Helper.m
//  Demo
//
//  Created by Ngoc Thong on 1/26/15.
//
//

#import "User+Helper.h"
#import "CoreDataManager.h"

@implementation User (Help)
-(id)init{
    
    self = [[CoreDataManager sharedInstance] intitializeAnEntityObjectByEntityName:@"User" withClass:[User class] withIsForSaving:false];
    if (self) {
    }
    return self;
}

-(void)copyDataFromObject:(User*)source{
    self.email= source.email;
    self.password=source.password;
}

#pragma mark - User
+(User *)userAlreadyExistInDB:(NSString *)recordid{
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"email LIKE %@",recordid];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if([fetchedObjects count]==1){
        return  (User *)[fetchedObjects objectAtIndex:0];
    }
    else{
        return nil;
    }
}

- (NSMutableArray*)fetchAllUsers{
    NSMutableArray * allUsers = [NSMutableArray arrayWithCapacity:0];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"User"
                                   inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    NSError *error=nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(fetchedObjects){
        for (NSManagedObject *obj in fetchedObjects){
            
            //strong typecast
            User *user = (User *)obj;
            
            [allUsers addObject:user];
        }
    }
    
    return allUsers;
}

- (NSArray *) parseUser:(NSArray*) users{
    NSMutableArray * usersList =[NSMutableArray arrayWithCapacity:0];
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    
    for ( User * userRecord in users ){
        User *user = [User userAlreadyExistInDB:userRecord.email];
        
        if (!user) {
            
            user =[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        }
        
        user.email = userRecord.email;
        user.password=userRecord.password;
        user.fullName=userRecord.fullName;
        user.gender=userRecord.gender;
        
        [usersList addObject:user];
    }
    
    NSError *error = nil;
    if (![context  save:&error]){
        
    }
    
    return usersList;
}

- (NSArray*) deleteUsers:(NSArray*) users{
    
    NSMutableArray * usersList =[NSMutableArray arrayWithCapacity:0];
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    
    for (User * userRecord in users ){
        User *user = [User userAlreadyExistInDB:userRecord.email];
        
        if (user) {
            
            [context deleteObject:user];
            
            [usersList addObject:user];
        }
    }
    
    NSError *error = nil;
    if (![context  save:&error]){
        
    }
    
    return usersList;
}

- (BOOL) deleteAllUsers{
    
    NSMutableArray *users = [self fetchAllUsers];
    
    for (User *item in users) {
        
        [self.managedObjectContext deleteObject:item];
    }
    
    NSError *error = nil;
    if (![self.managedObjectContext  save:&error]){
        
    }
    
    return true;
}

- (NSArray*) parseToSaveLocalImagePathUsers:(NSArray*) users{
    NSMutableArray * usersList =[NSMutableArray arrayWithCapacity:0];
    NSManagedObjectContext *context = [CoreDataManager sharedInstance].managedObjectContext;
    
    for ( User * userRecord in users ){
        User *user = [User userAlreadyExistInDB:userRecord.email];
        
        if (user) {
            
            // Remove old image
            //[NSFileManager removeImage:car.localImagePath];
            //car.localImagePath = carRecord.localImagePath;
            //[carsList addObject:car];
        }
    }
    
    NSError *error = nil;
    if (![context  save:&error]){
        
    }
    
    return usersList;
}

@end
