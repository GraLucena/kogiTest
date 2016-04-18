//
//  DetailViewController.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"
#import "Caption.h"
#import "DataModel.h"
#import "From.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Images.h"
#import "ImageDetail.h"
#import "Comments.h"

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (strong, nonatomic) Data* selectedPhoto;
@property (strong, nonatomic) NSMutableArray *comments;

@property (weak, nonatomic) IBOutlet UILabel *publishDate;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *tags;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UIButton *locationBttn;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@property (weak, nonatomic) IBOutlet UITableView *commentsTableView;

//Constraints
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;


- (IBAction)goToLocation:(id)sender;
@end
