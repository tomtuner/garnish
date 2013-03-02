//
//  SpecialDetailController.m
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/17/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "SpecialDetailController.h"

@implementation SpecialDetailController

@synthesize shareView, hiddenView;

static NSString *CellClassName = @"SpecialDetailTableViewCell";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) sharePressed:(id) sender {
//    [self.hiddenView setHidden:NO];
    if (hiddenView.alpha == 0.0f) {
        [UIView animateWithDuration:0.3 animations:^() {
            self.hiddenView.alpha = 1.0;
        }];
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissHiddenView)];
//        [self.view addGestureRecognizer:tapGesture];
    }else {
        [self dismissHiddenView];
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dismissHiddenView {
    [UIView animateWithDuration:0.3 animations:^() {
        self.hiddenView.alpha = 0.0f;
    }];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [shareView.layer setCornerRadius:5];
    shareView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    shareView.layer.borderWidth = 1.0f;
//    [self.hiddenView setHidden:YES];
    [self.hiddenView setAlpha:0.0f];
    [self.hiddenView.layer setCornerRadius:25];
    self.hiddenView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.hiddenView.layer.borderWidth = 1.0f;
    
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *customCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellClassName];
    if (customCell == nil) {
        customCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellClassName];
        NSArray *topLevel = [[NSBundle mainBundle] loadNibNamed:@"UITableViewCell" owner:self options:nil];
        for (id currentObject in topLevel) {
            if ([currentObject isKindOfClass:[UITableViewCell class]]) {
                customCell = (UITableViewCell *) currentObject;
                break;
            }
        }
    }
    
    
    // Configure the cell...
    
    customCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Get the row at which this index is for
   /* NSInteger integ = [indexPath row];
    customCell.title.text = [(Special *)[specialsArray objectAtIndex:integ] title];
    customCell.merchantTitle.text = [(Special *)[specialsArray objectAtIndex:integ] merchant].title;
    customCell.description.text = [(Special *)[specialsArray objectAtIndex:integ] description];
    float f = [[[(Special *)[specialsArray objectAtIndex:integ] merchant] location] DFU];
    customCell.DFU.text = [NSString stringWithFormat: @"%.2f", f];*/
    
    
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
