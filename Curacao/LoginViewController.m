//
//  LoginViewController.m
//  Curacao
//
//  Created by Sitanshu Joshi on 3/14/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize txfUsername,txfPassword;
@synthesize activity;
@synthesize viewForLogin;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    frameLogin = viewForLogin.frame;
    [viewForLogin setHidden:YES];
    viewForLogin.frame  = CGRectMake(-350, frameLogin.origin.y, frameLogin.size.width, frameLogin.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [self performSelector:@selector(startAnim) withObject:nil afterDelay:0.3];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)btnLoginActionEvent:(id)sender {
    NSString *strUser = txfUsername.text;
    NSString *strPass = [NSString stringWithFormat:@"%@",txfPassword.text];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:strUser forKey:kParam_Login_username];
    [dict setValue:strPass forKey:kParam_Login_passowrd];
    
    [self executeLoginRequest:dict];
}

-(IBAction)btnBackActionEvent:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)executeLoginRequest:(NSDictionary *)dict {
    [activity startAnimating];
    [[AppDelegate appDelegate].rkomForLogin postObject:nil path:kResource_Login parameters:dict success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"%@",operation.HTTPRequestOperation.responseString);
        [activity stopAnimating];
        Login *login = [mappingResult.array firstObject];
        NSLog(@"%@",login.message);
        NSLog(@"%@",login.nodeAuth);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.description);
    }];
}

-(void)startAnim {
    [viewForLogin setHidden:NO];
    [UIView animateWithDuration:0.5
                          delay: 0.0
                        options: UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         viewForLogin.frame = CGRectMake(frameLogin.origin.x+40, frameLogin.origin.y, frameLogin.size.width, frameLogin.size.height);
                         
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.2
                                               delay: 0.0
                                             options: UIViewAnimationOptionTransitionCrossDissolve
                                          animations:^{
                                              viewForLogin.frame = frameLogin;
                                          }
                                          completion:^(BOOL finished){
                                              
                                          }
                          ];
                     }];
}
@end
