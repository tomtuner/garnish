//
//  ProfileController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileTableViewCell.h"
#import "iPhoneFinalAppDelegate.h"
#import "GarnishCommon.h"

@interface ProfileController : UIViewController {
    UIScrollView *scrollView;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

-(IBAction) logoutGarnish;
- (void)settingsBarButtonClicked;

@end
