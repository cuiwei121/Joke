//
//  ViewController.m
//  Joke
//
//  Created by wenjuan on 16/4/5.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "ViewController.h"
#import "ContentTVCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *jokeTableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIButton *button = [[UIButton alloc]init];
//    button.frame = CGRectMake(0, 64, 70, 60);
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    button.tag = 1;
//    button.backgroundColor = [UIColor orangeColor];
    
    self.jokeTableView.backgroundColor = [UIColor orangeColor];
   
    [self loadResultData];
}

- (UITableView *)jokeTableView {

    if (!_jokeTableView) {
        _jokeTableView = [[UITableView alloc]init];
        [self.view addSubview:_jokeTableView];
        _jokeTableView.delegate = self;
        _jokeTableView.dataSource = self;
        _jokeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_jokeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64, 0, 50, 0));
        }];
    }
    return _jokeTableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cells";
    ContentTVCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ContentTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    JokeContentDataModel *dataM = [self.dataArray objectAtIndex:indexPath.row];
    cell.contentLabel.text = dataM.content;
//    cell.textLabel.text = @"q213134";
    return cell;
}




- (void)loadResultData {
    [WJDataRequest getJokeContentList:nil compeletion:^(JokeContentResponse *response, NSError *error) {
        JokeContentResultModel *resultM = response.result;
        self.dataArray = resultM.data;
        [self.jokeTableView reloadData];
//        NSArray * dataA = resultM.data;
//        JokeContentDataModel *dataM = [dataA objectAtIndex:0];
//        LOG(@"%@",dataM.content);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
