//
//  WXArticleVC.m
//  Joke
//
//  Created by wenjuan on 16/5/24.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WXArticleVC.h"
#import "XZColor.h"
#import "ShareView.h"

@interface WXArticleVC ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *contentWebView;

@end

@implementation WXArticleVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createShareButton];
    [self setNavigationButton];
    [self createTittleFont:@"文章"];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Do any additional setup after loading the view.
    
//    NSString *dest = [NSString stringWithFormat:@"messageDetailPage?msgId=%@",self.messageInfo.messageId];
//    NSString *urlStr = [URL_PREFIX stringByAppendingString:dest];
//    self.urlArticle = urlStr;
    
    self.contentWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.contentWebView];
    self.contentWebView.delegate = self;
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlArticle]];
    [self.contentWebView loadRequest:request];
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    //创建UIActivityIndicatorView背底半透明View
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    
}

- (void)createShareButton {
    //添加我的按钮
    UIButton * myButton = [[UIButton alloc]init];
    myButton.frame = CGRectMake(0, 0, 40, 40);
    [myButton setTitle:@"分享" forState:UIControlStateNormal];
    [myButton setTitleColor:[XZColor XZBlue_0_122_255] forState:UIControlStateNormal];
    myButton.titleLabel.font = TitleFont;
    UIBarButtonItem *myBarButton = [[UIBarButtonItem alloc]initWithCustomView:myButton];
    [self.navigationItem setRightBarButtonItem:myBarButton];
    [myButton addTarget:self action:@selector(myAccountClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)myAccountClick:(UIButton *)sender {
    
    //
    ShareView * _shareView = [ShareView new];
    _shareView.url = self.urlArticle;
    _shareView.title = _titleArticle;// @"精品文章";
    _shareView.publishContentMediaType = SSPublishContentMediaTypeNews;
    
    _shareView.image = _urlImage;
    _shareView.content = _titleArticle;
    [_shareView showInWindowAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark -  Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
