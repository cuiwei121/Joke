//
//  MyAccountVC.m
//  Joke
//
//  Created by wenjuan on 16/5/26.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

/*
 1.我的收藏
 2.评分
 3.新浪微博  徐_Aaron
 4.服务QQ 1043037904
 5.当前版本
 */

#import "MyAccountVC.h"
#import "MyAccountCell.h"
#import "MyCollectionVC.h"

@interface MyAccountVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myAccountTableV;
@property (nonatomic, strong) NSArray *cellTitleArray;

@end

@implementation MyAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationButton];
    [self createTittleFont:@"我的"];
    
    self.myAccountTableV.backgroundColor = [UIColor lightGrayColor];
}

- (UITableView *)myAccountTableV {
    
    if (!_myAccountTableV) {
        _myAccountTableV = [[UITableView alloc]init];
        [self.view addSubview:_myAccountTableV];
        _myAccountTableV.delegate = self;
        _myAccountTableV.dataSource = self;
        _myAccountTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_myAccountTableV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return _myAccountTableV;
}


- (NSArray *)cellTitleArray {
    if (!_cellTitleArray) {
        _cellTitleArray = @[@"我的收藏",@"评分",@"当前版本"];
    }
    return  _cellTitleArray;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        NSString *identifier = @"MyAccountCell";
        MyAccountCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[MyAccountCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    
        cell.titleLabel.text = [self.cellTitleArray objectAtIndex:indexPath.row];
        //setImageWithURL:dataM.url];
        //    cell.textLabel.text = @"q213134";
        return cell;
        
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        LOG(@"跳转到我的收藏界面中");
        MyCollectionVC *myCollection = [[MyCollectionVC alloc]init];
        [self.navigationController pushViewController:myCollection animated:YES];
    }
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
