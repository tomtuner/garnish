//
//  SplashController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iPhoneFinalAppDelegate.h"

@interface SplashController : UIViewController {
    UIScrollView *scrollView;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)showMainView:(id)sender;

@end
