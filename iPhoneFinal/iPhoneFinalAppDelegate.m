//
//  iPhoneFinalAppDelegate.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "iPhoneFinalAppDelegate.h"

@implementation iPhoneFinalAppDelegate

@synthesize window = _window;
@synthesize initialNavController, facebook;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*
    [GarnishClassUtils swizzleSelector:@selector(insertSubview:atIndex:)
                               ofClass:[UINavigationBar class]
                          withSelector:@selector(scInsertSubview:atIndex:)];
    [GarnishClassUtils swizzleSelector:@selector(sendSubviewToBack:)
                               ofClass:[UINavigationBar class]
                          withSelector:@selector(scSendSubviewToBack:)];    
     */
    [self setAppearanceSettings];
    
    SettingsManager *settings = [SettingsManager sharedSettingsManager];
    [settings setLoggedIn:YES];
    
    if (settings.loggedIn) {
        [GarnishCommon showMainTabView];
    }else {
        InitialController *initialController = [[InitialController alloc] initWithNibName:nil bundle:nil];
        [initialController setTitle:@"Back"];
        
        [initialNavController pushViewController: initialController animated:YES];
        
        [self.window setRootViewController:initialNavController];
        [self.window makeKeyAndVisible];
    }
    return YES;
}

- (void) setAppearanceSettings {
    // Check for iOS settings
    if ([UINavigationBar respondsToSelector:@selector(appearance)]) {
        // Set up initial appearance protocols
        [[UINavigationBar appearance] setTintColor:GarnishNavBarColor];
        [[UISegmentedControl appearance] setTintColor:[UIColor lightGrayColor]];
        [[UIBarButtonItem appearance] setTintColor:[UIColor blackColor]];
    }else {
        [GarnishCommon customizeNavigationController:self.initialNavController];
    }
    
}

- (void) authenticateFacebook {
    NSLog(@"Auth Facebook");
    facebook = [[Facebook alloc] initWithAppId:@"329715210396030" andDelegate:self];
    
    [self logoutFacebook];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] 
        && [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    
    
    if (![facebook isSessionValid]) {
        NSLog(@"Session is Valid");
        NSArray *fbPermissions = [NSArray arrayWithObjects:@"user_birthday", @"email", nil];
        [facebook authorize:fbPermissions];
    }
}

- (void) logoutFacebook {
    [facebook logout];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil forKey:@"FBAccessTokenKey"];
    [defaults setObject:nil forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}

#pragma mark - Facebook Methods

// Pre 4.2 support
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [facebook handleOpenURL:url]; 
}

// For 4.2+ support
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [facebook handleOpenURL:url]; 
}

- (void)fbDidLogin {
    NSLog(@"DID LOGIN METHOD");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
    // Make the Graph API request for the users data
    [facebook requestWithGraphPath:@"me" andDelegate:self];
    
}

- (void)fbDidNotLogin:(BOOL)cancelled {
    NSLog(@"DID NOT LOGIN METHOD");
}

- (void)fbDidLogout {
    NSLog(@"DID LOGOUT");
    
}

- (void) request:(FBRequest *)request didLoad:(id)result {
    
    NSDictionary* hash;
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        
        hash = result;        
    }
    NSLog(@"Index 0: %@", result);
    
    GarnishAccountController *controller = [[GarnishAccountController alloc] initWithNibName:nil bundle:nil facebookDictionary:hash];
    [self.initialNavController pushViewController:controller animated:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
