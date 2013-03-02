//
//  SpecialsController.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "SpecialsController.h"

@implementation SpecialsController

@synthesize segControl;
@synthesize tableView;
@synthesize specialsArray;
@synthesize entity = _entity;

static NSString *CellClassName = @"SpecialsTableViewCell";

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
    [self.tableView setSeparatorColor:[UIColor colorWithRed:0.8353 green:0.7882 blue:0.7333 alpha:1.0]];
    [GarnishCommon setNavigationTitle:self withTitle:[self.title uppercaseString]]; 
    [GarnishCommon addPointsBanner:self];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
//    [[NetworkManager sharedNetworkManager] loadSpecialsForEntity:self.entity];
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
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SpecialsTableViewCell *customCell = (SpecialsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellClassName];
    if (customCell == nil) {
        customCell = [[SpecialsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellClassName];
        NSArray *topLevel = [[NSBundle mainBundle] loadNibNamed:@"SpecialsTableViewCell" owner:self options:nil];
        for (id currentObject in topLevel) {
            if ([currentObject isKindOfClass:[UITableViewCell class]]) {
                customCell = (SpecialsTableViewCell *) currentObject;
                break;
            }
        }
    }
    
    
    // Configure the cell...
    
    customCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Get the row at which this index is for
    NSInteger integ = [indexPath row];
    customCell.title.text = [(Special *)[specialsArray objectAtIndex:integ] title];
    customCell.merchantTitle.text = [(Special *)[specialsArray objectAtIndex:integ] merchant].title;
    customCell.description.text = [(Special *)[specialsArray objectAtIndex:integ] description];
    float f = [[[(Special *)[specialsArray objectAtIndex:integ] merchant] location] DFU];
    customCell.distance.text = [NSString stringWithFormat: @"%.2f", f];

    
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
    
     SpecialDetailController *detailViewController = [[SpecialDetailController alloc] initWithNibName:@"SpecialDetailController" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
//     [detailViewController release];
     
}

@end
