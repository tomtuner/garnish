//
//  PointsController.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/22/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "PointsController.h"

@implementation PointsController

SYNTHESIZE_SINGLETON_FOR_CLASS(PointsController);

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) pointsNavButtonSelected {
    NSLog(@"POINTS CONTROLLER BAM");
}

-(void)dealloc {
    [super dealloc];
}

@end
