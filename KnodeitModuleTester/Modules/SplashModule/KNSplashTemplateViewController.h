//
//  KNSplashTemplateViewController.h
//  EverAfter
//
//  Created by Jianying Shi on 6/26/14.
//
//
// Splash template
#import "KNBaseViewController.h"

@interface KNSplashTemplateViewController : KNBaseViewController


// Customize to get next segue name.
- (NSString *) getSegueNameForNext;


// Splash Time to live
@property(nonatomic, assign) CGFloat timeToLive;



@end
