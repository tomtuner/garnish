//
//  SettingsManager.h
//  iPhone
//
//  Created by Thomas DeMeo on 12/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"

static NSString *SETTING_SERVER = @"SETTING_SERVER";
static NSString *SETTING_USERNAME = @"SETTING_USERNAME";
static NSString *SETTING_PASSWORD = @"SETTING_PASSWORD";
static NSString *SETTING_FIRST_TIME_RUN = @"SETTING_FIRST_TIME_RUN";
static NSString *SETTING_VERSION_NUMBER = @"SETTING_VERSION_NUMBER";
static NSString *SETTING_TAB_ORDER = @"SETTING_TAB_ORDER";
static NSString *SETTING_CURRENT_TAB = @"SETTING_CURRENT_TAB";
static NSString *SETTING_USE_SELF_SIGNED_CERTIFICATE = @"SETTING_USE_SELF_SIGNED_CERTIFICATE";

static NSString *SETTING_LOGGED_IN = @"SETTING_LOGGED_IN";

static NSString *OLD_PREFERENCES_SERVER_URL = @"server_url";
static NSString *OLD_PREFERENCES_USERNAME = @"username";
static NSString *OLD_PREFERENCES_PASSWORD = @"password";

static NSString *SERVER_URL = @"www.garnishmobile.com";


@interface SettingsManager : NSObject {
    NSUserDefaults *userDefaults;
}

@property (nonatomic, retain) NSUserDefaults *userDefaults;
@property (nonatomic, copy) NSString *server;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, assign) BOOL *loggedIn;
@property (nonatomic) BOOL useSelfSignedSSLCertificates;
@property (nonatomic, copy) NSString *versionNumber;
@property (nonatomic, retain) NSArray *tabOrder;

+(SettingsManager*) sharedSettingsManager;

@end
