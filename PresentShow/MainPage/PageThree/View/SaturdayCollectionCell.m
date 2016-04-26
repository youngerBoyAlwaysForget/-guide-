//
//  SaturdayModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/12.
//  Copyright © 2016年 z. All rights reserved.
//

#import "SaturdayCollectionCell.h"

@implementation SaturdayCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        self.likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.title = [[UILabel alloc] init];
        self.likeCount = [[UILabel alloc] initWithFrame:CGRectZero];
        self.price = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_imageView];
        [self.contentView addSubview:_price];
        [self.contentView addSubview:_likeCount];
        
       _price.font = [UIFont systemFontOfSize:11];
        _title.font = [UIFont systemFontOfSize:12];
        _title.numberOfLines = 2;
        _likeCount.font = [UIFont systemFontOfSize:8];
        
        _likeCount.backgroundColor = [UIColor colorWithRed:0.925 green:0.9205 blue:0.9295 alpha:0.885641163793103];
        _title.backgroundColor = [UIColor colorWithRed:0.925 green:0.9205 blue:0.9295 alpha:0.885641163793103];
        _price.backgroundColor = [UIColor colorWithRed:0.925 green:0.9205 blue:0.9295 alpha:0.885641163793103];
        
        _price.textColor = [UIColor redColor];
        _likeCount.textColor = [UIColor darkGrayColor];
        _imageView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.770123922413793];

        [_imageView release];
        [_likeImageView release];
        [_title release];
        [_likeCount release];
        [_price release];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.contentView.bounds.size.height;
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;
    

    self.imageView.frame = CGRectMake(0, 0, width, height * 0.7);
    self.title.frame = CGRectMake(0, height * 0.7 - 10, width, height * 0.2);
    self.price.frame = CGRectMake(0, height * 0.9 - 11, width * 0.6, height * 0.1);
    self.likeCount.frame = CGRectMake(width * 0.6, height * 0.9 - 11, width * 0.4, height * 0.1);
    
}
- (void)setItemMdel:(ItemsSaturdayModel *)itemMdel {
    _itemMdel = itemMdel;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_itemMdel.cover_image_url] placeholderImage:[UIImage imageNamed:@"Img222423471.gif"]];
    _title.text = _itemMdel.name;
    _price.text = _itemMdel.price;
    if (_itemMdel.price.intValue == 0) {
        _likeCount.text = @"还没人喜欢吖";
    } else
        _likeCount.text = [NSString stringWithFormat:@"%@ 人喜欢", _itemMdel.favorites_count.stringValue];

    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
