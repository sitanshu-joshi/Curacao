//
//  LoginViewController.h
//  Curacao
//
//  Created by Sitanshu Joshi on 3/14/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController {
    CGRect frameLogin;
}

@property (weak, nonatomic) IBOutlet UITextField *txfUsername;
@property (weak, nonatomic) IBOutlet UITextField *txfPassword;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@property (weak, nonatomic) IBOutlet UIView *viewForLogin;

- (IBAction)btnLoginActionEvent:(id)sender;
- (IBAction)btnBackActionEvent:(id)sender;

@end
