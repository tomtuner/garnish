//
//  SpecialsRequest.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/16/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "SettingsManager.h"
#import "BaseFormDataRequest.h"
#import "BaseEntity.h"
#import "Notifications.h"

@interface SpecialsRequest : BaseFormDataRequest {
    
}

@property (nonatomic, retain) BaseEntity *entity;

+(id) requestWithEntity:(BaseEntity *) entity;

@end
