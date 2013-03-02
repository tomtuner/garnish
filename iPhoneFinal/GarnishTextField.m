//
//  GarnishTextField.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/20/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "GarnishTextField.h"

@implementation GarnishTextField

-(id) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height + 10);
        self.opaque = NO;
        self.layer.cornerRadius = 2.0f;
        self.layer.masksToBounds = YES;
        self.borderStyle = UITextBorderStyleNone;
        // Add the padding to the left
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        self.leftView = paddingView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.backgroundColor = [UIColor whiteColor];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
	UIGraphicsBeginImageContext(CGSizeMake(self.bounds.size.width, self.bounds.size.height + 10));
    
    // Sets the width and stroke color
	CGContextSetLineWidth(context, 3.0);
	CGContextSetRGBStrokeColor(context, 0.6215686275, 0.637254902, 0.6490196078, 1.0); 
	CGContextStrokeRect(context, CGContextGetClipBoundingBox(context));
    
    //Note, you may need to set the clip bounding box first.  That's CGContextClipToRect(UIGraphicsGetCurrentContext, theRectOfYourUITextField);
    
   /* UIImage *backgroundImage = (UIImage *)UIGraphicsGetImageFromCurrentImageContext();
	[self addSubview:backgroundImage];
	[backgroundImage release];
    */
    
	UIGraphicsEndImageContext();
}

@end
