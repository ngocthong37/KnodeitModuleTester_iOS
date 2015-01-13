//  LakLak
//
//  Created by Peter van de Put
//  Copyright (c) 2012 YourDeveloper.net / Gemoro B.V. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ButtonIndexed : UIButton {
	
	NSIndexPath *indexPath;

}

@property(nonatomic,retain) NSIndexPath *indexPath;

@end
