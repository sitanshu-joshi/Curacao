//
//  HomeViewController.m
//  Curacao
//
//  Created by Sitanshu Joshi on 3/7/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize btnMainMenu,btnMenu;
@synthesize viewForMenu;

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
    btnMenu.layer.cornerRadius = 18.0;
    frameForSecondarymenu = viewForMenu.frame;
    viewForMenu.frame = CGRectMake(frameForSecondarymenu.origin.x, frameForSecondarymenu.origin.y, frameForSecondarymenu.size.width, 0);
    [viewForMenu setHidden:NO];
    [btnMainMenu addTarget:self action: @selector(mainMenuBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.revealViewController.delegate = self;
}
-(void)mainMenuBtnClicked {
    [self.revealViewController revealToggle:btnMainMenu];
}

- (IBAction)btnLogin:(id)sender {
    [self performSegueWithIdentifier:kPush_To_Login sender:self];
}

- (IBAction)btnForMenuShowHide:(id)sender {
    if (viewForMenu.frame.size.height == 0.0) {
        [self showSecondaryMenu];
    } else {
        [self hideSecondaryMenu];
    }
}

#pragma mark General Methods
-(void)showSecondaryMenu {
    viewForMenu.frame = frameForSecondarymenu;
}
-(void)hideSecondaryMenu {
    viewForMenu.frame = CGRectMake(frameForSecondarymenu.origin.x, frameForSecondarymenu.origin.y, frameForSecondarymenu.size.width, 0.0);
}
@end
