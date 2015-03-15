//
//  ViewController.m
//  Curacao
//
//  Created by Sitanshu Joshi on 3/3/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self ini];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self performSegueWithIdentifier:kPush_To_CustomSlider sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ini {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    
    UITabBarController *tabBarController = (UITabBarController*)[mainStoryboard
                                                       instantiateViewControllerWithIdentifier: @"tabBarView"];
    
    
    UITabBar *tabBar = tabBarController.tabBar;
    tabBar.backgroundColor = [UIColor blueColor];
//    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
//    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
//    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
//    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
//    
//    tabBarItem1.title = @"Home";
//    tabBarItem2.title = @"Maps";
//    tabBarItem3.title = @"My Plan";
//    tabBarItem4.title = @"Settings";
//    
//    [tabBarItem1 setSelectedImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    
//    
//    // Change the tab bar background
//    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
//    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
//    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];
//    
//    // Change the title color of tab bar items
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                       [UIColor whiteColor], UITextAttributeTextColor,
//                                                       nil] forState:UIControlStateNormal];
//    UIColor *titleHighlightedColor = [UIColor colorWithRed:153/255.0 green:192/255.0 blue:48/255.0 alpha:1.0];
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                       titleHighlightedColor, UITextAttributeTextColor,
//                                                       nil] forState:UIControlStateHighlighted];
}

@end
