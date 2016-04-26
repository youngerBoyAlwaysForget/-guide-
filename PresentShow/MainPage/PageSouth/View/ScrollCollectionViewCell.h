//
//  ScrollCollectionViewCell.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXCollectionViewCell.h"
#import "LIstModel.h"
@interface ScrollCollectionViewCell : XXCollectionViewCell

@property (nonatomic, retain) UIImageView *headImageView;
@property (nonatomic, retain) UILabel *title;
@property (nonatomic, retain) UILabel *summary;
@property (nonatomic, retain) UILabel *page;

@property (nonatomic, retain) LIstModel *listModel;
@end
