//
//  KNCommunicationManager.m
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//

#import "KNCommunicationManager.h"
#import "KNConstants.h"
#import "NSData+Base64.h"
#import "UserManager.h"

@implementation KNCommunicationManager

+ (void) actionLoginUser:(NSString*)userName withPassword:(NSString*)password completion:CompleteBlock blockComplete
{
    YDRequest *urlRequest = [[YDRequest alloc] initWithURL:[NSURL URLWithString:kAPILogin]
                                            withJSONDict:[NSDictionary dictionaryWithObjectsAndKeys:userName,@"username", password, @"password", nil]];
    
    [urlRequest startWithCompletion:^(YDRequest *request, NSData *data, BOOL success) {
        if ( blockComplete )
            blockComplete(data,success);
        
        if ( success )
        {
            if ( [UserManager sharedInstance].currentUser )
            {
                NSString * devToken = [[NSUserDefaults standardUserDefaults] stringForKey:kDeviceTokenKeyname];
                if ( devToken )
                {
                    [KNCommunicationManager actionUpdateWithStringToken:devToken comletion:nil];
                }
            }
        }
    }];

}

+ (void) actionRegisterUser:(NSString*)userName withEmail:(NSString*)email withPassword:(NSString*)password completion:CompleteBlock blockComplete
{
    
    YDRequest *urlRequest = [[YDRequest alloc] initWithURL:[NSURL URLWithString:kAPIRegister]
                                            withJSONDict:[NSDictionary dictionaryWithObjectsAndKeys:userName, @"username", email, @"email", password, @"password", nil]];
    [urlRequest startWithCompletion:^(YDRequest *request, NSData *data, BOOL success) {
        if ( blockComplete )
            blockComplete(data, success);
        if ( success )
        {
            if ( [UserManager sharedInstance].currentUser )
            {
                NSString * devToken = [[NSUserDefaults standardUserDefaults] stringForKey:kDeviceTokenKeyname];
                if ( devToken )
                {
                    [KNCommunicationManager actionUpdateWithStringToken:devToken comletion:nil];
                }
            }
        }
    }];

}

+ (void) actionRegisterMobile:(NSString*)mobile withUserName:(NSString*)userName completion:CompleteBlock blockComplete
{
    YDRequest *urlRequest = [[YDRequest alloc] initWithURL:[NSURL URLWithString:kAPIRegisterMobile]
                                              withJSONDict:[NSDictionary dictionaryWithObjectsAndKeys:userName, @"username", mobile, @"mobile", nil]];
    [urlRequest startWithCompletion:^(YDRequest *request, NSData *data, BOOL success) {
        if ( blockComplete )
            blockComplete(data, success);
    }];
}

+ (void) actionUploadFeed:(MyFeed*) feed completion:CompleteBlock blockComplete
{
    NSData *rawImageData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:feed.filePath]];
    NSString *rawImageString =  [rawImageData base64EncodedString];
    NSString * userName = [UserManager sharedInstance].currentUser[@"username"];
    YDRequest *urlRequest = [[YDRequest alloc] initWithURL:[NSURL URLWithString:kAPIUpload] withJSONDict:[NSDictionary dictionaryWithObjectsAndKeys:feed.revealDate, @"revealDate", userName, @"username", feed.friendsString, @"friends", rawImageString, @"imageData", nil]];
    
    [urlRequest startWithCompletion:^(YDRequest *request, NSData *data, BOOL success) {
        if ( blockComplete )
            blockComplete(data, success);
    }];
}

+ (void) actionUpdateToken:(NSData*) token comletion:CompleteBlock blockComplete
{
#if TARGET_IPHONE_SIMULATOR
    
#else
    
    NSString* cleanDeviceToken = [[[[token description]
                                    stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                   stringByReplacingOccurrencesOfString: @">" withString: @""]
                                  stringByReplacingOccurrencesOfString: @" " withString: @""];
    // NSLog(@"Register for remote notifications  %@", cleanDeviceToken);
    NSUserDefaults* userDefaults =[NSUserDefaults standardUserDefaults];
    [userDefaults setValue:cleanDeviceToken forKey:kDeviceTokenKeyname];
    [userDefaults synchronize];

    [KNCommunicationManager actionUpdateWithStringToken:cleanDeviceToken comletion:blockComplete];
    
#endif
}

+ (void) actionUpdateWithStringToken:(NSString *)stringToken comletion:(void (^)(NSData *, BOOL))blockComplete
{
    
    NSDictionary * user = [UserManager sharedInstance].currentUser;
    if ( !user )
        return;
    
    YDRequest *urlRequest = [[YDRequest alloc] initWithURL:[NSURL URLWithString:kAPIRegisterDeviceToken] withJSONDict:[NSDictionary dictionaryWithObjectsAndKeys:user[@"username"], @"username", stringToken, @"devicetoken",nil]];
    
    [urlRequest startWithCompletion:^(YDRequest *request, NSData *data, BOOL success) {
        if ( blockComplete )
            blockComplete(data, success);
    }];
}

+ (void) actionCheckExistanceMobile:(NSString*) mobile completion:CompleteBlock blockComplete
{
    YDRequest *urlRequest = [[YDRequest alloc] initWithURL:[NSURL URLWithString:kAPICheckExistance]
                                              withJSONDict:[NSDictionary dictionaryWithObjectsAndKeys:mobile,@"mobile", nil]];
    
    [urlRequest startWithCompletion:^(YDRequest *request, NSData *data, BOOL success) {
        if ( blockComplete )
            blockComplete(data,success);
    }];
}

@end
