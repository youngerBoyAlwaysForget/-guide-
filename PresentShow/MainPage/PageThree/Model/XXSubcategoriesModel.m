//
//  XXchannelsModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXSubcategoriesModel.h"

@implementation XXSubcategoriesModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.idOrder = value;
    }
}
@end
