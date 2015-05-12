//
//  FirstViewController.h
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 11/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapNextClewViewController : UIViewController

+ (void) setCurrentLocationWithLat:(double)lt andLng:(double)lg;
+ (double) getLat;
+ (void) setLat:(double)l;
+ (double) getLng;
+ (void) setLng:(double)l;
@end


