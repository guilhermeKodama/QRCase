//
//  MyClewDetailViewController.m
//  QRCase
//
//  Created by Guilherme Kenji Kodama on 12/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import "MyClewDetailViewController.h"

@interface MyClewDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;
@property (weak, nonatomic) IBOutlet UITextView *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelID;

@end

@implementation MyClewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelDescription.text = _clew.clewDescription;
    _labelID.text = [NSString stringWithFormat:@"#%@",_clew.id];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
