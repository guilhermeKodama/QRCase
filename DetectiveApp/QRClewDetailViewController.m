//
//  ClewDetailViewController.m
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 11/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import "QRClewDetailViewController.h"
#import "MyClewsStore.h"
#import "MyClews.h"

@interface QRClewDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *labelClewDescription;
@property (nonatomic) NSArray *clews;
@property (nonatomic) int currentPosition;
@end

@implementation QRClewDetailViewController


- (id) init{
    self = [super init];
    if (self){
        
        _currentPosition = 0;
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _clews = [_jsonResult objectForKey:@"clew"];
    NSLog(@"PISTAS: %@",_clews);
    NSLog(@"PISTA ATUAL: %@",[_clews objectAtIndex:_currentPosition]);
    NSLog(@"PISTAS: %@",_clews);
    NSLog(@"PISTA ATUAL: %@",[_clews objectAtIndex:_currentPosition]);
    NSLog(@"PISTAS: %@",_clews);
    NSLog(@"PISTA ATUAL: %@",[_clews objectAtIndex:_currentPosition]);
    NSLog(@"MINHAS PISTAS NO BD: %@",[MyClewsStore sharedStore] );
    
    NSArray *myClews = [[MyClewsStore sharedStore] getAll];
    
    for (MyClews *clew in myClews) {
        NSLog(@"PISTA(BD): %@",clew.clewDescription);
    }
    
    [self setCurrentClewInformation];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setCurrentClewInformation{
    if(_currentPosition  >= [_clews count]){
        _currentPosition = 0;
    }
    
    NSDictionary *clew = [_clews objectAtIndex:(int)_currentPosition];
    _labelClewDescription.text = [clew objectForKey:@"desc"];
    

}

/*
 -----------------------------------
                CLICK
 -----------------------------------
 */

- (IBAction)backButtonClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)nextClewClicked:(id)sender {
    _currentPosition ++;
    [self setCurrentClewInformation];
}

- (IBAction)addClewClicked:(id)sender {
    NSDictionary *clew = [_clews objectAtIndex:(int)_currentPosition];
    [[MyClewsStore sharedStore] createUnidadeFederativaWithID:[clew objectForKey:@"id"] andDescription:[clew objectForKey:@"desc"]];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
