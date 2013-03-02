//
//  SpecialsController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecialsTableViewCell.h"
#import "BaseEntity.h"
#import "NetworkManager.h"
#import "Special.h"
#import "SpecialDetailController.h"
#import "GarnishCommon.h"

@interface SpecialsController : UIViewController {
    UISegmentedControl *segControl;
    BaseEntity *entity;
    UITableView *tableView;
    NSArray *specialsArray;
}

@property (strong, nonatomic) BaseEntity *entity;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (nonatomic, strong) NSArray *specialsArray;

@end
