//
//  Special.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/17/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import "BaseEntity.h"
#import "Merchant.h"

@interface Special : BaseEntity {
    NSString *identifier;
    NSString *title;
    NSString *description;
    Merchant *merchant;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) Merchant *merchant;

- (id)initWithTBXMLElement:(TBXMLElement *)element;
- (NSComparisonResult) compareByDFU:(Special *)otherObject;

@end
