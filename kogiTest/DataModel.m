//
//  DataModel.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "DataModel.h"
#import "From.h"

@implementation DataModel

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"dataIdentifier" : @"id",
             @"created_time" : @"created_time",
             @"text" : @"text",
             @"from" : @"from"
             };
}

- (NSValueTransformer *)fromJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:From.class];
}


@end
