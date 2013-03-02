//
//  GarnishClassUtils.m
//  iPhone
//
//  Created by Thomas DeMeo on 1/8/12.
//  Copyright 2012 Garnish Inc. All rights reserved.
//

#import "GarnishCommon.h"

@implementation GarnishCommon

+ (void) resignFirstResponder:(UIView *)mainView {
    for (UIView *v in mainView.subviews)
    {
        if (v.isFirstResponder)
        {
            [v resignFirstResponder];
            break;
        }
    }
}

+ (void) addPointsBanner:(UINavigationController *)navController {
    
    PointsController *pointsController = [PointsController sharedPointsController];
    UIView *cust = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 46, 47)];
    UIImageView *pointsImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"points_nav_banner.png"]];
    
    UIButton *tempBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 46, 47)];
    [tempBut addTarget:pointsController action:@selector(pointsNavButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *pointsLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(8, 12, 46, 10)];
    [pointsLabel1 setTextColor:[UIColor whiteColor]];
    [pointsLabel1 setBackgroundColor:[UIColor clearColor]];
    pointsLabel1.font = [UIFont boldSystemFontOfSize:12.0f];
    pointsLabel1.text = @"Earn";
    
    UILabel *pointsLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 24, 46, 10)];
    [pointsLabel2 setTextColor:[UIColor whiteColor]];
    [pointsLabel2 setBackgroundColor:[UIColor clearColor]];
    pointsLabel2.font = [UIFont boldSystemFontOfSize:12.0f];
    pointsLabel2.text = @"Points";
    
    [cust addSubview:pointsImage];
    [cust addSubview:tempBut];
    [cust addSubview:pointsLabel1];
    [cust addSubview:pointsLabel2];

    
    UIBarButtonItem *pointsNavButton = [[UIBarButtonItem alloc] initWithCustomView:cust];
   // pointsNavButton.customView.frame = CGRectMake(0,0,46,47);
//    [pointsNavButton setTarget:self];
//    [pointsNavButton setAction:@selector(points:)];
    navController.navigationItem.rightBarButtonItem = pointsNavButton;

}

+ (void)setNavigationTitle:(UINavigationController *)navController withTitle:(NSString *) title {
    UILabel *titleView = (UILabel *) navController.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont boldSystemFontOfSize:20.0];
        titleView.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.5];
        
        titleView.textColor = [UIColor blackColor]; // Change to desired color
        
        navController.navigationItem.titleView = titleView;
    }
    titleView.text = title;
    [titleView sizeToFit];
}

+ (CGMutablePathRef) createRoundedRectForRect:(CGRect) rect withRadius:(CGFloat) radius {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), 
                        CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), 
                        CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), 
                        CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), 
                        CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
    CGPathCloseSubpath(path);
    
    return path; 
}

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
}

void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    
    drawLinearGradient(context, rect, startColor, endColor);
    
    CGColorRef glossColor1 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35].CGColor;
    CGColorRef glossColor2 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1].CGColor;
    
    CGRect topHalf = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height/2);
    
    drawLinearGradient(context, topHalf, glossColor1, glossColor2);
    
}

+ (void) customizeNavigationController:(UINavigationController *)navController {
    UINavigationBar * navBar = [navController navigationBar];
    [navBar setTintColor:GarnishNavBarColor];
    
    if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [navBar setBackgroundImage:[UIImage imageNamed:@"navigation-bar-bg.png"] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        UIImageView *imageView = (UIImageView *)[navBar viewWithTag:GarnishNavBarImageTag];
        if (imageView == nil)
        {
            imageView = [[UIImageView alloc] initWithImage:
                         [UIImage imageNamed:@"navigation-bar-bg.png"]];
            [imageView setTag:GarnishNavBarImageTag];
            [navBar insertSubview:imageView atIndex:0];
        }
    }
}

+ (void) showMainTabView {
    UITabBarController *tabController = [[UITabBarController alloc] init];
    
    FavoritesController *favoritesVC = [[FavoritesController alloc] initWithNibName:nil bundle:nil];
    [favoritesVC setTitle:@"Favorites"];
    favoritesVC.tabBarItem =[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:10];
    
    UINavigationController *favoritesNav = [[UINavigationController alloc] initWithRootViewController:favoritesVC];
    //[favoritesNav.navigationBar setTintColor:GarnishNavBarColor];
    
    SearchController *searchVC = [[SearchController alloc] initWithNibName:nil bundle:nil];
    [searchVC setTitle:@"Search"];
    searchVC.tabBarItem =[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:10];
    
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:searchVC];
    //[searchNav.navigationBar setTintColor:GarnishNavBarColor];
    
    SpecialsController *specialsVC = [[SpecialsController alloc] initWithNibName:nil bundle:nil];
    [specialsVC setTitle:@"Specials"];
    
    UINavigationController *specialsNav = [[UINavigationController alloc] initWithRootViewController:specialsVC];
    //[specialsNav.navigationBar setTintColor:GarnishNavBarColor];
    
    PhotosController *photosVC = [[PhotosController alloc] initWithNibName:nil bundle:nil];
    [photosVC setTitle:@"Photos"];
    
    UINavigationController *photosNav = [[UINavigationController alloc] initWithRootViewController:photosVC];
    //[favoritesNav.navigationBar setTintColor:GarnishNavBarColor];
    
    ProfileController *profileVC = [[ProfileController alloc] initWithNibName:nil bundle:nil];
    [profileVC setTitle:@"Profile"];
    
    UINavigationController *profileNav = [[UINavigationController alloc] initWithRootViewController:profileVC];
    //[favoritesNav.navigationBar setTintColor:GarnishNavBarColor];
    
    NSArray *VC = [NSArray arrayWithObjects:favoritesNav, searchNav, specialsNav, photosNav, profileNav, nil];
    [tabController setViewControllers:VC];
    
    [tabController.tabBar setTintColor:[UIColor colorWithRed:0.2549 green:0.2431 blue:0.2235 alpha:1.0]];
    [tabController.tabBar setSelectedImageTintColor:[UIColor colorWithRed:0.7490 green:0.6510 blue:0.1176 alpha:1.0]];
    
    [tabController setSelectedIndex:2];
    
    iPhoneFinalAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.window setRootViewController:tabController];
    [delegate.window makeKeyAndVisible];
}


/*
+ (void)swizzleSelector:(SEL)orig ofClass:(Class)c withSelector:(SEL)new;
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    
    if (class_addMethod(c, orig, method_getImplementation(newMethod),
                        method_getTypeEncoding(newMethod)))
    {
        class_replaceMethod(c, new, method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    }
    else
    {
        method_exchangeImplementations(origMethod, newMethod);
    }
}
*/
@end
