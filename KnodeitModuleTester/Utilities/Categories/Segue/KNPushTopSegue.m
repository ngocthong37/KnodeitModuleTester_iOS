//
//  KNPushTopSegue.m
//  EverAfter
//
//  Created by Jianying Shi on 6/26/14.
//
//

#import "KNPushTopSegue.h"

@implementation KNPushTopSegue

- (void) perform {
    UIView *oldView = ((UIViewController *)self.sourceViewController).view;
    UIView *newView = ((UIViewController *)self.destinationViewController).view;

    [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:nil];
    
    [newView.window insertSubview:oldView aboveSubview:newView];
    
    float offsetY = oldView.frame.size.height ;

    [UIView animateWithDuration:0.3
                     animations:^{ oldView.frame = CGRectMake(oldView.frame.origin.x, oldView.frame.origin.y-offsetY, oldView.frame.size.width, oldView.frame.size.height);}
                     completion:^(BOOL finished){ [oldView removeFromSuperview]; }];
}

@end
