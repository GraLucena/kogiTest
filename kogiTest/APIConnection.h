//
//  APIConnection.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface APIConnection : AFHTTPSessionManager

@property (strong, nonatomic) NSArray* data;

+ (instancetype)sharedInstance;

@end
