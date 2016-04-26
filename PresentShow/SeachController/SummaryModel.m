//
//  SummaryModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/17.
//  Copyright © 2016年 z. All rights reserved.
//

#import "SummaryModel.h"

@implementation SummaryModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
  if ([key isEqualToString:@"id"]) {
    self.idNum = value;
  }
}
@end
