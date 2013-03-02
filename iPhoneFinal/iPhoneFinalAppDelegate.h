//
//  iPhoneFinalAppDelegate.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InitialController.h"
#import "GarnishCommon.h"
#import "SettingsManager.h"
#import "FBConnect.h"

@interface iPhoneFinalAppDelegate : UIResponder <UIApplicationDelegate, FBSessionDelegate, FBRequestDelegate> {
    UINavigationController *initialNavController;
    Facebook *facebook;
}

@property (strong, nonatomic) IBOutlet UINavigationController *initialNavController;
@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (strong, nonatomic) Facebook *facebook;

-(void)authenticateFacebook;
-(void)logoutFacebook;
-(void) setAppearanceSettings;

@end
