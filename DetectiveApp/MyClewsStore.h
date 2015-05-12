//
//  MyClewsStore.h
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 12/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MyClews.h"
#import <UIKit/UIKit.h>

@interface MyClewsStore : NSObject

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

+ (instancetype)sharedStore;

- (MyClews *)createUnidadeFederativaWithID:(NSString *)ID andDescription:(NSString*) description;
- (void)removeUnidadeFederativa:(MyClews *)uf;
- (BOOL)saveChanges;
- (NSArray*) getAll;


@end
