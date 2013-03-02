//
//  FavoritesRequest.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/18/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "FavoritesRequest.h"

@implementation FavoritesRequest

@synthesize entity = _entity;

+ (id)requestWithEntity:(BaseEntity *)entity {
    
    NSString *server = [[SettingsManager sharedSettingsManager] server];
    NSString *entityName = [entity.commentableTypeName lowercaseString];
    NSString *path = @"Favorites";
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", server, path];
    NSURL *url = [NSURL URLWithString:urlString];
    id request = [self requestWithURL:url];
    [request setEntity:entity];
    return request;
}

- (void) processResponse {
    
    NSData *response = [self responseData];
    // Do response processing/deserialization here
    /*
     NSArray *comments = [self deserializeXML:response 
     forXPath:@"comment" 
     andClass:NSClassFromString(@"SBComment")];
     */
    NSArray *comments;
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:comments, @"data", self.entity, @"entity", nil];
    NSNotification *notif = [NSNotification notificationWithName:GMNetworkManagerDidRetrieveFavoritesNotification
                                                          object:self 
                                                        userInfo:dict];
    [[NSNotificationCenter defaultCenter] postNotification:notif];    
}

@end
