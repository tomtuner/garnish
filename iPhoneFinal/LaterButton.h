//
//  LaterButton.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/22/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GarnishCommon.h"

@interface LaterButton : UIButton {
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
}

@property CGFloat hue;
@property CGFloat saturation;
@property CGFloat brightness;

@end
