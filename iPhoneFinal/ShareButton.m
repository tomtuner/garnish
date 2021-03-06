//
//  ShareButton.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/17/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "ShareButton.h"

@implementation ShareButton

@synthesize hue, brightness, saturation;

-(id) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        hue = 0.0805;
        saturation = 0.24;
        brightness = 0.22;
        // Set the label properties
        [self setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [self.titleLabel setShadowColor:[UIColor blackColor]];
        [self.titleLabel setShadowOffset:CGSizeMake(0.5, 0.5)];
        [self setTitleColor:[UIColor lightGrayColor]forState:UIControlStateHighlighted];
    }
    return self;
}

-(void) drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef outerTop = [UIColor colorWithHue:hue saturation:saturation 
                                     brightness:brightness alpha:1.0].CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2 
                                              blue:0.2 alpha:0.5].CGColor;
    
    CGFloat xMargin = 5.0f;
    CGRect outerRect = CGRectInset(self.bounds, xMargin, 5.0f);
    CGMutablePathRef outerPath = [GarnishCommon createRoundedRectForRect: outerRect withRadius: 2.0f];
    
    if (self.state != UIControlStateHighlighted) {
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, outerTop);
        CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor);
        CGContextAddPath(context, outerPath);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    }
}


@end
