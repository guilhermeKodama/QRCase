//
//  MyClews.h
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 12/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MyClews : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * clewDescription;

@end
