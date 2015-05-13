//
//  SuspectStore.m
//  QRCase
//
//  Created by Guilherme Kenji Kodama on 12/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import "SuspectStore.h"
#import "AppDelegate.h"


@interface SuspectStore()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation SuspectStore

static NSString *DATA_MODEL_ENTITY_NAME = @"Suspect";

+ (instancetype)sharedStore {
    static SuspectStore *sharedStore = nil;
    
    if (!sharedStore) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        sharedStore = [[self alloc] initPrivate];
        sharedStore.managedObjectContext = appDelegate.managedObjectContext;
        
        /*Checa se precisa inicializar os suspeitos*/
        NSArray *suspects = [sharedStore getAll];
        
        if([suspects count] == 0){
        
            [sharedStore resetStoredData];
        }
    }
    
    return sharedStore;
}

- (instancetype)initPrivate {
    self = [super init];
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BPDUnidadeFederativaStore sharedStore]"
                                 userInfo:nil];
}

- (void)resetStoredData {
    
    // Delete all objects
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:DATA_MODEL_ENTITY_NAME];
    NSError *error;
    NSArray *objects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Error fetching objects: %@", error.userInfo);
    }
    
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    for (NSManagedObject *object in objects) {
        [self.managedObjectContext deleteObject:object];
    }
    
    //populate
    [self createSuspectWithName:@"Guilherme" andJob:@"Programador" andDescription:@"Um programador que está desenvolvendo esse app na correaria para a apresentação de amanhã" andAge:@"22" andIsGuilty:[NSNumber numberWithInt:0]];
    [self createSuspectWithName:@"Carlos" andJob:@"Designer" andDescription:@"Um designer capaz de matar caso precise usar Comic Sans em seus projetos" andAge:@"19" andIsGuilty:[NSNumber numberWithInt:1]];
    [self createSuspectWithName:@"Carla" andJob:@"Programador" andDescription:@"Carla está cansada de projetos com prazos fora da realidade , ela quer passar logo para a parte de ficar rica." andAge:@"19" andIsGuilty:[NSNumber numberWithInt:0]];
}

- (Suspect *)createSuspectWithName:(NSString*) name andJob:(NSString*) job andDescription:(NSString*)description andAge:(NSString*)age andIsGuilty:(NSNumber*)isGuilty{

    Suspect *uf = [NSEntityDescription
                   insertNewObjectForEntityForName:DATA_MODEL_ENTITY_NAME
                   inManagedObjectContext:self.managedObjectContext];
    
    uf.id = [[[NSUUID alloc] init] UUIDString];
    uf.name = name;
    uf.job = job;
    uf.suspectDescription = description;
    uf.isGuilty = isGuilty;
    
    NSError *error;
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Could not save %@, %@", error, error.userInfo);
    }
    
    return uf;



}


- (void)removeUnidadeFederativa:(Suspect *)uf {
    [self.managedObjectContext deleteObject:uf];
}

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (!_fetchedResultsController) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:DATA_MODEL_ENTITY_NAME inManagedObjectContext:self.managedObjectContext];
        
        [fetchRequest setEntity:entity];
        
        // Set the batch size to a suitable number.
        [fetchRequest setFetchBatchSize:20];
        
        // Edit the sort key as appropriate.
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
        NSArray *sortDescriptors = @[sortDescriptor];
        
        [fetchRequest setSortDescriptors:sortDescriptors];
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        // _fetchedResultsController.delegate = self;
        
        NSError *error = nil;
        if (![_fetchedResultsController performFetch:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
    return _fetchedResultsController;
}

- (BOOL)saveChanges {
    NSError *error;
    
    if ([self.managedObjectContext hasChanges]) {
        BOOL successful = [self.managedObjectContext save:&error];
        
        if (!successful) {
            NSLog(@"Error saving: %@", [error localizedDescription]);
        }
        
        return successful;
    }
    
    return YES;
}


- (NSArray*) getAll{
    
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Suspect"];
    
    NSError *error = nil;
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if (error != nil) {
        
        //Deal with failure
    }else {
        NSLog(@"PEGUEI TANTOS OBJETOS DO BD: %ld",[results count]);
    }
    
    
    return results;
}


@end
