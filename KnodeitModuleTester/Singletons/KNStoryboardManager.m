//
//  KNStoryboardManager.m
//  EverAfter
//
//  Created by Jianying Shi on 6/26/14.
//
//

#import "KNStoryboardManager.h"
#import "UserManager.h"
#import "KNAppControlManager.h"
#import "KNConstants.h"

@implementation KNStoryboardManager


+(NSString*) getMainStoryboardName
{
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad )
        return kMainStoryboardName_iPad;
    else
        return kMainStoryboardName_iPhone;
}

+(NSString*) getInitialViewControllerName
{
    if ( [KNAppControlManager sharedInstance].bShowSplash )
    {
        return kSplashControllerIdentifier;
    }
    if ( ![[UserManager sharedInstance] hasSavedUser] &&[KNAppControlManager sharedInstance].bShowAuthenticateLandingPage )
    {
        return kLandingControllerIdentifier;
    }
    return kHomeControllerIdentifier;
    
}

+ (UIViewController*)getViewControllerWithIdentifier:(NSString*)viewControllerIdentifier fromStoryboard:(NSString *)storyboardName{
    
    // Getting the storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    // get certain ViewController
    UIViewController *VC = [storyboard instantiateViewControllerWithIdentifier:viewControllerIdentifier];
    
    return VC;
}

+ (UIViewController*)getViewControllerInitial:(NSString *)storyboardName{

    // Getting the storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    // get instantiate initial view controller
    UIViewController *VC = storyboard.instantiateInitialViewController;
    
    return VC;
}

@end
