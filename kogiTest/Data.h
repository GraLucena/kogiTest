//
//  Data.h
//
//  Created by Graciela Lucena Sivira on 4/16/16
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "APIConnection.h"

typedef void (^FetchAppsCompletionBlock)(NSMutableArray *data, NSError *error);

@class Location, Comments, Likes, Images, Caption, User;

@interface Data : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) Location *location;
@property (nonatomic, strong) Comments *comments;
@property (nonatomic, strong) NSString *filter;
@property (nonatomic, strong) NSString *created_time;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) Likes *likes;
@property (nonatomic, strong) Images *images;
@property (nonatomic, strong) Caption *caption;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) User *user;

- (void)fetchData:(FetchAppsCompletionBlock)completionBlock;
@end
