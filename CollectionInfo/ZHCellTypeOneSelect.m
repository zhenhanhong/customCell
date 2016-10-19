//
//  ZHCellTypeOther.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "ZHCellTypeOneSelect.h"
#import "SetColor.h"
@interface ZHCellTypeOneSelect ()
@property(nonatomic, strong)NSString *type;
@end
@implementation ZHCellTypeOneSelect

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.item];
        UITapGestureRecognizer *recog = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapaction)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:recog];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.item.frame = CGRectMake(100, 20, self.frame.size.width - 100 - 10, 44);
    
}
-(UILabel *)item{
    if (_item == nil) {
        _item = [[UILabel alloc]init];
        _item.backgroundColor = [UIColor clearColor];
        _item.textAlignment = NSTextAlignmentRight;
//        _item.text = @"点击进行选择";
        [_item setTextColor:[SetColor colorWithHexString:@"#b2b2b2"]];
        _item.font = [UIFont systemFontOfSize:14];
    }
    return _item;
}


- (void)setZhmessage:(ZHMessage *)zhmessage{
    [super setZhmessage:zhmessage];
    _type = zhmessage.title;
    if (zhmessage.oneseletStr == nil || [zhmessage.oneseletStr isEqualToString:@""]) {
        _item.text = @"点击进行选择";
    }else{
        if ([_type isEqualToString:@"单选"]) {
            _item.text = zhmessage.oneseletStr;
        }
        
    }
    
    
}
-(void)tapaction{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"item" object:nil];
}

@end
