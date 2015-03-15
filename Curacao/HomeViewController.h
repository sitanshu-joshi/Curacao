//
//  HomeViewController.h
//  Curacao
//
//  Created by Sitanshu Joshi on 3/7/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <CustomSlideViewControllerDelegate> {
    
}


@property (weak, nonatomic) IBOutlet UIButton *btnMainMenu;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;

- (IBAction)btnLogin:(id)sender;


@end
