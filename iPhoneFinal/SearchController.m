//
//  SearchController.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "SearchController.h"

@implementation SearchController

@synthesize categoryView, dayControl;

-(void) selectCategory:(id)sender {
    UIButton *buttonSelected = (UIButton *) sender;
    [self deselectButtonsExcept:(buttonSelected.tag)];
    if ([buttonSelected isSelected]) {
        [buttonSelected setBackgroundColor:CategoryBackgroundColor];
        [buttonSelected setSelected:NO];
    }else {
        [buttonSelected setBackgroundColor:CategorySelectedColor];
        [buttonSelected setSelected:YES];
    }
}

-(void) deselectButtonsExcept:(NSInteger)tag {
    UIButton *button;
    
    for (int i = 20; i < 26; i++) {
        if (tag != i) {
            button = (UIButton *)[self.view viewWithTag:i];
            [button setBackgroundColor:CategoryBackgroundColor];
            button.titleLabel.textColor = [UIColor blackColor];
            [button setSelected:NO];
        }
    }
   /* button = (UIButton *) [self.view viewWithTag:21];
    [button setBackgroundColor:CategoryBackgroundColor];
    button = (UIButton *) [self.view viewWithTag:22];
    [button setBackgroundColor:CategoryBackgroundColor];
    button = (UIButton *) [self.view viewWithTag:23];
    [button setBackgroundColor:CategoryBackgroundColor];
    button = (UIButton *) [self.view viewWithTag:24];
    [button setBackgroundColor:CategoryBackgroundColor];
    button = (UIButton *) [self.view viewWithTag:25];
    [button setBackgroundColor:CategoryBackgroundColor];
    */
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
    [categoryView.layer setCornerRadius:2];
    categoryView.layer.borderColor = [UIColor colorWithRed:0.8352941176 green:0.7882352941 blue:0.7333333333 alpha:1.0].CGColor;
    categoryView.layer.borderWidth = 0.5f;
    [categoryView.layer setBackgroundColor:[UIColor colorWithRed:0.8509803922 green:0.8392156863 blue:0.8117647059 alpha:1.0].CGColor];
    [GarnishCommon setNavigationTitle:self withTitle:[self.title uppercaseString]]; 
    [GarnishCommon addPointsBanner:self];
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
