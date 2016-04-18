//
//  DetailViewController.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "DetailViewController.h"
#import "CommentsTableViewCell.h"
#import "LocationMapViewController.h"
#import "ProfileWebViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareView];
    [self addGestures];
}

-(void)prepareView{
    
    self.navigationItem.title = @"Photo Detail";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:17.0]
                              }];

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shareBttn"] style:UIBarButtonItemStyleDone target:self action:@selector(share)];
    self.navigationItem.rightBarButtonItem = shareButton;
    self.publishDate.text = [NSString stringWithFormat:@"Publish Date: %@", [self dateFormatter:_selectedPhoto.created_time]];
    self.author.text = [NSString stringWithFormat:@"Author: %@", _selectedPhoto.caption.from.username];
    NSMutableArray *tags = [[NSMutableArray alloc]init];
    for (NSString *tag in _selectedPhoto.tags) {
        [tags addObject:[NSString stringWithFormat:@"#%@", tag]];
    }
    self.tags.numberOfLines = 4;
    [self.tags sizeToFit];
    self.tags.text = [NSString stringWithFormat:@"Tags: %@", [tags componentsJoinedByString:@","]];

    [self.photo sd_setImageWithURL:[NSURL URLWithString:_selectedPhoto.images.standard_resolution.url]
                  placeholderImage:nil
                         completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                             [_activityIndicator stopAnimating];
                         }];
    
    if (_selectedPhoto.location == nil) {
        [_locationBttn setHidden:YES];
    }
    if (_selectedPhoto.tags.count == 0) {
        [self.tags setHidden:YES];
    }
}

-(NSString *)dateFormatter:(NSString *)dateToFormat{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[dateToFormat doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    dateFormatter.dateFormat = @"EEEE, dd MMM YYYY 'at' HH:mm";
    return [dateFormatter stringFromDate:date];
}

-(void)viewDidLayoutSubviews{
    //Adjust Layout for iPhones
    
    NSInteger screenHeight = (int)[[UIScreen mainScreen] bounds].size.height;
    
    switch(screenHeight)
    {
        case 480:
            //iPhone4S
            [self.imageHeight setConstant:200];
            [self.publishDate setFont:[self.publishDate.font fontWithSize:14]];
            [self.author setFont:[self.publishDate.font fontWithSize:14]];
            [self.tags setFont:[self.publishDate.font fontWithSize:14]];
            break;
            
        case 568:
            //iPhone5/5s
            [self.publishDate setFont:[self.publishDate.font fontWithSize:14]];
            [self.author setFont:[self.publishDate.font fontWithSize:14]];
            [self.tags setFont:[self.publishDate.font fontWithSize:14]];
            break;
        case 667:
            //iPhone6
            [self.imageHeight setConstant:270];
            break;
        case 736:
            //iPhone6Plus
            [self.imageHeight setConstant:300];
            break;
    };
    return;
}

-(void)addGestures{
    //Adding Gestures
    _photo.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openURL:)];
    tapGesture.delegate = self;
    [self.photo addGestureRecognizer:tapGesture];
}

-(void)openURL:(UITapGestureRecognizer *)recognizer{
    
    [self performSegueWithIdentifier:@"showUserProfile" sender:nil];
}

-(void)share{
    
    //Share photo URL
    NSString *text = @"Look at this awesome Photo!!!!";
    NSURL *url = [NSURL URLWithString:_selectedPhoto.images.standard_resolution.url];
    UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:@[text, url]applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _selectedPhoto.comments.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"commentTableViewCell";
    CommentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[CommentsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    DataModel *commentCell = [_selectedPhoto.comments.data objectAtIndex:indexPath.row];

    [cell configureCellWithContent:commentCell];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *longText = [[_selectedPhoto.comments.data objectAtIndex:indexPath.row] valueForKey:@"text"];
    CGSize lableWidth = CGSizeMake(300, CGFLOAT_MAX);
    NSDictionary * attributes = @{
                                  NSFontAttributeName: [UIFont fontWithName:@"Noteworthy-Light" size:13.0]
                                  };
    CGRect textRect = [longText boundingRectWithSize:lableWidth
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attributes
                                         context:nil];
    
    int calculatedHeight = textRect.size.height+80;
    return (float)calculatedHeight;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"goToLocationMap"]) {
        LocationMapViewController *mapVC = [segue destinationViewController];
        [mapVC setLocation:_selectedPhoto.location];
    }else if ([segue.identifier isEqualToString:@"showUserProfile"]){
        ProfileWebViewController *webView = [segue destinationViewController];
        [webView setURL:_selectedPhoto.link];
    }
}

- (IBAction)goToLocation:(id)sender {
    [self performSegueWithIdentifier:@"goToLocationMap" sender:nil];
}
@end
