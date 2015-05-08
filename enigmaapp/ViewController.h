//
//  ViewController.h
//  enigmaapp
//
//  Created by Alex Babich on 5/4/15.
//  Copyright (c) 2015 Alex Babich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AddNewRiddleViewController.h"
#import "AnswerViewController.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface ViewController : UIViewController <MKMapViewDelegate,  CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *map_view;

@property(nonatomic, retain) CLLocationManager *locationManager;

@end

