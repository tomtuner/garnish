//
//  MapButton.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/17/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "MapButton.h"

@implementation MapButton

-(id) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.opaque = NO;
        self.layer.masksToBounds = YES;
        
//        self.backgroundColor = [UIColor colorWithRed:0.8901960784 green:0.8784313725 blue:0.8509803922 alpha:1.0];
        [self setTitleColor:[UIColor whiteColor]forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef fillColor = [UIColor colorWithRed:0.8901960784 green:0.8784313725 blue:0.8509803922 alpha:1.0].CGColor;
    CGColorRef fillColorSelected = [UIColor colorWithRed:0.1647058824 green:0.1294117647 blue:0.09411764706 alpha:1.0].CGColor;
    
    CGRect outerRect = CGRectInset(self.bounds, 0.0f, 0.0f);
    CGMutablePathRef outerPath = [GarnishCommon createRoundedRectForRect: outerRect withRadius: 2.0f];
    
    if (self.state != UIControlStateHighlighted) {
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, fillColor);
        CGContextSetLineWidth(context, 2.0f);
        CGContextSetStrokeColorWithColor(context, fillColorSelected); 
        CGContextAddPath(context, outerPath);
        CGContextDrawPath(context, kCGPathFillStroke);
        CGContextRestoreGState(context);
    }else {
        CGContextSaveGState(context);
        CGContextSetLineWidth(context, 1.0);
        CGContextSetRGBStrokeColor(context, 0.8117647059, 0.7725490196, 0.7254901961, 1.0); 
        CGContextSetFillColorWithColor(context, fillColorSelected);
        CGContextAddPath(context, outerPath);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
        
    }
}

// Add the following methods to update the display when a touch event happens
- (void)hesitateUpdate
{
    [self setNeedsDisplay];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setNeedsDisplay];
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self setNeedsDisplay];
    [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.1];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self setNeedsDisplay];
    [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.1];
}

@end
