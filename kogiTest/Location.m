//
//  Location.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "Location.h"

@implementation Location

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"latitude" : @"latitude",
             @"name" : @"name",
             @"longitude" : @"longitude"
             };
}

@end