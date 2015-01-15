//
//  Data_Text.h
//  Demo
//
//  Created by Ngoc Thong on 1/15/15.
//
//

#import <Foundation/Foundation.h>

@interface Data_Text : NSObject
-(void)writefile:(NSString*)aString;
-(void)writefile_addtext:(NSString*)aString;
-(NSString*)readfile;
@end
