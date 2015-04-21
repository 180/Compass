//
//  CompassViewController.m
//  compass
//
//  Created by Maciej Stanik on 20/04/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

#import "CompassViewController.h"
#import "GeoPointCompass/GeoPointCompass.h"

@interface CompassViewController ()

@end

@implementation CompassViewController {
    CLGeocoder *_geocoder;
    NSString *_destinationAddress;
    GeoPointCompass *_geoPointCompass;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
}

#pragma mark - Searchbar methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    _destinationAddress = _searchBar.text;
    [self displayCoordinates];
    [_searchBar resignFirstResponder];
}

#pragma mark - Geocoder methods

- (void)displayCoordinates {
    _coordinatesLabel.hidden = NO;
    _destinationLabel.hidden = NO;
    _destinationLabel.text = [NSString stringWithFormat:@"Destination: %@", _destinationAddress];
    _geocoder = [[CLGeocoder alloc] init];
    [_geocoder geocodeAddressString:_destinationAddress completionHandler:^(NSArray *placemarks, NSError *error) {
        
        for (CLPlacemark *destPlacemark in placemarks) {
            NSString *destinationLat = [NSString stringWithFormat:@"%.4f", destPlacemark.location.coordinate.latitude];
            NSString *destinationLong = [NSString stringWithFormat:@"%.4f", destPlacemark.location.coordinate.longitude];
            _coordinatesLabel.text = [NSString stringWithFormat:@"Coordinates: %@ %@", destinationLat, destinationLong];
            [self updateDestinationForLatitude:destPlacemark.location.coordinate.latitude Longitude:destPlacemark.location.coordinate.longitude];
        }
    }];
}

#pragma mark - GeoPointCompass methods

- (void)displayCompassForLatitude:(double)latitude Longitude:(double)longitude {
    _compassArrowImageView.hidden = NO;
    
    _geoPointCompass = [[GeoPointCompass alloc] init];
    [_geoPointCompass setArrowImageView:_compassArrowImageView];
    _geoPointCompass.latitudeOfTargetedPoint = latitude;
    _geoPointCompass.longitudeOfTargetedPoint = longitude;
}

- (void)updateDestinationForLatitude:(double)latitude Longitude:(double)longitude  {
    _geoPointCompass = nil;
    [self displayCompassForLatitude:latitude Longitude:longitude];
}

@end
