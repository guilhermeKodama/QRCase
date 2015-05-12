//
//  CaseDetailViewController.h
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 11/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaseDetailViewController : UIViewController

@property (nonatomic) NSDictionary *jsonResult;
@property (nonatomic) NSString* caseDescription;

@end
