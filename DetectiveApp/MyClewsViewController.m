//
//  MyClewsViewController.m
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 11/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import "MyClewsViewController.h"
#import "CustomCollectionViewCell.h"
#import "MyClewsStore.h"
#import "MyClews.h"
#import "MyClewDetailViewController.h"

@interface MyClewsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic) NSArray *myClews;

@property (nonatomic) MyClews *selectedClew;

@end

@implementation MyClewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myClews = [[MyClewsStore sharedStore] getAll];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundapp"]];

    
    for (MyClews *clew in _myClews) {
        NSLog(@"PISTAAAAA :%@",clew.clewDescription);
        NSLog(@"PISTAAAAA :%@",clew.clewDescription);
        NSLog(@"PISTAAAAA :%@",clew.clewDescription);
        NSLog(@"PISTAAAAA :%@",clew.clewDescription);
        NSLog(@"PISTAAAAA :%@",clew.clewDescription);
        NSLog(@"PISTAAAAA :%@",clew.clewDescription);
        NSLog(@"PISTAAAAA :%@",clew.clewDescription);
    }
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundapp"]];
    
    //codigo NSFectechedResultsControllerDelegate
    [[MyClewsStore sharedStore] fetchedResultsController].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 ---------------------------------
            FETCHEDRESULT
 ---------------------------------
 */
- (NSFetchedResultsController *)fetchedResultsController {
    return [[MyClewsStore sharedStore] fetchedResultsController];
}

/*- (void)collectionView:(UICollectionView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MyClews *clew = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        MyClewsStore *store = [MyClewsStore sharedStore];
        [store removeUnidadeFederativa:clew];
        [store saveChanges];
    }
}*/


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    [self.fetchedResultsController performFetch:nil];
    [self.collectionView reloadData];
    
    //    [self.tableView beginUpdates];
    //
    //    switch (type) {
    //        case NSFetchedResultsChangeInsert:
    //            [self.tableView reloadRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationTop];
    //            break;
    //
    //        case NSFetchedResultsChangeDelete:
    //            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    //            break;
    //
    //        case NSFetchedResultsChangeUpdate:
    //            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    //            break;
    //
    //        case NSFetchedResultsChangeMove:
    //            [self.tableView reloadRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationTop];
    //            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    //            break;
    //    }
    //
    //    [self.tableView endUpdates];
}

/*
 ---------------------------------
            COLLECTIONVIEW
 ---------------------------------
 */

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [[self.fetchedResultsController sections][section] numberOfObjects];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"CustomCollection";
    
    /*if (indexPath == 0) {
        // Para tentar retornar a primeira célula do negócio (a de adicionar pista
       identifier = @"AddCell";
        return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    } else {
        identifier = @"CustomCollection";
    }*/
    
    CustomCollectionViewCell *cell = (CustomCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    NSLog(@"%ld",indexPath.row);
    //MyClews *clew = (MyClews*) [_myClews objectAtIndex:indexPath.row];
    MyClews *clew = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.labelName.text = clew.clewDescription;
    
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    _selectedClew = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"segueMyClewDetail" sender:self];
    
   
}


/*
 ---------------------------------
        COLLECTIONVIEW
 ---------------------------------
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    MyClewDetailViewController *clewDetailController = segue.destinationViewController;
    clewDetailController.clew = _selectedClew;

}


@end
