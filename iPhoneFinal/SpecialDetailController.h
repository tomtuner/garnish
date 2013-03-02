//
//  SpecialDetailController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/17/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GarnishCommon.h"

@interface SpecialDetailController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UIView *shareView;
    UIView *hiddenView;
}

@property (nonatomic, strong) IBOutlet UIView *shareView;
@property (nonatomic, strong) IBOutlet UIView *hiddenView;

-(IBAction)sharePressed:(id)sender;
- (void)dismissHiddenView;

@end
