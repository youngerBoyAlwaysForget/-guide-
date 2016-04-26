//
//  BeautyCell.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "TableViewCell.h"
#import "BeautyModel.h"
@interface BeautyCell : TableViewCell
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *titleImageView;

@property (nonatomic, retain) BeautyModel *beautModel;
@end
