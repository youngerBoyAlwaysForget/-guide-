//
//  SeachManager.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/11.
//  Copyright © 2016年 z. All rights reserved.
//

#import "SeachManager.h"

@implementation SeachManager
+ (void)searchMemoery:(NSString *)text {
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    
    NSArray *array = [userDefaultes arrayForKey:@"zxx"];
    if (array.count > 0) {
        
    } else {
        array = [NSArray array];
    }
    NSMutableArray *search = [array mutableCopy];
    [search addObject:text];
    if (search.count > 3) {
        [search removeObjectAtIndex:0];
    }
    [userDefaultes setObject:search forKey:@"zxx"];
    [userDefaultes synchronize];
}
+ (void)removeAll {
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    [userDefaultes removeObjectForKey:@"zxx"];
    [userDefaultes synchronize];
}
@end
