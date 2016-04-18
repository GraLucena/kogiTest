//
//  Comments.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "Comments.h"
#import "DataModel.h"

@implementation Comments


#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"count" : @"count",
             @"data" : @"data"
             };
}

- (NSValueTransformer *)dataModelJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:DataModel.class];
}

@end
