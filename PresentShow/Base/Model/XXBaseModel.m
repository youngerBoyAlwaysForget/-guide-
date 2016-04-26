//
//  XXBaseModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

@implementation XXBaseModel

// KVC 纠错方法
/**
 *  <#Description#>
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
-(id)valueForUndefinedKey:(NSString *)key {
    return nil;
}
@end
