//
//  SearchController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GarnishCommon.h"

#define CategorySelectedColor [UIColor colorWithRed:0.1647058824 green:0.1294117647 blue:0.09411764706 alpha:1.0]
#define CategoryBackgroundColor [UIColor colorWithRed:0.8901960784 green:0.8784313725 blue:0.8509803922 alpha:1.0]

@interface SearchController : UIViewController {
    UIView *categoryView;
    UISegmentedControl *dayControl;
}

@property (nonatomic, strong) IBOutlet UIView *categoryView;
@property (nonatomic, strong) IBOutlet UISegmentedControl *dayControl;

-(IBAction)selectCategory:(id)sender;
-(void)deselectButtonsExcept:(NSInteger)tag;
-(void)points;

@end
