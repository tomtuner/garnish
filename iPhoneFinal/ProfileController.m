//
//  ProfileController.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "ProfileController.h"

@implementation ProfileController

@synthesize scrollView;

static NSString *CellClassName = @"ProfileTableViewCell";

- (void) logoutGarnish {
    iPhoneFinalAppDelegate *del = [[UIApplication sharedApplication] delegate];
    
    SettingsManager *settings = [SettingsManager sharedSettingsManager];
    [settings setLoggedIn:NO];
    
    if ([[[del initialNavController] viewControllers] count] == 0) {
        InitialController *initialController = [[InitialController alloc] initWithNibName:nil bundle:nil];
        [initialController setTitle:@"Back"];
        
        [[del initialNavController] pushViewController: initialController animated:YES];
    }else {
        [[del initialNavController] popToRootViewControllerAnimated:YES];
    }
    [del.window setRootViewController:[del initialNavController]];
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

- (void)settingsBarButtonClicked {
    NSLog(@"Settings");
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+425)];
    [scrollView setScrollEnabled:YES];
    
    // Do any additional setup after loading the view from its nib.
    [GarnishCommon setNavigationTitle:self withTitle:[self.title uppercaseString]]; 
    [GarnishCommon addPointsBanner:self];
    
    UIBarButtonItem *logIn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(settingsBarButtonClicked)];
    [logIn setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.navigationItem.leftBarButtonItem = logIn;
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
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ProfileTableViewCell *customCell = (ProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellClassName];
    if (customCell == nil) {
        customCell = [[ProfileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellClassName];
        NSArray *topLevel = [[NSBundle mainBundle] loadNibNamed:@"ProfileTableViewCell" owner:self options:nil];
        for (id currentObject in topLevel) {
            if ([currentObject isKindOfClass:[UITableViewCell class]]) {
                customCell = (ProfileTableViewCell *) currentObject;
                break;
            }
        }
    }
    
    // Configure the cell...
    
    return customCell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

 #pragma mark - Table view delegate
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Navigation logic may go here. Create and push another view controller.
 /*
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
 // ...
 // Pass the selected object to the new view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 [detailViewController release];
 */
}

@end
