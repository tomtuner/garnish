//
//  SpecialsTableViewCell.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GarnishCommon.h"

@interface SpecialsTableViewCell : UITableViewCell {
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    
    UILabel *title;
    UILabel *merchantTitle;
    UILabel *distance;
    UILabel *description;
}

@property CGFloat hue;
@property CGFloat saturation;
@property CGFloat brightness;

@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *merchantTitle;
@property (nonatomic, strong) IBOutlet UILabel *distance;
@property (nonatomic, strong) IBOutlet UILabel *description;

@end
