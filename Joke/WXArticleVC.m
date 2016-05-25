//
//  WXArticleVC.m
//  Joke
//
//  Created by wenjuan on 16/5/24.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WXArticleVC.h"

@interface WXArticleVC ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *contentWebView;

@end

@implementation WXArticleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文章";
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
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
