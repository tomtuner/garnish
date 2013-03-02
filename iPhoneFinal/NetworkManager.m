//
//  NetworkManager.m
//  iPhone
//
//  Created by Thomas DeMeo on 12/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

SYNTHESIZE_SINGLETON_FOR_CLASS(NetworkManager);

@synthesize networkQueue = _networkQueue;

- (id)init
{
    self = [super init];
    if (self) {
        self.networkQueue = [[[ASINetworkQueue alloc] init]autorelease];
        self.networkQueue.shouldCancelAllRequestsOnFailure = NO;
        self.networkQueue.delegate = self;
        self.networkQueue.requestDidFinishSelector = @selector(requestDone);
        self.networkQueue.requestDidFailSelector = @selector(requestWentWrong);
        self.networkQueue.queueDidFinishSelector = @selector(queueFinished);
        [self.networkQueue go];
    }
    
    return self;
}

#pragma mark - Request methods

- (void)login:(BaseEntity *)entity {
    LoginRequest *request = [LoginRequest requestWithEntity:entity];
    [self.networkQueue addOperation:request];
}

- (void) loadSpecialsForEntity:(BaseEntity *)entity {
    SpecialsRequest *request = [SpecialsRequest requestWithEntity:entity];
    [self.networkQueue addOperation:request];
}

- (void) loadFavoritesForEntity:(BaseEntity *)entity {
    FavoritesRequest *request = [FavoritesRequest requestWithEntity:entity];
    [self.networkQueue addOperation:request];
}

#pragma mark - ASI Delegate methods

-(void)requestDone:(BaseRequest *)request {
    
    NSString *errorMessage = [request validateResponse];
    if (errorMessage == nil) {
        [request processResponse];
    }else if (request.responseStatusCode == 302) {
        // Not sure what to do here
        NSNotification *notif = [NSNotification notificationWithName:@"NetworkManagerDidFailLoginNotification" object:self userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notif];
    }else {
        NSError *error = [self createErrorWithMessage:errorMessage code:request.responseStatusCode];
        [self notifyError:error];
    }
    
}

-(void)requestWentWrong:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    [self notifyError:error];
}

-(NSError *)createErrorWithMessage:(NSString *)text code:(NSInteger)code {
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:text, NSLocalizedDescriptionKey, nil];
    NSError *error = [NSError errorWithDomain:@"Server" code:code userInfo:userInfo];
    return error;
}

-(void)notifyError:(NSError *)error
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:error, @"NetworkManagerErrorKey", nil];
    NSNotification *notif = [NSNotification notificationWithName:@"NetworkManagerDidFailWithErrorNotification" 
                                                          object:self 
                                                        userInfo:userInfo];
    [[NSNotificationCenter defaultCenter] postNotification:notif];    
}

-(void)dealloc {
    [_networkQueue release];
    [super dealloc];
}

-(void)cancelConnections {
    [self.networkQueue cancelAllOperations];
}

@end
