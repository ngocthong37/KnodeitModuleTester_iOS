//
//  User+Helper.h
//  Demo
//
//  Created by Ngoc Thong on 1/26/15.
//
//

#import "User.h"

@interface User (Help)
    
-(id)init;

//-(NSString *)getStatusStringFromStatus:(NSString*)status;

//-(void)copyDataFromObject:(User*)source;

//-(BOOL)isImageCached;

//+ (UIImage*)getImageFromURL:(NSString*)URL;

-(NSArray *) parseUser:(NSArray*) users;
- (NSMutableArray*)fetchAllUsers;
- (NSArray*) deleteUsers:(NSArray*) users;

+(User *)userAlreadyExistInDB:(NSString *)recordid;
@end
