//
//  LakLak
//
//  Created by Peter van de Put
//  Copyright (c) 2012 YourDeveloper.net / Gemoro B.V. All rights reserved.
//
#import "ButtonIndexed.h"


@implementation ButtonIndexed

@synthesize indexPath;

- (id) init
{
	self = [super init];
	if(self!=nil)
	{
		indexPath = [[NSIndexPath alloc] init];
	}
	return self;
}

- (void) dealloc
{
	//[indexPath release];
	//[super dealloc];
}

@end
