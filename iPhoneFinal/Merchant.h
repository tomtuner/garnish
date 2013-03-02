//
//  Merchant.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/17/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface Merchant : NSObject {
    NSInteger *identifier;
    NSString *title;
    NSString *phNum;
    NSString *catDescription;
    Location *location;
}

@property (nonatomic, assign) NSInteger *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *phNum;
@property (nonatomic, strong) NSString *catDescription;
@property (nonatomic, strong) Location *location;

@end
