//
//  BeautyModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"
#import "LIstModel.h"
@interface BeautyModel : XXBaseModel

@property (nonatomic, copy) NSString *linkid;
@property (nonatomic, copy) NSString *idNum;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *first_image;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, retain) NSDictionary *article_url;
@property (nonatomic, retain) NSArray *list;


- (instancetype)initWithArray:(NSDictionary *)array;
@end
