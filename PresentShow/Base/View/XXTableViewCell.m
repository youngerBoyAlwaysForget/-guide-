//
//  XXTableViewCell.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/9.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXTableViewCell.h"

@implementation XXTableViewCell

//-(void)dealloc {
//    [_lightView release];
//    [_titleLabel release];
//    [_bigimageView release];
//    [_likeHeart release];
//    [_likeCount release];
//    [super dealloc];
//}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.bigimageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_bigimageView];
        
        self.lightView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_lightView];
        
        

        self.likeCount = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_likeCount];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_titleLabel];
        
        self.likeHeart = [[XXbutton alloc] init];
//                [self addSubview:self.likeHeart];
        [self.contentView addSubview:_likeHeart];
        //        [self bringSubviewToFront:self.likeHeart];

        [_likeHeart setBackgroundImage:[UIImage imageNamed:@"shixin"] forState:UIControlStateNormal];
        
        
    
    
        self.likeCount.textAlignment = NSTextAlignmentCenter;
        
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.bigimageView.backgroundColor = [UIColor darkGrayColor];
    self.lightView.backgroundColor = [UIColor colorWithRed:0.2266 green:0.1149 blue:0.1065 alpha:0.318561422413793];
    //    self.likeHeart.backgroundColor = [UIColor redColor];
    self.likeCount.backgroundColor = [UIColor orangeColor];
    self.titleLabel.backgroundColor = [UIColor colorWithRed:0.5644 green:0.5432 blue:0.6399 alpha:0.5];
    
    
//    _likeCount.text = [NSString stringWithFormat:@"%d", arc4random() %100000 + 10000];
    
    _likeCount.font = [UIFont systemFontOfSize:10.0f];
    // Configure the view for the selected state
}
-(void)setItemModel:(ItemsModel *)itemModel {
    _itemModel = itemModel;
    
    [self.bigimageView sd_setImageWithURL:[NSURL URLWithString:_itemModel.cover_image_url] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d", arc4random()%5 + 11]]];
    self.titleLabel.text = [NSString stringWithFormat:@"\t%@", _itemModel.title];
    self.likeCount.text = [_itemModel.likes_count description];

}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width * 1;
    CGFloat height = self.bounds.size.height * 1;
    
    self.bigimageView.frame = CGRectMake(width * 0.01, 0, width * 0.98, height);
    self.lightView.frame = CGRectMake(width * 0.85, 0, width * 0.1, height * 0.2);
    self.likeHeart.frame = CGRectMake(width * 0.87, 2, width * 0.06, height * 0.12);
    self.likeCount.frame = CGRectMake(width * 0.85, height * 0.13, width * 0.1, height * 0.06);
    self.titleLabel.frame = CGRectMake(0.01 * width, height * 0.7, width * 0.98, height * 0.3);
//    self.titleLabel.frame = CGRectMake(width * 0.03, height * 0.7, width * 0.94, height * 0.3);
    
    
}
- (void)awakeFromNib {
    // Initialization code
    
}


@end
