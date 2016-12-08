//
//  LoginViewController.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/6.
//  Copyright © 2016年 most. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightConstraintion;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)closeBtn:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)quckLogin:(UIButton *)sender {
    
    if (self.rightConstraintion.constant==0) {
        self.rightConstraintion.constant =-self.view.GS_width;
    }else
    {
    self.rightConstraintion.constant =0;
    }
    [UIView animateWithDuration:0.2 animations:^{
        
        [self.view layoutIfNeeded];

    }];
    
}



@end
