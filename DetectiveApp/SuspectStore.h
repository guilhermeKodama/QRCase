//
//  SuspectStore.h
//  QRCase
//
//  Created by Guilherme Kenji Kodama on 12/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Suspect.h"
#import <UIKit/UIKit.h>

@interface SuspectStore : NSObject

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

+ (instancetype)sharedStore;

- (Suspect *)createSuspectWithName:(NSString*) name andJob:(NSString*) job andDescription:(NSString*)description andAge:(NSString*)age andIsGuilty:(NSNumber*)isGuilty;
- (void)removeUnidadeFederativa:(Suspect *)uf;
- (BOOL)saveChanges;
- (NSArray*) getAll;


@end
