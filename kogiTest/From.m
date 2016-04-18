//
//  From.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "From.h"

@implementation From

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"userId" : @"id",
             @"username" : @"username",
             @"profile_picture" : @"profile_picture",
             @"full_name" : @"full_name"
             };
}
@end
