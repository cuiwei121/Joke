
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
#import "WXArticleCell.h"
#import "UIImageView+AFNetworking.h"
#import "MyAccountVC.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *jokeTableView;
 

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *contentArray;
@property (nonatomic, strong) NSMutableArray *interestImageArray;
@property (nonatomic, strong) NSMutableArray *articleArray;

//微信加载的页数

@property (nonatomic, assign) int  numberWX;
@property (nonatomic, assign) int  numberJoke;

//放大的图片的背景图
@property (nonatomic, strong) UIView *bigImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"笑话";
    [self createTitleView];
    self.interestImageArray = [NSMutableArray array];
    self.articleArray = [NSMutableArray array];
    self.contentArray = [NSMutableArray array];
    self.numberWX = 1;
    self.numberJoke = 1;
    
    self.jokeTableView.backgroundColor = [UIColor whiteColor];
//    [self loadWeiXinData:@"0"];
    [self loadResultData:@"0"];
    
//    [self loadImageData];
    
    
//    //下拉刷新
    self.jokeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(endHanderFresh)];
    
    //上拉加载
    self.jokeTableView.mj_footer =  [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(endFooterFresh)];
    
//    NSArray *familyNames = [UIFont familyNames];
//    for( NSString *familyName in familyNames )
//    {
//        printf( "Family: %s \n", [familyName UTF8String]);
//        
//        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
//        for( NSString *fontName in fontNames )
//        {
//            printf( "\tFont: %s \n", [fontName UTF8String] );
//        }
//    }
}


-(void)change:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    
    switch (Index) {
        case 0:
            self.dataArray = self.contentArray;
            break;
        case 1:
            self.dataArray = self.articleArray;
            [self loadWeiXinData:@"0"];
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

- (void)myAccountClick:(UIButton *)sender {
    MyAccountVC * myAccount = [[MyAccountVC alloc]init];
    [self.navigationController pushViewController:myAccount animated:YES];
}

- (UITableView *)jokeTableView {

    if (!_jokeTableView) {
        _jokeTableView = [[UITableView alloc]init];
        [self.view addSubview:_jokeTableView];
        _jokeTableView.delegate = self;
        _jokeTableView.dataSource = self;
        _jokeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_jokeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return _jokeTableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


#pragma mark - tableview代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     if(self.segment.selectedSegmentIndex == 0) {
         
         ContentTVCell *cell=(ContentTVCell*)[self tableView:self.jokeTableView cellForRowAtIndexPath:indexPath];
         return [cell returnCellHeight];
     }else  if(self.segment.selectedSegmentIndex == 1) {
         WXArticleCell *cell=(WXArticleCell*)[self tableView:self.jokeTableView cellForRowAtIndexPath:indexPath];
         return [cell returnCellHeight];
        
     }else {
         InterestImageTVCell *cell=(InterestImageTVCell*)[self tableView:self.jokeTableView cellForRowAtIndexPath:indexPath];
         return [cell returnCellHeight];
        
     }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.segment.selectedSegmentIndex == 0) {
        NSString *identifier = @"contentCell";
        ContentTVCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[ContentTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        JokeContentDataModel *dataM = [self.dataArray objectAtIndex:indexPath.row];
        cell.contentLabel.text = dataM.content;
        [cell.contentLabel spaceLabel:ContentFontSpace];
        
        
        //    cell.textLabel.text = @"q213134";
        return cell;

    }else  if(self.segment.selectedSegmentIndex == 1) {
        
        NSString *identifier = @"cells";
        WXArticleCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[WXArticleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        
        WeiXinListModel *dataM = [self.dataArray objectAtIndex:indexPath.row];
        cell.wxContentLabel.text = dataM.title;
        [cell.wxContentLabel spaceLabel:WXContentFontSpace];
        NSURL *mUrl = [NSURL URLWithString:dataM.firstImg];
        
        //使用的是afnetworking中的图片下载
        __block WXArticleCell *weakCell = cell;
        [cell.wxImageView setImageWithURLRequest:[NSURLRequest requestWithURL:mUrl] placeholderImage:[UIImage imageNamed:@"h_star_se"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            
            weakCell.wxImageView.image =  [self compressImageWith:image width:100 height:80];
            
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            
        }];
        
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
        
        //setImageWithURL:dataM.url];
        //    cell.textLabel.text = @"q213134";
        return cell;

    }
 }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.segment.selectedSegmentIndex == 1) {
        WeiXinListModel *dataM = [self.dataArray objectAtIndex:indexPath.row];
        
        WXArticleVC * wxVC = [[WXArticleVC alloc]init];
        wxVC.urlArticle = dataM.url;
        
        [self.navigationController pushViewController:wxVC animated:YES];
    }
}


