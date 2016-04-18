//
//  ProfileWebViewController.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileWebViewController : UIViewController <UIWebViewDelegate>

@property(nonatomic, strong) NSString *URL;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
