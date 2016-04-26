//
//  XXTwoCollectionViewCell.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXTwoCollectionViewCell.h"
#define LABEL_HEIGHT
@implementation XXTwoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        self.likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.title = [[UILabel alloc] init];
        self.likeCount = [[UILabel alloc] initWithFrame:CGRectZero];
        self.price = [[UILabel alloc] initWithFrame:CGRectZero];
        

        
        self.price.font = [UIFont systemFontOfSize:11];
        self.title.font = [UIFont systemFontOfSize:12];
        self.title.numberOfLines = 2;
        self.likeCount.font = [UIFont systemFontOfSize:8];
        
        self.imageView.backgroundColor = [UIColor colorWithRed:0.9255 green:0.9412 blue:0.9529 alpha:1.0];
        self.price.backgroundColor = [UIColor whiteColor];
        self.title.backgroundColor = [UIColor whiteColor];
        self.likeCount.backgroundColor = [UIColor whiteColor];
        self.price.textColor = [UIColor redColor];
        self.likeCount.textColor = [UIColor darkGrayColor];

        
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width * 1;
    CGFloat height = self.bounds.size.height;
    self.contentView.layer.cornerRadius = 10;
//    self.contentView.layer.masksToBounds = YES;
    
    
//    self.imageView.frame = CGRectMake(0, 0, width, width);
//    self.title.frame = CGRectMake(0, width, width, width /5);
//    self.price.frame = CGRectMake(0, width + width / 5 - 1, width * 0.7, width / 8);
//    self.likeCount.frame = CGRectMake(width * 0.7, width * 1.2 - 1, width * 0.3, width * 0.125);
//    
    
    self.imageView.frame = CGRectMake(0, 0, width, width);
    self.title.frame = CGRectMake(0, width - 0.04 * height, width, width * 0.2);
    
    self.price.frame = CGRectMake(0, width * 1.2 - 0.044 * height, width * 0.75, width * 0.125);
    self.likeCount.frame = CGRectMake(width * 0.75 - 0.004 * height, width * 1.2 - 0.044 * height, width * 0.25, width * 0.125);
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.price];
    [self.contentView addSubview:self.likeCount];
    
    
}
-(void)setHotModel:(XXHotModel *)hotModel {
     _hotModel = hotModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:hotModel.cover_image_url] placeholderImage:[UIImage imageNamed:@"images-1.jpg"]];
    self.title.text =  self.hotModel.name;
    if (hotModel.favorites_count) {
//        [NSString stringWithFormat:@"%@", [hotModel.favorites_count description]];
        self.likeCount.text =  [NSString stringWithFormat:@"❤  %.1fk",[hotModel.favorites_count floatValue]  / 1000];
    }
//
    if (hotModel.price) {
        self.price.text = [NSString stringWithFormat:@"\t%@", hotModel.price];
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
