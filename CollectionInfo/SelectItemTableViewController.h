//
//  SelectItemTableViewController.h
//  CollectionInfo
//
//  Created by 甄翰宏 on 2016/10/14.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReturnMsgBlock)(NSString *msg);
@interface SelectItemTableViewController : UITableViewController
@property(nonatomic,copy)ReturnMsgBlock returnTextBlock;
-(void)returnMsg:(ReturnMsgBlock)block;

@end
