//
//  AppDelegate.m
//  MRRList
//
//  Created by K Y on 9/17/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "AppDelegate.h"
#import "ActionsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    @autoreleasepool {
        UIViewController *root =  [[ActionsViewController alloc] init];
        UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window = window;
        [_window setRootViewController:root];
        [_window makeKeyAndVisible];
        [root release];
        [window release];
    }
    return YES;
}

- (void)dealloc {
    [_window release];
    [super dealloc];
}

@end
