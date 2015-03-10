//
//  StoreLocatorViewController.m
//  Curacao
//
//  Created by Sitanshu Joshi on 3/10/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import "StoreLocatorViewController.h"

@interface StoreLocatorViewController ()

@end

@implementation StoreLocatorViewController
@synthesize btnMenu;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupInitUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark General Methods
-(void)setupInitUI {
    [btnMenu addTarget:self action: @selector(mainMenuBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.revealViewController.delegate = self;
}
-(void)mainMenuBtnClicked {
    [self.revealViewController revealToggle:btnMenu];
}

@end
