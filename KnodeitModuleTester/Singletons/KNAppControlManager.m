//
//  KNAppControlManager.m
//  EverAfter
//
//  Created by Jianying Shi on 6/26/14.
//
//

#import "KNAppControlManager.h"

@implementation KNAppControlManager

+ (KNAppControlManager*)sharedInstance {
    static KNAppControlManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance defaultSetting];
    });
    return (KNAppControlManager*)sharedInstance;
}

- (void) defaultSetting
{
    self.bShowSplash = YES;
    self.bShowAuthenticateLandingPage = YES;
}
@end
