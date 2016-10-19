//
//  ZHCellTypeline.h
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableviewcell.h"
typedef void(^ReturnItemvalue)(NSString* value);
@interface ZHCellTypeliner : BaseTableviewcell
@property(nonatomic, strong)UITextField *textfield;
@property(nonatomic, copy)ReturnItemvalue returnBlock;
-(void)returnItemvalueWithBlock:(ReturnItemvalue)block;
@end
