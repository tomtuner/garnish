//
//  InitialController.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "InitialController.h"

@implementation InitialController

@synthesize customButton;

- (void) facebookSelected:(id)sender {
//    facebook = [[Facebook alloc] initWithAppId:@"329715210396030" andDelegate:self];
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if ([defaults objectForKey:@"FBAccessTokenKey"] 
//        && [defaults objectForKey:@"FBExpirationDateKey"]) {
//        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
//        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
//    }
//    
//    
//    if (![facebook isSessionValid]) {
//        NSArray *fbPermissions = [NSArray arrayWithObjects:@"user_birthday", @"email", nil];
//        [facebook authorize:fbPermissions];
//    }
    NSLog(@"Facebook Selected");
    iPhoneFinalAppDelegate *del = [[UIApplication sharedApplication] delegate];
    [del authenticateFacebook];
}

-(void)laterSelected:(id)sender {
    
    iPhoneFinalAppDelegate *del = [[UIApplication sharedApplication] delegate];
    
#warning DELETE THIS FOR REAL APP
    [del logoutFacebook];
    
    SplashController *controller = [[SplashController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}


-(void)createNewAccount:(id)sender {
    
    GarnishAccountController *controller = [[GarnishAccountController alloc]initWithNibName:nil bundle:nil];
    [controller setTitle:@"Registration"];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)garnishLogin:(id)sender {
    GarnishLoginController *controller = [[GarnishLoginController alloc] initWithNibName:nil bundle:nil];
    [controller setTitle:@"Log In"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
    // Turn of the navigation bar anytime this view appears
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImageView *fbImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 12.5f, 22, 22)];
    [fbImage setImage:[UIImage imageNamed:@"twitter_icon.png"]];
    [customButton addSubview:fbImage];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//#pragma mark - Facebook Methods
//
//// Pre 4.2 support
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
//    return [facebook handleOpenURL:url]; 
//}
//
//// For 4.2+ support
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    return [facebook handleOpenURL:url]; 
//}
//
//- (void)fbDidLogin {
//    NSLog(@"DID LOGIN METHOD");
//
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
//    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
//    [defaults synchronize];
//    
//    // Make the Graph API request for the users data
//    [facebook requestWithGraphPath:@"me" andDelegate:self];
//    
//}
//
//- (void)fbDidNotLogin:(BOOL)cancelled {
//    NSLog(@"DID NOT LOGIN METHOD");
//}
//
//- (void)fbDidLogout {
//    NSLog(@"DID LOGOUT");
//
//}
//
//- (void) request:(FBRequest *)request didLoad:(id)result {
//    
//    result = (NSArray *) result;
//    NSLog(@"Index 0: %@", [result objectAtIndex:0]);
//    
//    GarnishAccountController *controller = [[GarnishAccountController alloc] initWithNibName:nil bundle:nil facebook:facebook];
//    [self.navigationController pushViewController:controller animated:YES];
//}

@end
