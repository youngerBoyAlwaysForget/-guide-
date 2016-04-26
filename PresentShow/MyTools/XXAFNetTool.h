//
//  XXAFNetTool.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^blockOfSucceess) (id result);
typedef NS_ENUM(NSInteger, responseStyle) {
    responseJSON,
    responseXML,
    responseData,
};

typedef NS_ENUM(NSUInteger, requestBodyStyle) {
    requestBodyJSON,
    requestBodyString,
};

@interface XXAFNetTool : NSObject


+ (void)GETWithURL:(NSString *)url
                     Body:(id)body
               HeaderFile:(NSDictionary *)header
                 Response:(responseStyle)responseStyle
                  success:(blockOfSucceess)success
                  failure:(void (^)(NSError * error))failure;

+ (void)POSTWithURL:(NSString *)url
              Body:(id)body
          BodyStyle:(requestBodyStyle)requestBody
        HeaderFile:(NSDictionary *)header
          Response:(responseStyle)responseStyle
           success:(blockOfSucceess)success
           failure:(void (^)(NSError * error))failure;
@end
