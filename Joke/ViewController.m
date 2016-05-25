
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

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *jokeTableView;
 

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
    [self createTitleView];
    self.interestImageArray = [NSArray array];
    self.articleArray = [NSArray array];
    self.contentArray = [NSArray array];
    
    self.jokeTableView.backgroundColor = [UIColor whiteColor];
    [self loadResultData];
    
    
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
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
        
        [cell.selectButton addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
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
