//
//  RightTableViewCell.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/12.
//  Copyright © 2016年 z. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageViewleft = [[UIImageView alloc] init];
        _name = [[UILabel alloc] init];
        
        _imageViewleft.backgroundColor = [UIColor clearColor];
        _name.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _name.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_imageViewleft];
        [self addSubview:_name];
        
        self.dk_backgroundColorPicker = DKColorWithRGB(0xffffff, 0x343434);
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    _imageViewleft.frame = CGRectMake(0, 0, self.bounds.size.width * 0.2, self.bounds.size.height);
    _name.frame = CGRectMake(self.bounds.size.width * 0.2, 0, self.bounds.size.width * 0.8, self.bounds.size.height);
}
-(void)setSubModel:(XXSubcategoriesModel *)subModel {
    _subModel = subModel;
    _name.text = _subModel.name;
    [_imageViewleft sd_setImageWithURL:[NSURL URLWithString:_subModel.icon_url] placeholderImage:[UIImage imageNamed:@"Img222423471.gif"]];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
