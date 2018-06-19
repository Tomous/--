//
//  HeaderView.m
//  secondList
//
//  Created by 大橙子 on 2018/6/19.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "HeaderView.h"
#import "UIView+Extension.h"
#import "HeaderModel.h"
@interface HeaderView()
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,weak) UILabel *label;

@end
@implementation HeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _open = NO;
        
        CGFloat titleFont = 15;

        self.backgroundColor = [UIColor whiteColor];
        
        UIView *backView = [[UIView alloc]init];
        backView.backgroundColor = [UIColor whiteColor];
        self.backView = backView;
        [self addSubview:backView];
        
        //时间
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:titleFont] ;
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        [backView addSubview:label];
        self.label = label;
        
        //箭头
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(doSelected) forControlEvents:UIControlEventTouchUpInside];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doSelected)]];
        [btn setImage:[UIImage imageNamed:@"向下箭头-4"] forState:UIControlStateNormal];
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [backView addSubview:btn];
        self.backBtn = btn;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //位置
    self.backView.frame = CGRectMake(0, 5, self.width, self.height - 10);
    self.label.frame = CGRectMake(10, (self.backView.height - 40)/2, self.backView.width - 60, 40);

    self.backBtn.frame = CGRectMake(self.width - self.height +10, 0, self.height - 10, self.height - 10);
}

-(void)setHeaderModel:(HeaderModel *)headerModel
{
    _headerModel = headerModel;
    self.label.text = headerModel.title;
    
}
-(void)doSelected{
    if (_delegate && [_delegate respondsToSelector:@selector(selectedWith:)]){
        [_delegate selectedWith:self];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
