//
//  ViewController.m
//  enigmaapp
//
//  Created by Alex Babich on 5/4/15.
//  Copyright (c) 2015 Alex Babich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *riddle_list;
    NSDictionary *riddle;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //Get a list of all the riddles
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://enigmaa.herokuapp.com/all.json"]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSError *jsonParsingError = nil;
    
    //Here they lie
    riddle_list = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    
    //Print out the question and answer of all riddles
    for(int i=0; i<[riddle_list count];i++)
    {
        riddle= [riddle_list objectAtIndex:i];
        NSLog(@"%@ - %@", [riddle objectForKey:@"question"],[riddle objectForKey:@"answer"]);
    }
    
    //Finding user's location for current map / zoom region
    self.locationManager.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    #ifdef __IPHONE_8_0
        if(IS_OS_8_OR_LATER) {
            // Use one or the other, not both. Depending on what you put in info.plist
            [self.locationManager requestWhenInUseAuthorization];
        }
    #endif
    [self.locationManager startUpdatingLocation];
    
    self.map_view.showsUserLocation = YES;
    [self.map_view setMapType:MKMapTypeStandard];
    [self.map_view setZoomEnabled:YES];
    [self.map_view setScrollEnabled:YES];
    
    self.map_view.delegate = self;
    [self.map_view setShowsUserLocation:YES];
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    //coords
    CLLocationCoordinate2D myLocation = [userLocation coordinate];
    
    //zoom region
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(myLocation, 2500, 2500);
    
    NSLog(@"%f, %f", myLocation.latitude, myLocation.longitude);
    
    //now show the location
    [self.map_view setRegion: zoomRegion animated: YES];
    
    //Map marker image placement, information, popups w/ actions
    for(int i=0; i<[riddle_list count];i++)
    {
        riddle= [riddle_list objectAtIndex:i];
        NSLog(@"%@ - %@", [riddle objectForKey:@"question"],[riddle objectForKey:@"answer"]);
        NSLog(@"%@", riddle);
        NSString *lat = [riddle objectForKey:@"lat"];
        NSString *lon = [riddle objectForKey:@"lon"];
        
        // Define pin location
        CLLocationCoordinate2D pinlocation;
        double latDouble = [lat doubleValue];
        double lonDouble = [lon doubleValue];
        pinlocation.latitude = latDouble; //set latitude of selected coordinate ;
        pinlocation.longitude = lonDouble; //set longitude of selected coordinate;
        
        // Create Annotation point
        MKPointAnnotation *Pin = [[MKPointAnnotation alloc]init];
        Pin.coordinate = pinlocation;
        Pin.title = [riddle objectForKey:@"question"];
    
        // add annotation to mapview
        [mapView addAnnotation:Pin];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0,0,700,80);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(add_a_new_riddle)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"+" forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:50.0]];
        [mapView addSubview:button];
    }
    
}


//Should rotate the screen around if I turn the screen upside down
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Creation and placement of annotation/markers on map
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            //pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"riddle.png"];
            pinView.calloutOffset = CGPointMake(0, 32);
            
            
            
            UIButton * disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [disclosureButton addTarget:self
                                 action:@selector(presentMoreInfo)
                       forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = disclosureButton;
            
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

//Riddle info / answer riddle
- (void)presentMoreInfo {
    NSLog(@"CLICKED THE RIDDLE");
    AnswerViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AnswerViewController"];
    [self presentViewController:controller animated:YES completion:nil];
    
    NSLog(@"I'D LIKE TO SEE THE RIDDLE");
}

//Add a new riddle to the map
- (void)add_a_new_riddle {
    AddNewRiddleViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewRiddleViewController"];
    [self presentViewController:controller animated:YES completion:nil];

    NSLog(@"I WANT TO ADD A RIDDLE");
}




@end
