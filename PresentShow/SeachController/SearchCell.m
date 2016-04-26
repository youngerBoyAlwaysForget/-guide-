//
//  SearchCell.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/22.
//  Copyright © 2016年 z. All rights reserved.
//

#import "SearchCell.h"

@implementation SearchCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.bigPic = [[UIImageView alloc] init];
        self.name = [[UILabel alloc] init];
        self.likeCount = [[UILabel alloc] init];
        self.likeCount.font = [UIFont systemFontOfSize:13];
//        self.likeCount.transform = CGAffineTransformMakeRotation( -M_2_PI + 0.2);
        self.likeCount.backgroundColor = [UIColor clearColor];
        self.likeCount.textAlignment = NSTextAlignmentCenter;
        self.name.textAlignment = NSTextAlignmentLeft;
        self.name.numberOfLines = 3;
        [self.contentView addSubview:self.bigPic];
        [self.contentView addSubview:self.name];
        [self.bigPic addSubview:self.likeCount];
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width * 1;
        CGFloat height = self.bounds.size.height;
    self.bigPic.frame = CGRectMake(0, 0, width * 0.3, height);
    self.name.frame = CGRectMake(width * 0.35, 0, width * 0.6, height * 0.6);
    self.likeCount.frame = CGRectMake(width * 0.65, height * 0.6, width * 0.35, height * 0.25);
    
}
-(void)setSumMdoel:(SummaryModel *)sumMdoel {
    if (_sumMdoel != sumMdoel) {
        [_sumMdoel release];
        _sumMdoel = [sumMdoel retain];
    }
    [self.bigPic sd_setImageWithURL:[NSURL URLWithString:sumMdoel.cover_image_url] placeholderImage:[UIImage imageNamed:@"Img222423471.gif"]];
    self.name.text = sumMdoel.title;
    NSString *string = [NSString stringWithFormat:@"%@ 人喜欢", sumMdoel.likes_count];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    if (sumMdoel.likes_count) {
        NSRange range = [string rangeOfString:sumMdoel.likes_count.stringValue];
        [attributedString addAttributes:[NSMutableDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:15], NSFontAttributeName, nil] range:range];
        self.likeCount.attributedText = attributedString;
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
