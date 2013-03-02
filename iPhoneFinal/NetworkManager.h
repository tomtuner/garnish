//
//  NetworkManager.h
//  iPhone
//
//  Created by Thomas DeMeo on 12/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"
#import "SynthesizeSingleton.h"
#import "BaseRequest.h"
#import "LoginRequest.h"
#import "SpecialsRequest.h"
#import "FavoritesRequest.h"

@interface NetworkManager : NSObject {
    ASINetworkQueue *networkQueue;
}

@property (nonatomic, retain) ASINetworkQueue *networkQueue;

+ (NetworkManager *) sharedNetworkManager;

-(void) loginWithEntity:(BaseEntity *)entity;
-(void) loadSpecialsForEntity:(BaseEntity *)entity;
-(void) loadFavoritesForEntity:(BaseEntity *)entity;
-(NSError *) createErrorWithMessage:(NSString *)text code:(NSInteger)code;
-(void) notifyError:(NSError *)error;

@end
