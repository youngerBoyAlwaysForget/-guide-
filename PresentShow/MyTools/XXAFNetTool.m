//
//  XXAFNetTool.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXAFNetTool.h"
#import "AFNetworking.h"

#import "MBProgressHUD+NJ.h"
#import "Reachability.h"
typedef void (^blockOfSucceess) (id result);
@implementation XXAFNetTool


// parameters Boday
+(void)GETWithURL:(NSString *)url Body:(id)body HeaderFile:(NSDictionary *)header Response:(responseStyle)responseStyle success:(blockOfSucceess)success failure:(void (^)(NSError *))failure {
    //1.设置网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.设置请求头(如果有的话)
    if (header) {
        for (NSString *key in header.allKeys) {
            [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
        }
    }
    //3.设置返回类型
    switch (responseStyle) {
        case responseJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
            
        case responseXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
            
        case responseData:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
            
        default:
            break;
    }
    //4.设置响应数据类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml", nil]];
    //5.UTF-8转码
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths lastObject];
    
    path = [path stringByAppendingString:[NSString stringWithFormat:@"/%ld.plist", (unsigned long)[url hash]]];
    
    //6.请求数据
    //没有网返回  NO
    // 有网时候执行数据加载动画
    if ([Reachability judgeNetWork]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showMessage:@"waiting"];
            [[MBProgressHUD appearance] setTranslatesAutoresizingMaskIntoConstraints:YES];
            [MBProgressHUD animateKeyframesWithDuration:3 delay:1 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
            } completion:^(BOOL finished) {
                
            }];

        });
        
        
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{            
//                   });
        
    }
    [manager GET:url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
            [NSKeyedArchiver archiveRootObject:responseObject toFile:path];
//

            //以下代码可以实现加载后隐藏, 但是效果不对.(如果省略,提示成功信息,可以使用此方法,否则需要在对应控制器调用 hid 方法.)
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            });
            dispatch_async(dispatch_get_main_queue(), ^{
//                [MBProgressHUD showSuccess:@"加载完毕"];
                [MBProgressHUD hideHUD];
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(error);
            id result = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
            if (result) {
                success(result);
//                
                
            } else {
                NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                [center postNotificationName:@"noResult" object:nil userInfo:nil];
            }
        }
    }];
    
}
// parameters Boday
+ (void)POSTWithURL:(NSString *)url Body:(id)body BodyStyle:(requestBodyStyle)requestBody HeaderFile:(NSDictionary *)header Response:(responseStyle)responseStyle success:(blockOfSucceess)success failure:(void (^)(NSError *))failure {
    //1.设置网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    switch (requestBody) {
        case requestBodyJSON:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case requestBodyString:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable * _Nullable error) {
                return parameters;
            }];
            break;
        default:
            break;
    }
    //3.设置请求头(如果有的话)
    if (header) {
        for (NSString *key in header.allKeys) {
            [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
        }
    }
    //4.设置返回类型
    switch (responseStyle) {
        case responseJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
            
        case responseXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
            
        case responseData:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
            
        default:
            break;
    }
    //5.设置响应数据类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml", nil]];
    //6.UTF-8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //7.请求数据
    [manager GET:url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            
            NSLog(@"success");
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            
            NSLog(@"error,解析错误");
            failure(error);
        }
    }];
    
}

@end
