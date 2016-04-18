//
//  HomeViewController.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "APIConnection.h"
#import "Data.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HomeViewController : UIViewController <iCarouselDataSource, iCarouselDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet iCarousel *carousel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *carouselHeight;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;

- (IBAction)reloadData:(id)sender;

@end

