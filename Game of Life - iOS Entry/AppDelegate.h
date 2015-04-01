//
//  AppDelegate.h
//  Game of Life - iOS Entry
//
//  Created by Josh Allen on 2015-04-01.
//  Copyright (c) 2015 Connected Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HTTPServer;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
	HTTPServer *httpServer;
}

@property (strong, nonatomic) UIWindow *window;


@end

