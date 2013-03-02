//
//  GarnishLoginController.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "GarnishLoginController.h"

@implementation GarnishLoginController

- (BOOL) textFieldShouldReturn:(UITextField *) textField {
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        if (textField.tag == 2) {
            UITextField *email = (UITextField *)[textField.superview viewWithTag:1];
            UITextField *password = (UITextField *)[textField.superview viewWithTag:2];
            if ([email text] == nil || ([[email text] length] == 0)) {
                UIResponder *emailViewResponse = [textField.superview viewWithTag:1];
                [emailViewResponse becomeFirstResponder];
            }else if (password.text == nil || ([[password text] length] == 0)) {
                // Password field is empty do nothing
            }else {
                // Both Fields are filled in release the keyboard
                [textField resignFirstResponder];
                
#warning - ADD LOGIN FUCIONALITY HERE
                // Add LoginRequest functionality here
                
            }
        }else {
            // Not found, so remove keyboard.
            [textField resignFirstResponder];
        }
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (void) logInBarButtonClicked {
    
    UIResponder *viewResponse;
    
    UITextField *email = (UITextField *) [self.view viewWithTag:1];
    UITextField *password = (UITextField *)[self.view viewWithTag:2];
    if ([email text] == nil || ([[email text] length] == 0)) {
        viewResponse = [self.view viewWithTag:1];
        [viewResponse becomeFirstResponder];
    }else if (password.text == nil || ([[password text] length] == 0)) {
        // Password field is empty select it
        viewResponse = [self.view viewWithTag:2];
        [viewResponse becomeFirstResponder];
    }else {
        // Both Fields are filled
        // Release first responder
        [GarnishCommon resignFirstResponder:self.view];

#warning - ADD LOGIN FUCIONALITY HERE
        // Add LoginRequest functionality here
        NSString *loginXML = @"<?xml version=’1.0’ encoding=’UTF-8’ standalone=’yes’?><Response version=’1.0’><Status>Success</Status><Message>Yah!!</Message><Role>User</Role><Specials><Special><Title>50% off Grande Latte</Title><Location><ID>948H-1821-SJ12-DKJ9</ID><Name>Starbucks</Name><Status>Open</Status><Street>3000 Main St</Street><City>Rochester</City><State>NY</State><Zip>14420</Zip><Lat>43.00</Lat><Long>77.00</Long></Location><PostingTime></PostingTime><Description>$1.00 OFF any Iced drink. Excludes all Frappuccinos and Smoothies. Limit 1 per customer, may not be...</Description></Special></Specials><Profile><FirstName>Thomas</FirstName><LastName>Demeo</LastName><DOB>6/9/74</DOB></Profile></Response>";
        LoginRequest *request = [[LoginRequest alloc] init];
        [request testXML:loginXML];
                                 
        
    }
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    // Setup the top right Log In button
    UIBarButtonItem *logIn = [[UIBarButtonItem alloc] initWithTitle:@"Log In" style:UIBarButtonItemStyleDone target:self action:@selector(logInBarButtonClicked)];
    self.navigationItem.rightBarButtonItem = logIn;
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

@end
