//
//  BaseTableviewcell.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "BaseTableviewcell.h"
#import "SetColor.h"
@implementation BaseTableviewcell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[SetColor colorWithHexString:@"#EFEFF4"]];
        [self addSubview:self.title];
        self.backgroundView = self.bgView;

    }
    
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10, 20, 100, 44);
    self.bgView.frame = CGRectMake(0, 19.4, self.frame.size.width, self.frame.size.height-19.4);
    
}

-(UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
        [_bgView.layer setBorderColor:[SetColor colorWithHexString:@"D5D5D5"].CGColor];
        [_bgView.layer setBorderWidth:0.6];
    }
    return _bgView;
}
-(UILabel *)title{
    if (_title == nil) {
        _title = [[UILabel alloc]init];
        _title.backgroundColor = [UIColor clearColor];
        [_title setFont:[UIFont systemFontOfSize:16]];
//        _title.text = @"标题";
    }
    return _title;
}
-(void)setZhmessage:(ZHMessage *)zhmessage{
    _zhmessage = zhmessage;
    self.title.text = zhmessage.title;
    
}

@end
