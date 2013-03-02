//
//  FavoritesRequest.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/18/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "BaseFormDataRequest.h"
#import "BaseEntity.h"
#import "Notifications.h"
#import "SettingsManager.h"

@interface FavoritesRequest : BaseFormDataRequest {
    
}

@property (nonatomic, retain) BaseEntity *entity;

+(id) requestWithEntity:(BaseEntity *) entity;

@end
