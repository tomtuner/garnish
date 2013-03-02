//
//  GarnishAccountController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GarnishAccountController : UIViewController {
    UITextField *email;
    UITextField *firstName;
    UITextField *lastName;
    UITextField *gender;
    UITextField *phoneNumber;
    UITextField *birthday;
    NSDictionary *facebookDict;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil facebookDictionary:(NSDictionary *)facebook;
- (IBAction)callDP:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *gender;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *birthday;
@property (strong, nonatomic) NSDictionary *facebookDict;

@end
