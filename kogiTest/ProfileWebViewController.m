//
//  ProfileWebViewController.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "ProfileWebViewController.h"

@interface ProfileWebViewController ()

@end

@implementation ProfileWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.delegate = self;
    [self loadURL];
    // Do any additional setup after loading the view.
}

-(void)loadURL{
    NSURL *url = [NSURL URLWithString:self.URL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneBttn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - WebView Delegates

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicator stopAnimating];
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
