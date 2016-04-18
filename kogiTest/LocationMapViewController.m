//
//  LocationMapViewController.m
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "LocationMapViewController.h"

@interface LocationMapViewController ()

@end

@implementation LocationMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareView];
}

-(void)prepareView{
    
    self.navigationItem.title = @"Location";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:17.0]
                              }];
    
    _locationName.text = _location.name;
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(_location.latitude, _location.longitude);
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = centerCoordinate;
    point.title = [NSString stringWithFormat:@"(%f,%f)", _location.latitude, _location.longitude];
    [self.mapView addAnnotation:point];
    [self zoomInToMyLocation: _location.latitude and:_location.longitude];
    [self.mapView setCenterCoordinate:centerCoordinate animated:YES];
    
}

-(void)zoomInToMyLocation:(double)latitude and:(double)longitude
{
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = latitude ;
    region.center.longitude = longitude;
    region.span.longitudeDelta = 0.15f;
    region.span.latitudeDelta = 0.15f;
    [self.mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
