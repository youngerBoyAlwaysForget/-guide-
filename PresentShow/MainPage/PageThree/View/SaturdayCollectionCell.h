//
//  SaturdayModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/12.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXCollectionViewCell.h"
#import "ItemsSaturdayModel.h"
@interface SaturdayCollectionCell : XXCollectionViewCell

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *price;
@property (nonatomic, retain) UIImageView *likeImageView;
@property (nonatomic, retain) UILabel *likeCount;
@property (nonatomic, retain) UILabel *title;

@property (nonatomic, retain) ItemsSaturdayModel *itemMdel;
@end