#pragma mark - 加载数据
- (void)loadResultData:(NSString *)footOrHeader {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *param = [NSString stringWithFormat:@"%d",self.numberJoke];
   
    
    [WJDataRequest getJokeContentList:param compeletion:^(JokeContentResponse *response, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
       
        if (error || response == nil) {
            return ;
        }
        
        JokeContentResultModel *resultM = response.result;
        if (resultM.data) {
            if ([footOrHeader isEqualToString:@"1"]) {
                _numberJoke ++;
                NSMutableArray *m = [NSMutableArray arrayWithArray:self.contentArray];
                if (resultM.data.count > 0) {
                    for (id temp in resultM.data) {
                        
                        if (![m containsObject:temp]) {
                            [m addObject:temp];
                        }
                    }
                    self.contentArray = m;
                }
            }else {
                _numberJoke ++;
                NSMutableArray *m = [NSMutableArray arrayWithArray:self.contentArray];
                if (resultM.data.count > 0) {
                    for (id temp in resultM.data) {
                        if (![m containsObject:temp]) {
                            [m insertObject:temp atIndex:0];
                        }
                        
                    }
                    self.contentArray = m;
                }
            }
            
            if(self.segment.selectedSegmentIndex == 0) {
                self.dataArray = self.contentArray;
                [self.jokeTableView reloadData];
            }
//            LOG(@"response = %@，，，error = %@",response,error);
            
        }

//        NSArray * dataA = resultM.data;
//        JokeContentDataModel *dataM = [dataA objectAtIndex:0];
//        LOG(@"%@",dataM.content);
        
    }];
}


- (void)loadImageData {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [WJDataRequest getInterestImage:nil compeletion:^(JokeContentResponse *response, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        JokeContentResultModel *resultM = response.result;
//        self.interestImageArray = resultM.data;
//        self.dataArray = self.interestImageArray;
//        [self.jokeTableView reloadData];
        //        NSArray * dataA = resultM.data;
        //        JokeContentDataModel *dataM = [dataA objectAtIndex:0];
        //        LOG(@"%@",dataM.content);
        
    }];
}


- (void)loadWeiXinData:(NSString *)footOrHeader {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSString *param =nil;
    if ([footOrHeader isEqualToString:@"1"]) {
        self.numberWX += 1;
        param = [NSString stringWithFormat:@"%d",self.numberWX ];
    }else {
        param = @"1";
    }
    
    
    [WJDataRequest getWeiXin:param compeletion:^(WeiXinResponse *response, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        if (error || response == nil) {
            return ;
        }
        
        WeiXinResultModel *resultM = response.result;
        
        if (resultM.list) {
            if ([footOrHeader isEqualToString:@"1"]) {
                NSMutableArray *m = [NSMutableArray arrayWithArray:self.articleArray];
                if (resultM.list.count > 0) {
                    for (id temp in resultM.list) {
                        
                        if (![m containsObject:temp]) {
                            [m addObject:temp];
                        }
                    }
                    self.articleArray = m;
                }
            }else {
                NSMutableArray *m = [NSMutableArray arrayWithArray:self.articleArray];
                if (resultM.list.count > 0) {
                    for (id temp in resultM.list) {
                        if (![m containsObject:temp]) {
                             [m insertObject:temp atIndex:0];
                        }
                        
                    }
                    self.articleArray = m;
                }
                
            }
            
            if(self.segment.selectedSegmentIndex == 1) {
                self.dataArray = self.articleArray;
                [self.jokeTableView reloadData];
            }
           
            LOG(@"response = %@，，，error = %@",response,error);

        }
    }];
}



- (void)endHanderFresh {
    if(self.segment.selectedSegmentIndex == 1) {
        [self loadWeiXinData:@"0"];
    }else if(self.segment.selectedSegmentIndex == 0) {
        [self loadResultData:@"0"];
    }
    
    
    [self.jokeTableView.mj_header endRefreshing];
}

- (void)endFooterFresh {
    
    if(self.segment.selectedSegmentIndex == 1) {
        [self loadWeiXinData:@"1"];
    }else if(self.segment.selectedSegmentIndex == 0) {
        [self loadResultData:@"1"];
    }
    
    [self.jokeTableView.mj_footer endRefreshing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//把大图切成小图
-(UIImage *)compressImageWith:(UIImage *)image width:(float)width height:(float)height
{
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 2.0);
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //    [newImage retain];
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

@end
