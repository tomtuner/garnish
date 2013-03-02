//
//  FavoritesTableViewCell.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "FavoritesTableViewCell.h"

@implementation FavoritesTableViewCell

@synthesize hue, saturation, brightness;
@synthesize lastCheckIn, distance, merchantTitle;

-(id) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        hue = 0.1027;
        saturation = 0.1;
        brightness = 0.95;
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
    CGRect outerRect = CGRectInset(self.bounds, 0.0f, 0.0f);
    CGMutablePathRef outerPath = [GarnishCommon createRoundedRectForRect: outerRect withRadius: 0.0f];
    
    if (self.selected != UIControlStateHighlighted) {
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, outerTop);
        CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor);
        CGContextAddPath(context, outerPath);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    }
    
//    CGColorRef outerTop = [UIColor colorWithHue:hue saturation:saturation 
//                                     brightness:1.0*brightness alpha:1.0].CGColor;
    CGColorRef outerBottom = [UIColor colorWithHue:hue saturation:saturation 
                                        brightness:0.90*brightness alpha:1.0].CGColor;
    /*CGColorRef innerStroke = [UIColor colorWithHue:hue saturation:saturation 
                                        brightness:0.80*brightness alpha:1.0].CGColor;
    CGColorRef innerTop = [UIColor colorWithHue:hue saturation:saturation 
                                     brightness:0.90*brightness alpha:1.0].CGColor;
    CGColorRef innerBottom = [UIColor colorWithHue:hue saturation:saturation 
                                        brightness:0.70*brightness alpha:1.0].CGColor;*/
    
    // Add the following to the bottom
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    drawGlossAndGradient(context, outerRect, outerTop, outerBottom);
    CGContextRestoreGState(context);
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
