//
//  HomeViewController.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/16/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "HomeViewController.h"
#import "Reachability.h"
#import "PhotosCollectionViewCell.h"
#import "DetailViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSMutableArray *carouselPhotos;
@property (strong, nonatomic) Data *selectedPhoto;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.carouselPhotos = [NSMutableArray array];
    _carousel.type = iCarouselTypeLinear;
    [_carousel setScrollEnabled:NO];
    [self settingFontsAndTexts];
    [self getData];
    [self addGestures];
}

-(void)settingFontsAndTexts{
    self.navigationItem.title = @"Photos";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:17.0]
                              }];
}

-(void)addGestures{
    //Adding Gestures
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [_carousel addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [_carousel addGestureRecognizer:swiperight];
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [_carousel scrollByNumberOfItems:1 duration:0.25];
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [_carousel scrollToItemAtIndex:_carousel.currentItemIndex-1 duration:0.25];
}

-(void)viewDidLayoutSubviews{
    
    NSInteger screenHeight = (int)[[UIScreen mainScreen] bounds].size.height;
    
    switch(screenHeight)
    {
        case 480:
            //iPhone4S
            [self.carouselHeight setConstant:200];
            break;
            
        case 568:
            //iPhone5/5s
            [self.carouselHeight setConstant:250];
            break;
            
    };
    return;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [_carouselPhotos count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _carousel.frame.size.width, _carousel.frame.size.height)];
        view.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    //Get the Photo
    Data *photo =[_carouselPhotos objectAtIndex:index];
    
    SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloader];
    [downloader downloadImageWithURL:[NSURL URLWithString:photo.images.standard_resolution.url]
                             options:0
                            progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                [_activityIndicator startAnimating];
                            }
                           completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                               if (image && finished) {
                                   [_activityIndicator stopAnimating];
                                   ((UIImageView *)view).image = image;
                               }
                           }];
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1;
    }
    return value;
}

#pragma mark - Fetching Data methods

-(void) getData{
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    //Check if user has internet connection
    if ((status == ReachableViaWWAN) || (status == ReachableViaWiFi)){
        //If user has internet access fetch photos from API
        [[Data alloc] fetchData:^(NSMutableArray *photos, NSError *error){
            if (!error) {
                [_carouselPhotos removeAllObjects];
                for (Data *photo in photos) {
                    [_carouselPhotos addObject:photo];
                }
                [_carousel reloadData];
                [_photosCollectionView reloadData];
            }
        }];
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No network connection"
                                                                       message:@"You must be connected to the internet to use this app."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - Collection View Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _carouselPhotos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"photoCollectionViewCell";
    PhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    Data *photoCell = [_carouselPhotos objectAtIndex:indexPath.row];
    [cell configureCellWithContent:photoCell];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [_carousel scrollToItemAtIndex:indexPath.row animated:NO];
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
    _selectedPhoto = [_carouselPhotos objectAtIndex:index];
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSInteger screenHeight = (int)[[UIScreen mainScreen] bounds].size.height;
    
    switch(screenHeight)
    {
        case 480:
            //iPhone4S
            return CGSizeMake(100.f, 100.f);
        case 568:
            //iPhone5/5s
            return CGSizeMake(100.f, 100.f);
        case 667:
            //iPhone6
            return CGSizeMake(115.f, 115.f);
        case 1024:
            //iPad
            return CGSizeMake(240.f, 240.f);
        default:
            return CGSizeMake(130.f, 130.f);
    };
    return CGSizeMake(130.f, 130.f);
}

#pragma mark - Actions & Navigation

- (IBAction)reloadData:(id)sender {
    [self getData];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        DetailViewController *detailVC = [segue destinationViewController];
        [detailVC setSelectedPhoto:_selectedPhoto];
    }
}
@end
