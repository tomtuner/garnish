//
//  BaseRequest.m
//  iPhone
//
//  Created by Thomas DeMeo on 12/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BaseRequest.h"

static NSTimeInterval REQUEST_TIMEOUT = 30;

@implementation BaseRequest

- (id)initWithURL:(NSURL *)newURL
{
    self = [super initWithURL:newURL];
    if (self) {
        [self setShouldRedirect:NO];
        [self setDefaultResponseEncoding:NSUTF8StringEncoding];
        [self setTimeOutSeconds:REQUEST_TIMEOUT];
        [self addRequestHeader:@"Accept" value:@"application/json"];
    }
    
    return self;
}

@end
