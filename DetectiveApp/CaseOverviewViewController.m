//
//  CaseOverviewViewController.m
//  QRCase
//
//  Created by Guilherme Kenji Kodama on 13/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import "CaseOverviewViewController.h"
#import "MapNextClewViewController.h"

@interface CaseOverviewViewController ()
@property (weak, nonatomic) IBOutlet UIButton *nextClewButton;

@end

@implementation CaseOverviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundapp"]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextClewClicked:(id)sender {
    
    if([MapNextClewViewController getLat] == 0 && [MapNextClewViewController getLng] == 0){
    
        [MapNextClewViewController setLat:-3.136596];
        [MapNextClewViewController setLng:-59.979848];
        
        _nextClewButton.hidden = YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
