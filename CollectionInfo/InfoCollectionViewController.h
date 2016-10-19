//
//  ViewController.h
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHMessage.h"
#import "Collection.h"
#import "ZHCellTypeliner.h"
#import "ZHCellTypeMutiLinesr.h"
#import "ZHCellTypeDater.h"
#import "ZHCellTypeOneSelect.h"
#import "ZHCellTypeMutilSelect.h"
#import "BaseTableviewcell.h"
#import "SetColor.h"
#import "SelectItemTableViewController.h"
#import "SelectItemsTableViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface InfoCollectionViewController : UIViewController
@property(strong, nonatomic)UITableView *tableview;
@property(strong, nonatomic)NSMutableArray *arr;
@property(strong, nonatomic)Collection *collection;

@end

