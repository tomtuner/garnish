//
//  LoginResponse.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/25/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "LoginResponse.h"

@implementation LoginResponse

@synthesize specials;

- (id) initWithTBXMLElement:(TBXMLElement *)element {
    if (self = [super initWithTBXMLElement:element]) {
        
//        NSData *specialsXML = [[BaseEntity stringValueForElement:@"Specials" parentElement:element] dataUsingEncoding:NSUTF8StringEncoding];
        TBXMLElement *childElement = (element->firstChild);

        while (!([[TBXML elementName:childElement] isEqualToString: (@"Specials")])) {
            NSLog(@"Child Name: %@", [TBXML elementName:childElement]);
            childElement = childElement->nextSibling;
        }
        NSString *specialsXMLString = [TBXML textForElement:childElement];   
        NSLog(@"Specials Data: %@", specialsXMLString);
        NSData *specialsXML = [[BaseEntity stringValueForElement:@"Specials" parentElement:element] dataUsingEncoding:NSUTF8StringEncoding];

        
        TBXML *tbxml = [TBXML tbxmlWithXMLData:specialsXML];
        TBXMLElement *rootElement = tbxml.rootXMLElement;
        
        NSString *title = [BaseEntity stringValueForElement:@"Title" parentElement:rootElement];
        NSLog(@"title: %@", title);

        
        
        
//        self.specials = [BaseEntity stringValueForElement:@"" parentElement:element]
                         
//        self.title = [BaseEntity stringValueForElement:@"title" parentElement:element];
//        self.description = [BaseEntity stringValueForElement:@"description" parentElement:element];
    }
    return self;
}

@end
