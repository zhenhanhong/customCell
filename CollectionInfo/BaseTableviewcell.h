//
//  BaseTableviewcell.h
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHMessage.h"
@protocol sendMessageDelegate <NSObject>
-(void)sendMessageWithDic:(NSDictionary *)dic;
@end
@interface BaseTableviewcell : UITableViewCell
@property(nonatomic, strong)ZHMessage *zhmessage;
@property(nonatomic, strong)UILabel *title;
@property(nonatomic, strong)UIView *bgView;
@property(nonatomic, assign)id<sendMessageDelegate>delegate;
@end
