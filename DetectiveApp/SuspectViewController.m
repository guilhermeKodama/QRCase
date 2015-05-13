//
//  SuspectViewController.m
//  QRCase
//
//  Created by Guilherme Kenji Kodama on 12/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import "SuspectViewController.h"
#import "SuspectStore.h"

@interface SuspectViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelAge;
@property (weak, nonatomic) IBOutlet UILabel *labelJob;
@property (weak, nonatomic) IBOutlet UITextView *labelDescription;

@property (nonatomic) NSArray *suspects;
@property (nonatomic) int currentPosition;

@end



@implementation SuspectViewController


- (id) init{
    self = [super init];
    if (self){
        
        _currentPosition = 0;
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _suspects = [[SuspectStore sharedStore] getAll];

    [self setCurrentSuspectInformation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

- (void) setCurrentSuspectInformation{

    if(_currentPosition  >= [_suspects count]){
        _currentPosition = 0;
    }
    
    Suspect *suspect = [_suspects objectAtIndex:(int)_currentPosition];
    _labelName.text = suspect.name;
    _labelAge.text = suspect.age;
    _labelJob.text = suspect.job;
    _labelDescription.text = suspect.suspectDescription;

}

/*
 -----------------------------------
 CLICK
 -----------------------------------
 */

- (IBAction)nextSuspectClicked:(id)sender {
    _currentPosition ++;
    [self setCurrentSuspectInformation];
}

- (IBAction)chargeSuspectClicked:(id)sender {
    
}

@end
