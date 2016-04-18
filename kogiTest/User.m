//
//  User.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "User.h"
#import "DataModel.h"

@implementation User

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"user" : @"user"
             };
}

- (NSValueTransformer *)dataModelJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:DataModel.class];
}


@end
