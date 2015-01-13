//
//  KNStoryboardManager.h
//  EverAfter
//
//  Created by Jianying Shi on 6/26/14.
//
//
// Manager to control storyboard
#import <Foundation/Foundation.h>

@interface KNStoryboardManager : NSObject

// Get main storyboard name based on device
+(NSString*) getMainStoryboardName;

// Get initial view controller name based on switches and status
+(NSString*) getInitialViewControllerName;

+(UIViewController*)getViewControllerWithIdentifier:(NSString*)viewControllerIdentifier fromStoryboard:(NSString *)storyboardName;

+(UIViewController*)getViewControllerInitial:(NSString *)storyboardName;
@end
