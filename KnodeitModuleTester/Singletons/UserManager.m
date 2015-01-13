//
//  UserManager.m
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//

#import "UserManager.h"
#import "KNCommunicationManager.h"
#import "KNConstants.h"
#import "KeychainItemWrapper.h"

@implementation UserManager

+ (UserManager*)sharedInstance {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return (UserManager*)sharedInstance;
}


-(BOOL) hasSavedUser
{
    if ( self.currentUser != nil )
        return YES;
    
    if ( [[NSUserDefaults standardUserDefaults] boolForKey:kRememberPassword] )
    {
    
        KeychainItemWrapper *keychainPasswordItem = [[KeychainItemWrapper alloc] initWithIdentifier:kItemNameKeychainPassowrd accessGroup:nil];
        
        NSString * userName = [keychainPasswordItem objectForKey:(__bridge id)kSecAttrAccount];
        NSString * password = [keychainPasswordItem objectForKey:(__bridge id)kSecValueData];
        
        if ( userName.length != 0 && password.length != 0 )
        {
            
            [KNCommunicationManager actionLoginUser:userName withPassword:password completion:^(NSData *data, BOOL success) {
                if(success){
                    NSError* error=nil;
                    NSDictionary* returnData = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:data  options:kNilOptions  error:&error];
                    NSString* errString = returnData[@"err"];
                    if (errString.length>0){
                        [[NSNotificationCenter defaultCenter] postNotificationName:kLoginFailed  object:nil];
                    }
                    else{
                        self.currentUser = returnData;
                        [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccessed  object:nil];
                    }
                }
                else{
                    //                    [self showMessage:@"Couldn't login"];
                    [[NSNotificationCenter defaultCenter] postNotificationName:kLoginFailed  object:nil];
                }
                
            }];
            return YES;
        }
    }
    return NO;
}
@end
