//
//  ViewController.m
//  Joke
//
//  Created by wenjuan on 16/4/5.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, 64, 70, 60);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1;
    button.backgroundColor = [UIColor orangeColor];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonClick:(UIButton *)sender {
    [WJDataRequest getJokeContentList:nil compeletion:^(WJBaseModel *response, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
