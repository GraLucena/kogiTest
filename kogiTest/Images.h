//
//  Images.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <Mantle/Mantle.h>

@class ImageDetail;

@interface Images : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) ImageDetail *low_resolution;
@property (nonatomic, strong) ImageDetail *thumbnail;
@property (nonatomic, strong) ImageDetail *standard_resolution;

@end
