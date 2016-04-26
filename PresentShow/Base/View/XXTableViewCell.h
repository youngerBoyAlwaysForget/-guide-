//
//  XXTableViewCell.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/9.
//  Copyright © 2016年 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXbutton.h"
#import "ItemsModel.h"
#import "TableViewCell.h"
#import "DKNightVersion.h"
@interface XXTableViewCell :TableViewCell

@property (nonatomic, retain) UIImageView *bigimageView;
@property (nonatomic, retain) UIView *lightView;
@property (nonatomic, retain) UILabel *likeCount;
@property (nonatomic, retain) UILabel *titleLabel;


@property (nonatomic, retain) XXbutton *likeHeart;

@property (nonatomic, retain) ItemsModel *itemModel;
@end
