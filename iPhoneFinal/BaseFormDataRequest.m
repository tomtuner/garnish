//
//  BaseFormDataRequest.m
//  iPhone
//
//  Created by Thomas DeMeo on 12/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BaseFormDataRequest.h"

static NSTimeInterval REQUEST_TIMEOUT = 30;

@implementation BaseFormDataRequest

- (id)initWithUrl
{
    self = [super init];
    if (self) {
        [self setShouldRedirect:NO];
        [self setDefaultResponseEncoding:NSUTF8StringEncoding];
        [self setTimeOutSeconds:REQUEST_TIMEOUT];
        [self addRequestHeader:@"Accept" value:@"application/json"];
    }
    
    return self;
}

@end
