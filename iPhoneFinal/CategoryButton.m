//
//  CategoryButton.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/23/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "CategoryButton.h"

@implementation CategoryButton

-(id) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        self.opaque = NO;
        self.layer.cornerRadius = 2.0f;
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = [UIColor colorWithRed:0.8901960784 green:0.8784313725 blue:0.8509803922 alpha:1.0];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlEventTouchDown];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
	UIGraphicsBeginImageContext(CGSizeMake(self.bounds.size.width, self.bounds.size.height + 20));
    
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

@end
