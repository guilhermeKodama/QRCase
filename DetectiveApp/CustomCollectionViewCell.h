//
//  CustomCollectionViewCell.h
//  QRCase
//
//  Created by Guilherme Kenji Kodama on 12/05/15.
//  Copyright (c) 2015 Guilherme Kenji Kodama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end
