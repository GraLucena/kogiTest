//
//  APIConnection.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "APIConnection.h"
#import <AFNetworkActivityIndicatorManager.h>
#import "Data.h"

static NSString * const BaseUrl = @"https://api.instagram.com/";

@implementation APIConnection

+ (instancetype)sharedInstance {
    static APIConnection *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Network activity indicator manager setup
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        
        // Session configuration setup
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024     // 10MB. memory cache
                                                          diskCapacity:50 * 1024 * 1024     // 50MB. on disk cache
                                                              diskPath:nil];
        
        sessionConfiguration.URLCache = cache;
        sessionConfiguration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        
        // Initialize the session
        _sharedInstance = [[APIConnection alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl] sessionConfiguration:sessionConfiguration];
    });
    
    return _sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    if (!self) return nil;
    // Reachability setup
    [self.reachabilityManager startMonitoring];
    
    return self;
}

@end
