//
//  SelectItemsTableViewController.h
//  CollectionInfo
//
//  Created by 甄翰宏 on 2016/10/14.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReturnMsgs)(NSDictionary *msgdic);
@interface SelectItemsTableViewController : UITableViewController
@property(nonatomic, copy)ReturnMsgs returnMsgsBock;
-(void)returnMsgs:(ReturnMsgs)returnmsgs;
@property(nonatomic, assign)NSInteger ID;
@end
