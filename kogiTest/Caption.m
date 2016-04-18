//
//  Caption.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "Caption.h"
#import "DataModel.h"

@implementation Caption

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"dataIdentifier" : @"id",
             @"from" : @"from",
             @"text" : @"text",
             @"created_time" : @"created_time"
             };
}

- (NSValueTransformer *)dataModelJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:DataModel.class];
}

@end
