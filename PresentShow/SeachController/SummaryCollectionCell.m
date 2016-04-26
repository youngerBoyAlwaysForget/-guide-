//
//  SummaryCollectionCell.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/17.
//  Copyright © 2016年 z. All rights reserved.
//

#import "SummaryCollectionCell.h"

@implementation SummaryCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    CGFloat width = self.bounds.size.width * 1;
    CGFloat height = self.bounds.size.height;
    self.bigPic = [[UIImageView alloc]
        initWithFrame:CGRectMake(0, 0, width, height * 0.86)];
    self.name = [[UILabel alloc]
        initWithFrame:CGRectMake(5, height * 0.87, width, height * 0.12)];
    self.likeCount = [[UILabel alloc]
        initWithFrame:CGRectMake(-0.024 * width, height * 0.005, width * 0.43,
                                 height * 0.12)];
    self.likeCount.font = [UIFont systemFontOfSize:13];
    self.likeCount.transform = CGAffineTransformMakeRotation(-M_2_PI);
    self.likeCount.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.bigPic];
    [self.contentView addSubview:self.name];
    [self.bigPic addSubview:self.likeCount];
    //        [self.contentView addSubview:self.price];
    //        self.price = [[UILabel alloc] init];
  }
  return self;
}
- (void)setSumMdoel:(SummaryModel *)sumMdoel {
  if (_sumMdoel != sumMdoel) {
    [_sumMdoel release];
    _sumMdoel = [sumMdoel retain];
  }
  [self.bigPic sd_setImageWithURL:[NSURL URLWithString:sumMdoel.cover_image_url]
                 placeholderImage:[UIImage imageNamed:@"Img222423471.gif"]];
  self.name.text = sumMdoel.title;
  NSString *string =
      [NSString stringWithFormat:@"%@ 人喜欢", sumMdoel.likes_count];
  NSMutableAttributedString *attributedString =
      [[NSMutableAttributedString alloc] initWithString:string];
  if (sumMdoel.likes_count) {
    NSRange range = [string rangeOfString:sumMdoel.likes_count.stringValue];
    [attributedString
        addAttributes:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor redColor],
                                               NSForegroundColorAttributeName,
                                               [UIFont systemFontOfSize:15],
                                               NSFontAttributeName, nil]
                range:range];
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
