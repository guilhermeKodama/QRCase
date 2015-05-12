//
//  MapAnnotation.m
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 11/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

@synthesize coordinate;


- (NSString *)subtitle{
    return nil;
}

- (NSString *)title{
    return @"A sua próxima pista está aqui";
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
    coordinate=c;
    return self;
}



@end
