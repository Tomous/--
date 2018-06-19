//
//  HeaderView.h
//  secondList
//
//  Created by 大橙子 on 2018/6/19.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeaderView,HeaderModel;
@protocol HeaderViewDelegate <NSObject>
-(void)selectedWith:(HeaderView *)view;
@end
@interface HeaderView : UIView
@property (nonatomic,weak) id<HeaderViewDelegate> delegate;
@property(nonatomic, assign) NSInteger index;
@property(nonatomic, assign) BOOL open;
@property(nonatomic, retain) UIButton* backBtn;
@property(nonatomic, strong) HeaderModel * headerModel;

@end
