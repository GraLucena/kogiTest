//
//  Location.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Location : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) double latitude;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double longitude;

@end
