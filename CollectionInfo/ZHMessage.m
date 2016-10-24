//
//  ZHMessage.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "ZHMessage.h"
static UILabel *label = nil;
@implementation ZHMessage

-(instancetype)init{
    if (self = [super init]) {
        if (label == nil) {
            label = [[UILabel alloc]init];
            [label setNumberOfLines:0];
            [label setFont:[UIFont systemFontOfSize:16.0f]];
        }
    }
    return self;
}
-(void)setID:(NSInteger)ID{
    _ID = ID;
}
-(void)setOptions:(NSMutableArray *)options{
    _options = options;
}
-(void)setType:(NSInteger)type{
    _type = type;
}
-(void)setTitle:(NSString *)title{
    _title = title;
}
-(void)setText:(NSString *)text{
    _text = text;
}
-(void)setOneseletStr:(NSString *)oneseletStr{
    _oneseletStr = oneseletStr;
}
-(void)setMutilseletStr:(NSString *)mutilseletStr{
    _mutilseletStr = mutilseletStr;
}
-(void)setCollection:(Collection *)collection{
    _collection = collection;
}

-(void)setCellType:(ZHCellType)cellType{
    _cellType = cellType;
    switch (cellType) {
        case ZHCellTypeline:
            self.cellIndentify = @"onelinecell";
            break;
        case ZHCellTypeMutiLines:
            self.cellIndentify = @"mutilinecell";
            break;
        case ZHCellTypeDate:
            self.cellIndentify = @"datecell";
            break;
        case ZHCellTypeOneS:
            self.cellIndentify = @"oneselectcell";
            break;
        case ZHCellTypeMutilS:
            self.cellIndentify = @"mutilselectcell";
            break;
        
        default:
            break;
    }
}
-(CGSize)textSize{
    [label setAttributedText:_attrText];
    _textSize = [label sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.58, MAXFLOAT)];
    return _textSize;
}
-(CGFloat)cellHeight{
    switch (self.cellType) {
        case ZHCellTypeline:
            return 64;
            break;
        case ZHCellTypeMutiLines:
            return 140;
            break;
        case ZHCellTypeDate:
            return 64;
            break;
        case ZHCellTypeOneS:
            return 64;
            break;
        case ZHCellTypeMutilS:
            return 64;
            break;
        default:
            break;
    }
    return 0;
}
@end
