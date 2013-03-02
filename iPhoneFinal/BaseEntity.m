//
//  BaseEntity.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/16/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity

@synthesize name = _name;
@synthesize objectId = _objectId;
@synthesize createdAt = _createdAt;
@synthesize updatedAt = _updatedAt;
@synthesize formatter = _formatter;
@synthesize photoURL = _photoURL;

@dynamic commentableTypeName;

+ (NSString *)stringValueForElement:(NSString *)elementName 
                      parentElement:(TBXMLElement *)element
{
    TBXMLElement *attribute = [TBXML childElementNamed:elementName parentElement:element];
    NSString *value = @"";
    if (attribute != nil)
    {
        value = [TBXML textForElement:attribute];
    }
    return value;
}

- (id)initWithTBXMLElement:(TBXMLElement *)element
{
    if (self = [super init])
    {
        self.formatter = [[NSDateFormatter alloc] init];
        [self.formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
        
        NSString *value = [BaseEntity stringValueForElement:@"id" parentElement:element];
        self.objectId = [value intValue];
        
        value = [BaseEntity stringValueForElement:@"created-at" parentElement:element];
        self.createdAt = [self.formatter dateFromString:value];
        
        value = [BaseEntity stringValueForElement:@"updated-at" parentElement:element];
        self.updatedAt = [self.formatter dateFromString:value];
        
        self.name = [BaseEntity stringValueForElement:@"name" parentElement:element];
    }
    return self;
}

#pragma mark - Overridable properties

- (NSString *)commentableTypeName
{
    return NSStringFromClass([self class]);
}

- (void) dealloc {
    [_name release];
    [_createdAt release];
    [_updatedAt release];
    [_formatter release];
    [_photoURL release];
    [super dealloc];
}

@end
