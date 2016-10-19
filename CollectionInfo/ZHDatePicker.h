//
//  ZHDatePicker.h
//  CollectionInfo
//
//  Created by 甄翰宏 on 2016/10/14.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCRWIDTH [UIScreen mainScreen].bounds.size.width
#define SCRHEIGHT [UIScreen mainScreen].bounds.size.height
@class ZHDatePicker;
@protocol ZHDatePickerDelegate <NSObject>

-(void)datePickerView:(ZHDatePicker *)datePickerView didDateSelected:(NSString *)date;

@end
@interface ZHDatePicker : UIView
@property(nonatomic, assign)id<ZHDatePickerDelegate>delegate;
-(void)show;
-(void)dismiss;
@end
