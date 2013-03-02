//
//  BaseEntity.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/16/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface BaseEntity : NSObject {
    NSInteger objectID;
    NSDate *createdAt;
    NSDate *updatedAt;
    NSString *name;
    NSURL *photoURL;
    NSStream *commentableTypeName;
    NSDateFormatter *formatter;
}

@property (nonatomic) NSInteger objectId;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSURL *photoURL;
@property (nonatomic, readonly) NSString *commentableTypeName;
@property (nonatomic, strong) NSDateFormatter *formatter;

+ (NSString *)stringValueForElement:(NSString *)elementName 
                      parentElement:(TBXMLElement *)element;
//+ (Class)classForSubjectType:(NSString *)subjectType;
- (id)initWithTBXMLElement:(TBXMLElement *)element;

@end
