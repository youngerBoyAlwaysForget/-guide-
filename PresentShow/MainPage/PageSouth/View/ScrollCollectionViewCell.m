



//
//  ScrollCollectionViewCell.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "ScrollCollectionViewCell.h"

@implementation ScrollCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = self.contentView.bounds.size.width;
        CGFloat height = self.contentView.bounds.size.height;
        self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height * 0.6)];
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(15, height * 0.6, width - 15, 30)];
        self.summary = [[UILabel alloc] initWithFrame:CGRectMake(10, height * 0.6 + 30, width - 10, height  * 0.3)];
        self.page = [[UILabel alloc] initWithFrame:CGRectMake(0, height * 0.55, width, height * 0.05)];
        self.title.adjustsFontSizeToFitWidth = YES;
        self.page.textAlignment = NSTextAlignmentRight;
        self.page.textColor = [UIColor whiteColor];
        self.summary.numberOfLines = 8;
        self.summary.clipsToBounds = YES;
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.summary];
        [self.contentView addSubview:self.headImageView];
        [self.contentView addSubview:self.page];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setListModel:(LIstModel *)listModel {
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:listModel.large_url] placeholderImage:[UIImage imageNamed:@"iconfont-7777"]];
    self.title.text = listModel.title;
    self.summary.text = listModel.breif;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
