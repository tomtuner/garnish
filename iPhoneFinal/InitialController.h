//
//  InitialController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iPhoneFinalAppDelegate.h"
#import "SplashController.h"
#import "GarnishAccountController.h"
#import "GarnishLoginController.h"
#import "AccountLoginButton.h"

@class AccountLoginButton;

@interface InitialController : UIViewController {
    AccountLoginButton *customButton;
}

@property (strong, nonatomic) IBOutlet AccountLoginButton *customButton;

- (IBAction) createNewAccount:(id) sender;
- (IBAction) garnishLogin:(id) sender;
- (IBAction) laterSelected:(id) sender;
- (IBAction) facebookSelected:(id) sender;

@end
