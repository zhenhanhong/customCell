//
//  ZHCellTypeDate.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "ZHCellTypeDater.h"
#import "SetColor.h"
#import "ZHDatePicker.h"
#define SCRWIDTH [UIScreen mainScreen].bounds.size.width
#define SCRHEIGHT [UIScreen mainScreen].bounds.size.height
@interface ZHCellTypeDater()<ZHDatePickerDelegate>
@property(nonatomic, assign)NSInteger ID;
@end
@implementation ZHCellTypeDater

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.date];
        UITapGestureRecognizer *recog = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapaction)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:recog];
        
    }
    return self;
}
//创建日期选择器
-(void)tapaction{
    NSLog(@"%@",@"创建日期选择器");
    //地区选择器
    ZHDatePicker *areaPicker = [[ZHDatePicker alloc] initWithFrame:CGRectMake(0, 300, SCRWIDTH, 160)];
    areaPicker.delegate = self;
//    [self addSubview:areaPicker];
    [areaPicker show];
    
}
- (void)setZhmessage:(ZHMessage *)zhmessage{
    [super setZhmessage:zhmessage];
    
    _ID = zhmessage.ID;
    
    
}
-(void)datePickerView:(ZHDatePicker *)datePickerView didDateSelected:(NSString *)date{
    NSLog(@"date:%@",date);
    _date.text = date;
    [super.delegate sendMessageWithDic:@{[NSString stringWithFormat:@"%ld",_ID]:date}];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.date.frame = CGRectMake(100, 20, self.frame.size.width - 100 - 10, 44);
    
}
-(UILabel *)date{
    if (_date == nil) {
        _date = [[UILabel alloc]init];
        _date.backgroundColor = [UIColor clearColor];
        _date.textAlignment = NSTextAlignmentRight;
        _date.text = @"日期";
        [_date setTextColor:[SetColor colorWithHexString:@"#b2b2b2"]];
        _date.font = [UIFont systemFontOfSize:14];
    }
    return _date;
}


@end
