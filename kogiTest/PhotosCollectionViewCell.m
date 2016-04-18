//
//  PhotosCollectionViewCell.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "PhotosCollectionViewCell.h"

@implementation PhotosCollectionViewCell


- (void)configureCellWithContent:(Data *)photo {
    
    [self.photoImage sd_setImageWithURL:[NSURL URLWithString:photo.images.thumbnail.url]];
    self.photoName.text = photo.caption.text;

}
@end
