//
//  ViewController.m
//  loading
//
//  Created by 黄少华 on 16/4/7.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "ViewController.h"
#import "SHActivityIndicatorAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGSize size = CGSizeMake(50, 50);
    
    SHActivityIndicatorAnimation *animation = [[SHActivityIndicatorAnimation alloc] init];
    [animation setupAnimationInLayer:self.view.layer size:size color:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
