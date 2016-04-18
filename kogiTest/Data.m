//
//  Data.m
//
//  Created by Graciela Lucena Sivira on 4/16/16
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "Data.h"
#import "Location.h"
#import "Comments.h"
#import "Likes.h"
#import "Images.h"
#import "Caption.h"
#import "User.h"

@implementation Data

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"dataIdentifier" : @"id",
             @"tags" : @"tags",
             @"location" : @"location",
             @"comments" : @"comments",
             @"filter" : @"filter",
             @"created_time" : @"created_time",
             @"link" : @"link",
             @"likes" : @"likes",
             @"images" : @"images",
             @"caption" : @"caption",
             @"type" : @"type",
             @"user" : @"user"
             };
}

- (NSValueTransformer *)locationJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Location.class];
}

- (NSValueTransformer *)commentsJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Comments.class];
}

- (NSValueTransformer *)likesJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Likes.class];
}

- (NSValueTransformer *)imagesJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Images.class];
}

- (NSValueTransformer *)captionJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Caption.class];
}

- (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:User.class];
}

#pragma mark - fetching
- (void)fetchData:(FetchAppsCompletionBlock)completionBlock
{
    NSString *path = @"v1/media/popular?client_id=05132c49e9f148ec9b8282af33f88ac7";
    
    [[APIConnection sharedInstance] GET:path parameters:nil progress:^(NSProgress * _Nonnull uploadProgress){
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSMutableArray *photos = [[NSMutableArray alloc] initWithCapacity:[responseObject[@"data"] count]];
        for (NSDictionary *JSONData in responseObject[@"data"]) {
            Data *photo = [MTLJSONAdapter modelOfClass:[Data class] fromJSONDictionary:JSONData error:nil];
            
            if (photo) [photos addObject:photo];
        }
        
        completionBlock(photos, nil);
        
    }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
          completionBlock(nil, error);
      }];
}

@end
