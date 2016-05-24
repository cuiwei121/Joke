//
//  ViewController.m
//  Joke
//
//  Created by wenjuan on 16/4/5.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "ViewController.h"
#import "ContentTVCell.h"
#import "InterestImageTVCell.h"
#import "UIImage+GIF.h"
#import "WXArticleVC.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *jokeTableView;
@property (nonatomic, strong) UISegmentedControl *segment;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) NSArray *contentArray;
@property (nonatomic, strong) NSArray *interestImageArray;
@property (nonatomic, strong) NSArray *articleArray;

//放大的图片的背景图
@property (nonatomic, strong) UIView *bigImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"笑话";
    self.interestImageArray = [NSArray array];
    self.articleArray = [NSArray array];
    self.contentArray = [NSArray array];
    
    self.jokeTableView.backgroundColor = [UIColor orangeColor];
    [self loadResultData];
    
    
    NSArray *arr = @[@"笑话",@"精文"];
    _segment = [[UISegmentedControl alloc]initWithItems:arr];
    //        [segment setApportionsSegmentWidthsByContent:YES];
    //在没有设置[segment setApportionsSegmentWidthsByContent:YES]时，每个的宽度按segment的宽度平分
    _segment.frame = CGRectMake(0,64, SCREEN_WIDTH, 40);
    _segment.selectedSegmentIndex = 0;
    [_segment setTintColor:[UIColor greenColor]];
    _segment.layer.cornerRadius = 40;
    [_segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segment];
    
}


-(void)change:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index) {
        case 0:
            self.dataArray = self.contentArray;
            break;
        case 1:
            self.dataArray = self.articleArray;
            [self loadWeiXinData];
            break;
            
            
        case 2:
            
            self.dataArray = self.interestImageArray;
            [self loadImageData];
            break;
        default:
            break;
          
    }
    
    [self.jokeTableView reloadData];
}


- (UITableView *)jokeTableView {

    if (!_jokeTableView) {
        _jokeTableView = [[UITableView alloc]init];
        [self.view addSubview:_jokeTableView];
        _jokeTableView.delegate = self;
        _jokeTableView.dataSource = self;
        _jokeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_jokeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(104, 0, 50, 0));
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
     if(_segment.selectedSegmentIndex == 0) {
         
         ContentTVCell *cell=(ContentTVCell*)[self tableView:self.jokeTableView cellForRowAtIndexPath:indexPath];
         return [cell returnCellHeight];
     }else  if(_segment.selectedSegmentIndex == 2) {
         
         InterestImageTVCell *cell=(InterestImageTVCell*)[self tableView:self.jokeTableView cellForRowAtIndexPath:indexPath];
         return [cell returnCellHeight];
     }else {
         
         ContentTVCell *cell=(ContentTVCell*)[self tableView:self.jokeTableView cellForRowAtIndexPath:indexPath];
         return [cell returnCellHeight];
        
     }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(_segment.selectedSegmentIndex == 0) {
        NSString *identifier = @"contentCell";
        ContentTVCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[ContentTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        JokeContentDataModel *dataM = [self.dataArray objectAtIndex:indexPath.row];
        cell.contentLabel.text = dataM.content;
        
        
        //    cell.textLabel.text = @"q213134";
        return cell;

    }else  if(_segment.selectedSegmentIndex == 2) {
        
        NSString *identifier = @"cells";
        ContentTVCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[ContentTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        WeiXinListModel *dataM = [self.dataArray objectAtIndex:indexPath.row];
        cell.contentLabel.text = dataM.title;
        
        
        //    cell.textLabel.text = @"q213134";
        return cell;
        

    }else {
        NSString *identifier = @"interestImageCell";
        InterestImageTVCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[InterestImageTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        JokeContentDataModel *dataM = [self.dataArray objectAtIndex:indexPath.row];
        cell.contentLabel.text = dataM.content;
        
        NSURL *mUrl = [NSURL URLWithString:dataM.url];
        [cell.interestImageV sd_setImageWithURL:mUrl placeholderImage:[UIImage imageNamed:@"h_star_se"]];
        [cell.selectButton addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //setImageWithURL:dataM.url];
        //    cell.textLabel.text = @"q213134";
        return cell;

    }
 }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeiXinListModel *dataM = [self.dataArray objectAtIndex:indexPath.row];
  

    WXArticleVC * wxVC = [[WXArticleVC alloc]init];
    wxVC.urlArticle = dataM.url;
    
    [self.navigationController pushViewController:wxVC animated:YES];
}



- (void)loadResultData {
    [WJDataRequest getJokeContentList:nil compeletion:^(JokeContentResponse *response, NSError *error) {
        JokeContentResultModel *resultM = response.result;
        self.contentArray = resultM.data;
        self.dataArray = self.contentArray;
        [self.jokeTableView reloadData];
//        NSArray * dataA = resultM.data;
//        JokeContentDataModel *dataM = [dataA objectAtIndex:0];
//        LOG(@"%@",dataM.content);
        
    }];
}


- (void)loadImageData {
    [WJDataRequest getInterestImage:nil compeletion:^(JokeContentResponse *response, NSError *error) {
        JokeContentResultModel *resultM = response.result;
        self.interestImageArray = resultM.data;
        self.dataArray = self.interestImageArray;
        [self.jokeTableView reloadData];
        //        NSArray * dataA = resultM.data;
        //        JokeContentDataModel *dataM = [dataA objectAtIndex:0];
        //        LOG(@"%@",dataM.content);
        
    }];
}


- (void)loadWeiXinData {
    [WJDataRequest getWeiXin:nil compeletion:^(WeiXinResponse *response, NSError *error) {
        WeiXinResultModel *resultM = response.result;
        self.articleArray = resultM.list;
        self.dataArray = self.articleArray;
        [self.jokeTableView reloadData];
        LOG(@"response = %@，，，error = %@",response,error);
    }];
}



//放大图片
- (void)selectButtonClick:(UIButton *)sender {
    LOG(@"放大图片");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showBigImage {

}



@end
