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
    // Use HTTPConnection's filePathForURI method.
    // This method takes the given path (which comes directly from the HTTP request),
    // and converts it to a full path by combining it with the configured document root.
    //
    // It also does cool things for us like support for converting "/" to "/index.html",
    // and security restrictions (ensuring we don't serve documents outside configured document root folder).
    
    NSString *filePath = [self filePathForURI:path];
    
    // Convert to relative path
    
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
        
        NSArray *grid = @[@[@0, @0, @0],@[@0, @1, @0],@[@0, @0, @0]];
        return [[HTTPJSONResponse alloc] initWithObject:grid];
    }
    else {
        return [[HTTPJSONResponse alloc] initWithObject:@{@"result": @"404"}];
    }
    
    return [super httpResponseForMethod:method URI:path];
}

@end