//
//  PhotosCollectionViewCell.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Data.h"
#import "Images.h"
#import "ImageDetail.h"
#import "Caption.h"

@interface PhotosCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *photoName;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;

- (void)configureCellWithContent:(Data *)photo;
@end
