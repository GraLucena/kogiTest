//
//  LocationMapViewController.h
//  kogiTest
//
//  Created by Graciela Lucena on 4/17/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import <MapKit/MapKit.h>

@interface LocationMapViewController : UIViewController

@property (strong, nonatomic) Location *location;


@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *locationName;

@end
