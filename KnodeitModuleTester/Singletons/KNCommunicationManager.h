//
//  KNCommunicationManager.h
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//
// Manager for communication APIs with backend.
#import <Foundation/Foundation.h>
#import "YDRequest.h"
#import "MyFeed.h"

#define CompleteBlock (void (^)(NSData *data, BOOL success)) // Block called when action is completed

@interface KNCommunicationManager : NSObject


// Login action
+ (void) actionLoginUser:(NSString*)userName withPassword:(NSString*)password completion:CompleteBlock blockComplete;

// Register actoin
+ (void) actionRegisterUser:(NSString*)userName withEmail:(NSString*)email withPassword:(NSString*)password completion:CompleteBlock blockComplete;

// Register mobile(phone number) action
+ (void) actionRegisterMobile:(NSString*)mobile withUserName:(NSString*)userName completion:CompleteBlock blockComplete;

// Upload feed action
+ (void) actionUploadFeed:(MyFeed*) feed completion:CompleteBlock blockComplete;

// Upload device token action
+ (void) actionUpdateToken:(NSData*) token comletion:CompleteBlock blockComplete;

// Check a phone number is registered in backend.
+ (void) actionCheckExistanceMobile:(NSString*) mobile completion:CompleteBlock blockComplete;
@end
