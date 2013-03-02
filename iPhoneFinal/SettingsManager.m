//
//  SettingsManager.m
//  iPhone
//
//  Created by Thomas DeMeo on 12/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsManager.h"

@implementation SettingsManager

SYNTHESIZE_SINGLETON_FOR_CLASS(SettingsManager)

@dynamic server;
@dynamic username;
@dynamic password;
@dynamic loggedIn;
@dynamic useSelfSignedSSLCertificates;
@dynamic versionNumber;
@dynamic tabOrder;
@synthesize userDefaults = _userDefaults;

- (id)init
{
    self = [super init];
    if (self) {
        
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        self.versionNumber = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        
        
        NSObject *setting = [self.userDefaults objectForKey:SETTING_FIRST_TIME_RUN];
        if (setting == nil) {
            // Do any first time initialization here
            [self.userDefaults setObject:[NSNumber numberWithInt:9] forKey:SETTING_FIRST_TIME_RUN];
            self.useSelfSignedSSLCertificates = NO;
            [self.userDefaults setObject:SERVER_URL forKey:SETTING_SERVER];
            [self.userDefaults synchronize];
        }
        
    }
    
    return self;
}

-(void) dealloc {
    self.userDefaults = nil;
    [userDefaults release];
    [super dealloc];
}

-(BOOL) loggedIn {
    return [self.userDefaults boolForKey:SETTING_LOGGED_IN];
}

-(void) setLoggedIn:(BOOL) boo {
    [self.userDefaults setBool:boo forKey:SETTING_LOGGED_IN];
    [self.userDefaults synchronize];
}

-(NSString *) server {
    return [self.userDefaults stringForKey:SETTING_SERVER];
}

-(void) setServer:(NSString *)server{
    [self.userDefaults setObject:server forKey:SETTING_SERVER];
    [self.userDefaults synchronize];
}

- (NSString *)versionNumber
{
    return [self.userDefaults stringForKey:SETTING_VERSION_NUMBER];
}

- (void)setVersionNumber:(NSString *)value
{
    [self.userDefaults setObject:value forKey:SETTING_VERSION_NUMBER];
    [self.userDefaults synchronize];
}

- (BOOL)useSelfSignedSSLCertificates
{
    return [self.userDefaults boolForKey:SETTING_USE_SELF_SIGNED_CERTIFICATE];
}

- (void)setUseSelfSignedSSLCertificates:(BOOL)value
{
    [self.userDefaults setBool:value forKey:SETTING_USE_SELF_SIGNED_CERTIFICATE];
    [self.userDefaults synchronize];
}

@end
