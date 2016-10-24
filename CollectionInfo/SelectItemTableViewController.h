//
//  SelectItemTableViewController.h
//  CollectionInfo
//
//  Created by 甄翰宏 on 2016/10/14.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReturnMsgBlock)(NSDictionary *msgdic);
@interface SelectItemTableViewController : UITableViewController
@property(nonatomic,copy)ReturnMsgBlock returnTextBlock;
-(void)returnMsg:(ReturnMsgBlock)block;

@property(nonatomic ,assign)NSInteger ID;

@end
