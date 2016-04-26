//
//  SearchCell.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/22.
//  Copyright © 2016年 z. All rights reserved.
//

#import "TableViewCell.h"
#import "SummaryModel.h"
@interface SearchCell : TableViewCell


@property (nonatomic, retain) UIImageView *bigPic;
@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *likeCount;

@property (nonatomic, retain) SummaryModel *sumMdoel;
@end
