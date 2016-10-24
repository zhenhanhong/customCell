//
//  ZHCellTypeline.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "ZHCellTypeliner.h"
#import "Masonry.h"
#import "SetColor.h"

@interface ZHCellTypeliner()<UITextFieldDelegate>
@property(nonatomic,assign)NSInteger ID;
@end
@implementation ZHCellTypeliner

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(recallkey) name:@"recall" object:nil];
        [self addSubview:self.textfield];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.textfield.frame = CGRectMake(100, 20, self.frame.size.width - 100 - 10, 44);
    
}
-(UITextField *)textfield{
    if (_textfield == nil) {
        _textfield = [[UITextField alloc]init];
        _textfield.backgroundColor = [UIColor clearColor];
        _textfield.textAlignment = NSTextAlignmentRight;
        _textfield.placeholder = @"请输入文字";
        _textfield.delegate = self;
        [_textfield setTextColor:[SetColor colorWithHexString:@"#b2b2b2"]];
        _textfield.font = [UIFont systemFontOfSize:14];
    }
    return _textfield;
}


- (void)setZhmessage:(ZHMessage *)zhmessage{
    [super setZhmessage:zhmessage];
    [_textfield setText:zhmessage.text];
    _ID = zhmessage.ID;
    [_textfield resignFirstResponder];
    
}
//textfield代理
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@",textField.text);
    
    [super.delegate sendMessageWithDic:@{[NSString stringWithFormat:@"%ld",_ID]: textField.text}];

    return YES;
}
-(void)returnItemvalueWithBlock:(ReturnItemvalue)block{
    self.returnBlock = block;
}
-(void)recallkey{
    [_textfield resignFirstResponder];
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"recall" object:nil];
}
@end
