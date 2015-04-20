//
//  CompassViewController.m
//  compass
//
//  Created by Maciej Stanik on 20/04/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

#import "CompassViewController.h"

@interface CompassViewController ()

@end

@implementation CompassViewController {
    CLLocationManager *_locationManager;
    CLGeocoder *_geocoder;
    CLPlacemark *_placemark;
    NSString *_destinationAddress;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _destinationAddress = @"Gdansk, Długa";
    [self displayCoordinates];
    _destinationLabel.text = [NSString stringWithFormat:@"Destination: %@", _destinationAddress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayCoordinates {
    _geocoder = [[CLGeocoder alloc] init];
    [_geocoder geocodeAddressString:_destinationAddress completionHandler:^(NSArray *placemarks, NSError *error){
        
        for (CLPlacemark *destPlacemark in placemarks){
            // Process the placemark.
            NSString *destinationLat = [NSString stringWithFormat:@"%.4f", destPlacemark.location.coordinate.latitude];
            NSString *destinationLong = [NSString stringWithFormat:@"%.4f", destPlacemark.location.coordinate.longitude];
            _coordinatesLabel.text = [NSString stringWithFormat:@"Coordinates: %@ %@", destinationLat, destinationLong];
            
        }
    }];
    
}

@end
