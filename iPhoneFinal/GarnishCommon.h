//
//  GarnishClassUtils.h
//  iPhone
//
//  Created by Thomas DeMeo on 1/8/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PointsController.h"
#import "SpecialsController.h"
#import "FavoritesController.h"
#import "SearchController.h"
#import "ProfileController.h"
#import "PhotosController.h"

#define GarnishNavBarImageTag 8281990
#define GarnishNavBarColor [UIColor colorWithRed:0.8471 green:0.8431 blue:0.8275 alpha:1.0]

@interface GarnishCommon : NSObject {
    
}

//+ (void)swizzleSelector:(SEL)orig ofClass:(Class)c withSelector:(SEL)new;

+ (CGMutablePathRef) createRoundedRectForRect:(CGRect) rect withRadius:(CGFloat) radius;
void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor);
void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

+ (void) resignFirstResponder:(UIView *) mainView;
+ (void) addPointsBanner:(UINavigationController *) navController;
+ (void) setNavigationTitle:(UINavigationController *) navController withTitle:(NSString *) title;
+ (void) customizeNavigationController:(UINavigationController *) navController;
+ (void) showMainTabView;

@end
