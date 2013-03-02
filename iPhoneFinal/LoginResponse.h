//
//  LoginResponse.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/25/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "BaseEntity.h"

@interface LoginResponse : BaseEntity {
    NSMutableArray *specials;
}

@property (nonatomic, strong) NSMutableArray *specials;

- (id)initWithTBXMLElement:(TBXMLElement *)element;

@end
