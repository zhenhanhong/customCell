//
//  ZHCellTypeMutiLines.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "ZHCellTypeMutiLinesr.h"
#import "SetColor.h"
@interface ZHCellTypeMutiLinesr()<UITextViewDelegate>
@property(nonatomic, assign)NSInteger ID;
@end
@implementation ZHCellTypeMutiLinesr
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.splitline];
        [self addSubview:self.textview];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(recallkey) name:@"recall" object:nil];
    }

    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.splitline.frame = CGRectMake(10, 64, self.frame.size.width - 20, 1);
    self.textview.frame = CGRectMake(10, self.splitline.frame.size.height + self.splitline.frame.origin.y, self.frame.size.width - 20, self.frame.size.height - 64 - 10);
    
}
- (void)setZhmessage:(ZHMessage *)zhmessage{
    [super setZhmessage:zhmessage];

    _ID = zhmessage.ID;

    
}
-(UITextView *)textview{
    if (_textview == nil) {
        _textview = [[UITextView alloc]init];
        _textview.backgroundColor = [UIColor clearColor];
        _textview.font = [UIFont systemFontOfSize:14];
        _textview.delegate = self;
        [_textview setTextColor:[SetColor colorWithHexString:@"#b2b2b2"]];
    }
    return _textview;
}
-(UIView *)splitline{
    if (_splitline == nil) {
        _splitline = [[UIView alloc]init];
        _splitline.backgroundColor = [SetColor colorWithHexString:@"D5D5D5"];
    }
    return _splitline;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"av:%@",textView.text);
    [super.delegate sendMessageWithDic:@{[NSString stringWithFormat:@"%ld",_ID]:textView.text}];
    return YES;
}
-(void)recallkey{
    [_textview resignFirstResponder];
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"recall" object:nil];
}

@end
