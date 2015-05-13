//
//  Suspect.h
//  QRCase
//
//  Created by Guilherme Kenji Kodama on 12/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Suspect : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * job;
@property (nonatomic, retain) NSString * suspectDescription;
@property (nonatomic, retain) NSNumber * isGuilty;
@property (nonatomic, retain) NSString * age;

@end
