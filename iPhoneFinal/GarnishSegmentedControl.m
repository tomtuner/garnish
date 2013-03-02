//
//  GarnishSegmentedControl.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/23/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "GarnishSegmentedControl.h"

@implementation GarnishSegmentedControl

-(id) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        self.opaque = NO;
        self.layer.cornerRadius = 2.0f;
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = [UIColor colorWithRed:0.8901960784 green:0.8784313725 blue:0.8509803922 alpha:1.0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    for (UIView *subviews in self.subviews) {
        
        subviews.layer.backgroundColor = [UIColor colorWithRed:0.8901960784 green:0.8784313725 blue:0.8509803922 alpha:1.0].CGColor;
        subviews.layer.borderWidth = 0.5f;
        subviews.layer.borderColor = [UIColor colorWithRed:0.8117647059 green:0.7725490196 blue:0.7254901961 alpha:1.0].CGColor;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        UIGraphicsBeginImageContext(CGSizeMake(subviews.bounds.size.width, subviews.bounds.size.height));
        
        // Sets the width and stroke color
        CGContextSetLineWidth(context, 2.0);
        CGContextSetRGBStrokeColor(context, 0.8117647059, 0.7725490196, 0.7254901961, 1.0); 
        CGContextStrokeRect(context, CGContextGetClipBoundingBox(context));
        
        //Note, you may need to set the clip bounding box first.  That's CGContextClipToRect(UIGraphicsGetCurrentContext, theRectOfYourUITextField);
        
        /* UIImage *backgroundImage = (UIImage *)UIGraphicsGetImageFromCurrentImageContext();
         [self addSubview:backgroundImage];
         [backgroundImage release];
         */
        
        UIGraphicsEndImageContext();
    }
}

@end
