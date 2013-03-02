//
//  Location.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/17/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject {
    float DFU;
    NSString *addressLine1;
    NSString *addressLine2;
    NSString *city;
    NSString *state;
    NSInteger *zipcode;
}

@property (nonatomic, assign) float DFU;
@property (nonatomic, strong) NSString *addressLine1;
@property (nonatomic, strong) NSString *addressLine2;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, assign) NSInteger *zipcode;

@end
