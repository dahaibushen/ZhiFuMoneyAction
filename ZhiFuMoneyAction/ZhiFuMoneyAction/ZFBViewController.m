//
//  ZFBViewController.m
//  ZhiFuMoneyAction
//
//  Created by huyiyong on 17/2/16.
//  Copyright © 2017年 huyiyong. All rights reserved.
//

#import "ZFBViewController.h"
#import <AlipaySDK/AlipaySDK.h>

@interface ZFBViewController ()

@end

@implementation ZFBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(120, 120, 120, 30)];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(buttClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 
-(void)buttClick:(UIButton*)btn{
  
   

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
