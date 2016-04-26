//
//  SummaryCollectionCell.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/17.
//  Copyright © 2016年 z. All rights reserved.
//

#import "SummaryModel.h"
#import "TableViewCell.h"
@interface SummaryCollectionCell : TableViewCell
@property(nonatomic, retain) UIImageView *bigPic;
@property(nonatomic, retain) UILabel *name;
@property(nonatomic, retain) UILabel *likeCount;

@property(nonatomic, retain) SummaryModel *sumMdoel;
//@property (nonatomic, retain) UILabel *price;
@end
