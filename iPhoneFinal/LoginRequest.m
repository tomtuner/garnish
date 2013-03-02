//
//  LoginRequest.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/16/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest

@synthesize entity = _entity;

+ (id)requestWithEntity:(BaseEntity *)entity {
    
    NSString *server = [SettingsManager sharedSettingsManager].server;
    NSString *entityName = [entity.commentableTypeName lowercaseString];
    NSString *urlString = [NSString stringWithFormat:@"%@/comments.xml?%@_id=%d", server, entityName, entity.objectId];
    NSURL *url = [NSURL URLWithString:urlString];
    id request = [self requestWithURL:url];
    [request setEntity:entity];
    return request;
}

- (void) processResponse {
    
    NSData *response = [self responseData];
    TBXML *tbxml = [TBXML tbxmlWithXMLData:response];
    TBXMLElement *rootElement = tbxml.rootXMLElement;
    
    NSMutableArray *specials;
    
    
    // Do response processing/deserialization here
    /*
    NSArray *comments = [self deserializeXML:response 
                                    forXPath:@"comment" 
                                    andClass:NSClassFromString(@"SBComment")];
    */
    NSArray *comments;
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:comments, @"data", self.entity, @"entity", nil];
    NSNotification *notif = [NSNotification notificationWithName:GMNetworkManagerDidRetrieveLoginNotification
                                                          object:self 
                                                        userInfo:dict];
    [[NSNotificationCenter defaultCenter] postNotification:notif];    
}

- (void) testXML:(NSString *) XMLString {
    
    NSLog(@"String: %@", XMLString);
    
    NSData *res = [XMLString dataUsingEncoding:NSUTF8StringEncoding];
    TBXML *tbxml = [TBXML tbxmlWithXMLData:res];
    TBXMLElement *rootElement = tbxml.rootXMLElement;
    
    if (rootElement == nil) {
        NSLog(@"Root is nil");
    }else {
//        NSLog(@"Root: %@",rootElement);
    }
    
    LoginResponse *response = [[LoginResponse alloc] initWithTBXMLElement:rootElement];
    
    
}

@end
