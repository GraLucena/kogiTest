//
//  From.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface From : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *profile_picture;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *full_name;




@end
