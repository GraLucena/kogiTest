//
//  Images.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "Images.h"
#import "ImageDetail.h"

@implementation Images


#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"low_resolution" : @"low_resolution",
             @"thumbnail" : @"thumbnail",
             @"standard_resolution" : @"standard_resolution",
             };
}

- (NSValueTransformer *)imageDetailJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:ImageDetail.class];
}

@end
