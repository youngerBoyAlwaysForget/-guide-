//
//  RightTableViewCell.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/12.
//  Copyright © 2016年 z. All rights reserved.
//

#import "TableViewCell.h"
#import "XXSubcategoriesModel.h"
@interface RightTableViewCell : TableViewCell
@property (nonatomic, retain) UIImageView *imageViewleft;
@property (nonatomic, retain) UILabel *name;

@property (nonatomic, retain) XXSubcategoriesModel *subModel;
@end
