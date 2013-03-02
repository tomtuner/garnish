//
//  FavoritesController.h
//  iPhoneFinal
//
//  Created by Thomas DeMeo on 1/14/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesTableViewCell.h"
#import "MapButton.h"
#import "NetworkManager.h"
#import "GarnishCommon.h"

@class MapButton;

@interface FavoritesController : UIViewController {
    UITableView *tableView;
    MapButton *mapButton;
    BaseEntity *entity;
}

@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, strong) IBOutlet MapButton *mapButton;
@property (strong, nonatomic) BaseEntity *entity;

@end
