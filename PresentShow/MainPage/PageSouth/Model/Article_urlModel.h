//
//  Article_urlModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

@interface Article_urlModel : XXBaseModel

@property (nonatomic, copy) NSString *linkid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *dateinfo;
@property (nonatomic, copy) NSString *timeStamp;
@property (nonatomic, copy) NSString *sortid;
@property (nonatomic, copy) NSString *has_small_image;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, copy) NSString *share_text;

@property (nonatomic, copy) NSArray *image_list;
@end
