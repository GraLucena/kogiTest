//
//  Caption.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <Mantle/Mantle.h>

@class From;

@interface Caption : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *created_time;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) From *from;
@property (nonatomic, strong) NSString *dataIdentifier;


@end
