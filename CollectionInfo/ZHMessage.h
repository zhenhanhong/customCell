//
//  ZHMessage.h
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Collection.h"
/*
 * 信息类型
 */
typedef NS_ENUM(NSInteger, ZHCellType){
    ZHCellTypeline, //单行
    ZHCellTypeMutiLines, //多行
    ZHCellTypeDate, //日期
    ZHCellTypeOneS, //单选
    ZHCellTypeMutilS //多选
    
};
@interface ZHMessage : NSObject
@property(assign,nonatomic)ZHCellType cellType; //cell类型
@property(strong,nonatomic)NSString *cellIndentify;
@property(assign,nonatomic)CGFloat cellHeight;
@property(assign,nonatomic)CGSize textSize;
@property(strong,nonatomic)Collection *collection;
@property(assign,nonatomic)NSInteger type;
@property(strong,nonatomic)NSString *title;
@property(assign,nonatomic)NSInteger ID;

@property(strong,nonatomic)NSMutableArray *options;
@property(strong,nonatomic)NSString *text;
@property(strong,nonatomic)NSString *oneseletStr;
@property(strong,nonatomic)NSString *mutilseletStr;
@property(strong,nonatomic)NSAttributedString *attrText;

@end
