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

@property (nonatomic) UIViewController *rootViewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    @autoreleasepool {
        _rootViewController = [[ActionsViewController alloc] init];
        UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window = window;
        [_window setRootViewController:_rootViewController];
        [_rootViewController release];
        [window release];
        [_window makeKeyAndVisible];
    }
    return YES;
}

- (void)dealloc {
    [_window release];
    [super dealloc];
}

@end
