//
//  LoginRequest.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/16/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "BaseFormDataRequest.h"
#import "SettingsManager.h"
#import "BaseEntity.h"
#import "Notifications.h"
#import "TBXML.h"
#import "LoginResponse.h"

@interface LoginRequest : BaseFormDataRequest {
    
}

@property (nonatomic, retain) BaseEntity *entity;

+(id) requestWithEntity:(BaseEntity *) entity;
- (void) testXML:(NSString *) XMLString;

@end
