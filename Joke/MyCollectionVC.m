//
//  MyCollectionVC.m
//  Joke
//
//  Created by wenjuan on 16/5/26.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "MyCollectionVC.h"
#import "ContentTVCell.h"

@interface MyCollectionVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myAccountTableV;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MyCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationButton];
    self.title = @"我的收藏";
    
    
    
    NSMutableArray * collectA = [[NSUserDefaults standardUserDefaults] objectForKey:COLLECT_ARRAY_KEY];
    if (collectA) {
        self.dataArray = collectA;
    }
    
    self.myAccountTableV.backgroundColor = [UIColor lightGrayColor];
    
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContentTVCell *cell=(ContentTVCell*)[self tableView:self.myAccountTableV cellForRowAtIndexPath:indexPath];
    return [cell returnCellHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"MyAccountCell";
    ContentTVCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ContentTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSString *dataM = [self.dataArray objectAtIndex:indexPath.row];
    cell.contentLabel.text = dataM;
    cell.collectButton.selected = YES;
    [cell.contentLabel spaceLabel:ContentFontSpace];
    
    //setImageWithURL:dataM.url];
    //    cell.textLabel.text = @"q213134";
    return cell;
    
    
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
