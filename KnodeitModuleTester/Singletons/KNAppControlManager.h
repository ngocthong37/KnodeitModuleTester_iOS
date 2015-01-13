//
//  KNAppControlManager.h
//  EverAfter
//
//  Created by Jianying Shi on 6/26/14.
//
//
// Manager to control switches in Application
#import <Foundation/Foundation.h>

@interface KNAppControlManager : NSObject

// Get singleton instance
+ (KNAppControlManager*)sharedInstance;

// Switch to show splash
@property(nonatomic, assign) BOOL bShowSplash;


// Switch to show authenticate landing page
@property(nonatomic, assign) BOOL bShowAuthenticateLandingPage;

@end
