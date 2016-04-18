//
//  User.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <Mantle/Mantle.h>

@class DataModel;

@interface User : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) DataModel *user;

@end
