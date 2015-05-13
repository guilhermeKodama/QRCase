//
//  FirstViewController.m
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 11/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#define METERS_PER_MILE 1609.344
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#import "MapNextClewViewController.h"
#import "MapAnnotation.h"
#import <MapKit/MapKit.h>

@interface MapNextClewViewController () <MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, retain) CLLocationManager *locationManager;

@end

@implementation MapNextClewViewController

static double lat = 0;
static double lng = 0;


- (void)viewDidLoad {
    NSLog(@"VIEW DID LOAD");
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundapp"]];

    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    #ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        // Use one or the other, not both. Depending on what you put in info.plist
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    #endif
    [self.locationManager startUpdatingLocation];
    
    _mapView.showsUserLocation = YES;
    [_mapView setMapType:MKMapTypeStandard];
    [_mapView setZoomEnabled:YES];
    [_mapView setScrollEnabled:YES];
    [_mapView setShowsUserLocation:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"VIEW DID APPEAR");
    [self removeAllAnnotations];
    [self setCurrentClew];
    
    [super viewDidAppear:YES];
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    NSLog(@"%@", [self deviceLocation]);
    
    //View Area
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [_mapView setRegion:region animated:YES];
    
}

- (void) viewWillAppear:(BOOL)animated{
    NSLog(@"VIEW WILL APPEAR");
}

- (void) setCurrentClew{
    if(lat != 0 && lng != 0){
        CLLocationCoordinate2D zoomLocation;
        zoomLocation.latitude = lat;
        zoomLocation.longitude= lng;
        
        // 2
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        
        // 3
        [_mapView setRegion:viewRegion animated:YES];
        
        //add pin
        MapAnnotation *addAnnotation = [[MapAnnotation alloc] initWithCoordinate:zoomLocation];
        [_mapView addAnnotation:addAnnotation];
    }
    
    NSLog(@"LAT : %f LNG : %f",lat,lng);
}


/*
 --------------------------------------------
                MAP DELEGATE
 --------------------------------------------
 */


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
}

- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
}

-(void)removeAllAnnotations {
    //Get the current user location annotation.
    id userAnnotation=_mapView.userLocation;
    
    //Remove all added annotations
    [_mapView removeAnnotations:_mapView.annotations];
    
    // Add the current user location annotation again.
    if(userAnnotation!=nil){
        [_mapView addAnnotation:userAnnotation];
    }
}


/*
 --------------------------------------------
                GETS E SETS
 --------------------------------------------
 */

+ (void) setCurrentLocationWithLat:(double)lt andLng:(double)lg{
    [self setLat:lt];
    [self setLng:lg];
}

+(void)setLat:(double)l{
    lat = l;
}

+ (double) getLat{
    return lat;
}

+(void)setLng:(double)l{
    lng = l;
}

+ (double) getLng{
    return lng;
}



@end
