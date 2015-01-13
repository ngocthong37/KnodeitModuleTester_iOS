//
//  TSDRequest.m
//  TechStartUpDeveloper
//
//  Created by Peter van de Put on 14/04/2014.
//  Copyright (c) 2014 TechStartUpDeveloper. All rights reserved.

#import "YDRequest.h"

@interface YDRequest ()
{
    NSURLRequest *request;
    NSURLConnection *connection;
    NSMutableData *webData;
    NSInteger httpStatusCode;
    void (^completion)(YDRequest* request, NSData* data, BOOL success);
}
@end

@implementation YDRequest

- (id)initWithRequest:(NSURLRequest*)req
{
    self = [super init];
    if (self != nil)
        {
        request = req;
        }
    return self;
}

- (id) initWithURL:(NSURL*)url withJSONDict:(NSDictionary*) jsonDict{

    NSError * error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    NSString * stringJSON = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:60];
    
    
    //import to the the Content-Type to application/json to receive JSON format response
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPMethod:@"POST"];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[stringJSON length]];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody: [stringJSON dataUsingEncoding:NSUTF8StringEncoding]];
   
    return [self initWithRequest:req];
    
}

- (void)startWithCompletion:(void (^)(YDRequest* request, NSData* data, BOOL success))compl
{
    completion = [compl copy];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connection)
        {
#if ! __has_feature(objc_arc)
        webData = [[NSMutableData data] retain];
#else
        webData = [[NSMutableData alloc] init];
#endif
        
        }
    else
        {
        completion(self, nil, NO);
        }
}
#if ! __has_feature(objc_arc)
- (void)dealloc
{
    if (webData != nil)
        [webData release];
    if (connection != nil)
        [connection release];
    [super dealloc];
}
#endif


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    completion(self, webData, httpStatusCode == 200);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    httpStatusCode = [httpResponse statusCode];

    [webData setLength: 0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{

    completion(self, webData, NO);
}

@end
