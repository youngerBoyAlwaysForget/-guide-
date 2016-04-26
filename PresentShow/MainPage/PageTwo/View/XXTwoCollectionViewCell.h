//
//  XXTwoCollectionViewCell.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXCollectionViewCell.h"
#import "XXHotModel.h"

@protocol actDelegate <NSObject>

- (void)clickCellAction:(NSString *)string;

@end
@interface XXTwoCollectionViewCell : XXCollectionViewCell
@property (nonatomic, retain) XXHotModel *hotModel;

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *price;
@property (nonatomic, retain) UIImageView *likeImageView;
@property (nonatomic, retain) UILabel *likeCount;
@property (nonatomic, retain) UILabel *title;

@property (nonatomic, retain) id<actDelegate>delegata;
@end
