//
//  DataBaseTools.h
//  UI_22DataBase
//
//  Created by zxx_ 's compu on 16/2/26.
//  Copyright © 2016年 zxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseModel.h"
@interface DataBaseTools : NSObject



+ (instancetype)databaseManager;

- (void)openDataBase ;
- (void)closeDataBase ;
- (void)createTable;

- (BOOL)insertDataBase:(NSString *)name withAge:(NSString *)url;

//- (void)selectDataBase:(NSString *)name;

- (void)updateDateBase:(NSString *)name withNewName:(NSString *)newName;

- (void)deleteDataBase:(NSString *)name;
- (NSArray *)readDatabase;
@end
