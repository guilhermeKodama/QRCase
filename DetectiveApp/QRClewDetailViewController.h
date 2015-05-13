//
//  ClewDetailViewController.h
//  DetectiveApp
//
//  Created by Guilherme Kenji Kodama on 11/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRClewDetailViewController : UIViewController

@property (nonatomic) NSString* clewDescription;
@property (nonatomic) NSDictionary *jsonResult;

- (id) init;

@end
