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

@interface MyClewsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) NSArray *myClews;

@end

@implementation MyClewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myClews = [[MyClewsStore sharedStore] getAll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"COUNT: %ld",[_myClews count]);
    return [_myClews count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"CustomCollection";
    
    CustomCollectionViewCell *cell = (CustomCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSLog(@"%ld",indexPath.row);
    MyClews *clew = (MyClews*) [_myClews objectAtIndex:indexPath.row];
    cell.labelName.text = clew.clewDescription;
    
    
    
    return cell;
    
}

@end
