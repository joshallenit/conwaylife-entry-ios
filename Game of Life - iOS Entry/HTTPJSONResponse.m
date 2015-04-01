//
//  HTTPJSONResponse.m
//  iWebDriver
//
//  Copyright 2009 Google Inc.
//  Copyright 2011 Software Freedom Conservancy.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "HTTPJSONResponse.h"
//#import "SBJson4.h"

@implementation HTTPJSONResponse

- (id)initWithData:(NSData *)data {
    NSLog(@"Use initWithObject for HTTPJSONResponse");
    return nil;
}

// Designated initaliser
- (id)initWithObject:(id)object {
    NSError *error;
    NSLog(@"converting %@ to JSON", object);
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSLog(@"DONE %@ %@", error, jsonData);
    NSString *contents = nil;
    if (!jsonData) {
        NSLog(@"%@ cannot be converted to JSON %@", object, error);
    } else {
        contents = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSLog(@"Sending JSON: %@", contents);
    NSData *theData = [contents dataUsingEncoding:NSUTF8StringEncoding];
    return [super initWithData:theData];
}

- (NSDictionary *)httpHeaders {
    return [NSDictionary dictionaryWithObject:@"application/json; charset=UTF-8" forKey:@"Content-Type"];
}

@end