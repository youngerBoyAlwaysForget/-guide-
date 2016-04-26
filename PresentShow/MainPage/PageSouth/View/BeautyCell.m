//
//  BeautyCell.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "BeautyCell.h"

@implementation BeautyCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleImageView = [[UIImageView alloc] init];

//        self.titleImageView.dk_backgroundColorPicker = DKColorWithColors([UIColor redColor], [UIColor yellowColor]);
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.backgroundColor = [UIColor colorWithRed:0.7249 green:0.7057 blue:0.8056 alpha:0.526373922413794];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:19 weight:0.6];
        [self.titleImageView addSubview:_titleLabel];
        [self.contentView addSubview:_titleImageView];


    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width * 1;
    CGFloat height = self.bounds.size.height;
    self.titleImageView.frame = CGRectMake(0, 0, width, height);
    self.titleLabel.frame = CGRectMake(0, height * 0.8, width, height * 0.2);
}

-(void)setBeautModel:(BeautyModel *)beautModel {
    if (_beautModel != beautModel) {
        [_beautModel release];
        _beautModel = [beautModel retain];
    }
    [self.titleImageView sd_setImageWithURL:[NSURL URLWithString:beautModel.first_image] placeholderImage:[UIImage imageNamed:@"nanfang.jpg"]];
    self.titleLabel.text = beautModel.title;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
