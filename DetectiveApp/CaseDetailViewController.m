//
//  CaseDetailViewController.m
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 11/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import "CaseDetailViewController.h"
#import "MapNextClewViewController.h"

@interface CaseDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *labelDescription;


@end

@implementation CaseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelDescription.text = _caseDescription;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)nextClewClicked:(id)sender {
    
    NSLog(@" LAT:%@  LNG:%@",[_jsonResult objectForKey:@"lat"],[_jsonResult objectForKey:@"lng"]);
    [MapNextClewViewController setLat:[[_jsonResult objectForKey:@"lat"] doubleValue]];
    [MapNextClewViewController setLng:[[_jsonResult objectForKey:@"lng"] doubleValue]];
    
    [self.navigationController popViewControllerAnimated:YES];
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
