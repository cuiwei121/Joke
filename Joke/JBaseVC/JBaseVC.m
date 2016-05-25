//
//  JBaseVC.m
//  Joke
//
//  Created by wenjuan on 16/4/5.
//  Copyright © 2016年 wenjuan. All rights reserved.
//
@import GoogleMobileAds;
#import "JBaseVC.h"

@interface JBaseVC ()

@end

@implementation JBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
       self.view.backgroundColor = [UIColor whiteColor];
    
    
    
//    self.bannerView = [[GADBannerView alloc]init];
////    self.bannerView.backgroundColor = [UIColor greenColor];
//    self.bannerView.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
//    [self.view addSubview:self.bannerView];
////    self.bannerView.adUnitID = @"ca-app-pub-3469552292226288/9081240452";
////    self.bannerView.rootViewController = self;
////    
////    GADRequest *request = [GADRequest request];
////    request.testDevices = @[
////                            @"2077ef9a63d2b398840261c8221a0c9a"  // Eric's iPod Touch
////                            ];
////    [self.bannerView loadRequest:request];
//    
//    UIButton *button = [[UIButton alloc]init];
//  
//    [self.view addSubview:button];
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(_bannerView.mas_top);
//        make.left.right.equalTo(_bannerView);
//        make.height.equalTo(@80);
//    }];
//    
//    button.tag = 1;
//    button.backgroundColor = [UIColor orangeColor];
}


- (void)createTitleView {
    UIView * titleView = [[UIView alloc]init];
    titleView.frame = CGRectMake(0, 0, 100, 40);
    titleView.backgroundColor = [UIColor orangeColor];
    
    NSArray *arr = @[@"笑话",@"精文"];
    self.segment = [[UISegmentedControl alloc]initWithItems:arr];
    //        [segment setApportionsSegmentWidthsByContent:YES];
    //在没有设置[segment setApportionsSegmentWidthsByContent:YES]时，每个的宽度按segment的宽度平分
    self.segment.frame = CGRectMake(0,0, 100, 40);
    self.segment.selectedSegmentIndex = 0;
    [self.segment setTintColor:[UIColor greenColor]];
    //    self.segment.layer.cornerRadius = 40;
    [self.segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [titleView addSubview:self.segment];
    self.segment.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,  [UIFont fontWithName:@"Helvetica" size:18.f],UITextAttributeFont ,[UIColor whiteColor],UITextAttributeTextShadowColor ,nil];
    [self.segment setTitleTextAttributes:dic forState:UIControlStateSelected];

    
    self.navigationItem.titleView = titleView;
}


-(void)change:(UISegmentedControl *)Seg{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
