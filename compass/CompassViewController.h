//
//  CompassViewController.h
//  compass
//
//  Created by Maciej Stanik on 20/04/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CompassViewController : UIViewController <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *coordinatesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *compassArrowImageView;

@end
