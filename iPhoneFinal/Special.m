//
//  Special.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/17/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "Special.h"

@implementation Special

@synthesize identifier, title, description, merchant;

- (id) initWithTBXMLElement:(TBXMLElement *)element {
    if (self = [super initWithTBXMLElement:element]) {
        self.identifier = [BaseEntity stringValueForElement:@"id" parentElement:element];
        self.title = [BaseEntity stringValueForElement:@"title" parentElement:element];
        self.description = [BaseEntity stringValueForElement:@"description" parentElement:element];
    }
    return self;
}

-(NSComparisonResult) compareByDFU:(Special *)otherObject {
    if (self.merchant.location.DFU > otherObject.merchant.location.DFU) {
        return NSOrderedAscending;
    }
    return NSOrderedDescending;
}

@end
