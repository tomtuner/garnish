//
//  PointsController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/22/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"

@interface PointsController : NSObject {
    
}

+ (PointsController *) sharedPointsController;

- (void) pointsNavButtonSelected;

@end
