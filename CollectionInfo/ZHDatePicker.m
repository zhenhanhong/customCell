//
//  ZHDatePicker.m
//  CollectionInfo
//
//  Created by 甄翰宏 on 2016/10/14.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "ZHDatePicker.h"
@interface ZHDatePicker(){
    UIWindow    *modelWindow;
    UIWindow    *resignWindow;
}
@property(nonatomic, strong)UIDatePicker *datePicker;
@property(nonatomic, strong)UIButton *confirm;
@property(nonatomic, strong)UIButton *cancel;
@end
@implementation ZHDatePicker

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        //设置window
        modelWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        UIColor *color = [UIColor blackColor];
        modelWindow.backgroundColor = [color colorWithAlphaComponent:0.3];
        resignWindow   = [[UIApplication sharedApplication] keyWindow];

        //日期选择器
        [self addSubview:self.datePicker];
        [self addSubview:self.confirm];
        [self addSubview:self.cancel];
      
    }
    return self;
}
-(UIDatePicker *)datePicker{
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc]init];
        _datePicker.frame = CGRectMake(0, 30, self.frame.size.width, 150);
        _datePicker.backgroundColor = [UIColor whiteColor];
        [_datePicker setDatePickerMode:UIDatePickerModeDate];
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        _datePicker.locale = locale;
        NSDateFormatter *formatter_minDate = [[NSDateFormatter alloc] init];
        [formatter_minDate setDateFormat:@"yyyy-MM-dd"];
        NSDate *minDate = [formatter_minDate dateFromString:@"2007-01-01"];
        formatter_minDate = nil;
        [_datePicker setMinimumDate:minDate];
        
    }
    return _datePicker;
}
-(UIButton *)cancel{
    if (_cancel == nil) {
        //取消按钮
        _cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60,30)];
        [_cancel setBackgroundColor:[UIColor blackColor]];
        [_cancel setTitle:@"取消" forState:UIControlStateNormal];
        [_cancel.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_cancel addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];

    }
    return _cancel;
}
-(UIButton *)confirm{
    if (_confirm == nil) {
        //确定按钮
        _confirm = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 60,0,60,30)];
        [_confirm setTitle:@"确定" forState:UIControlStateNormal];
        [_confirm setBackgroundColor:[UIColor blackColor]];
        [_confirm addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _confirm;
}
-(void)selectAction:(id)sender{
    [self dismiss];
    if (_delegate && [_delegate respondsToSelector:@selector(datePickerView:didDateSelected:)]) {
        [_delegate datePickerView:self didDateSelected:[self getDateString]];
    }
}
- (NSString *)getDateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [dateFormatter stringFromDate:[self.datePicker date]];
    
    return date;
}
-(void)show{
    [modelWindow makeKeyAndVisible];
    [modelWindow addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, SCRHEIGHT - 180, SCRWIDTH, 180);

    }];
}
-(void)dismiss{
    [UIView animateWithDuration:0.3 animations:^{
       self.frame = CGRectMake(0, SCRHEIGHT, 0, 0);
        [modelWindow resignKeyWindow];
        [resignWindow makeKeyAndVisible];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
