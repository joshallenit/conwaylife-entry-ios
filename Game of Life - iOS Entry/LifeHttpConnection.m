//
//  LifeHttpConnection.m
//  Game of Life - iOS Entry
//
//  Created by Josh Allen on 2015-04-01.
//  Copyright (c) 2015 Connected Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LifeHttpConnection.h"
#import "HTTPDynamicFileResponse.h"
#import "HTTPJSONResponse.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@implementation LifeHttpConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path
{
    
    NSString *filePath = [self filePathForURI:path];
    NSString *documentRoot = [config documentRoot];
    
    if (![filePath hasPrefix:documentRoot])
    {
        DDLogError(@"HTTPConnection's filePathForURI was supposed to take care of this for us.");
        return nil;
    }
    
    NSString *relativePath = [filePath substringFromIndex:[documentRoot length]];
    
    if ([relativePath isEqualToString:@"/life/iterate"])
    {
        DDLogInfo(@"%@[%p]: Serving up dynamic content", THIS_FILE, self);
        
        NSDictionary * params = [self parseGetParams];
        NSString * gridParam = params[@"grid"];
        NSError *jsonParsingError;
        NSArray *grid = [NSJSONSerialization JSONObjectWithData:[gridParam dataUsingEncoding:NSUTF8StringEncoding]
                                        options:0
                                          error:&jsonParsingError];
        if (jsonParsingError) {
            NSLog(@"Could not parse grid %@ %@", gridParam, jsonParsingError);
        }
        
        return [[HTTPJSONResponse alloc] initWithObject:grid];
    }
    else {
        return [[HTTPJSONResponse alloc] initWithObject:@{@"result": @"404"}];
    }
    
    return [super httpResponseForMethod:method URI:path];
}

@end