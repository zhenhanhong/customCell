//
//  Collection.h
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collection : NSObject
@property(nonatomic, strong)NSString *id;
@property(nonatomic, strong)NSString *projectGuid;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *isRequired;
@property(nonatomic,strong)NSString *tips;
@property(nonatomic,strong)NSString *projectGatherSettingItems;
@end
