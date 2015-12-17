//
//  CXYMagnifierView.h
//  XYAnimation
//
//  Created by 陈向阳 on 15/12/14.
//  Copyright (c) 2015年 陈向阳. All rights reserved.
//



/**************
 *            *
 * 放大镜视图类 *
 *            *
 *************/


#import <UIKit/UIKit.h>

@interface CXYMagnifierView : UIWindow

//放大框
@property(nonatomic,strong)UIView * magnifyView;

//触摸点
@property(nonatomic)CGPoint pointTomagnify;

@end
