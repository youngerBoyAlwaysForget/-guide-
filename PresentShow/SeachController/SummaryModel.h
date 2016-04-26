//
//  SummaryModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/17.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

@interface SummaryModel : XXBaseModel
@property(nonatomic, copy) NSString *cover_image_url;
@property(nonatomic, retain) NSNumber *likes_count;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, retain) NSNumber *idNum;
@end
