//
//  CXYMagnifierView.m
//  XYAnimation
//
//  Created by 陈向阳 on 15/12/14.
//  Copyright (c) 2015年 陈向阳. All rights reserved.
//

#import "CXYMagnifierView.h"

@interface CXYMagnifierView ()

@property (nonatomic, strong) CALayer *contentLayer;

@end



@implementation CXYMagnifierView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




-(instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.frame = CGRectMake(0, 0, 100, 50);
        
        self.backgroundColor = [UIColor clearColor];
        
        self.layer.borderWidth = 1;
        
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        self.layer.cornerRadius = 5;
        
        self.layer.masksToBounds = YES;
        
        self.windowLevel = UIWindowLevelAlert;
        
        self.contentLayer = [CALayer layer];
        
        self.contentLayer.frame = self.bounds;
        
        self.contentLayer.delegate = self;
        
        self.contentLayer.contentsScale = [[UIScreen mainScreen] scale];
        
        [self.layer addSublayer:self.contentLayer];
        
    }
    
    
    return self;
}


#pragma mark set the point of magnifier
-(void)setPointTomagnify:(CGPoint)pointTomagnify
{
    _pointTomagnify = pointTomagnify;
    
    CGPoint center = CGPointMake(pointTomagnify.x, self.center.y);
    
    if (pointTomagnify.y > CGRectGetHeight(self.bounds) * 0.5) {
        
        center.y = pointTomagnify.y - CGRectGetHeight(self.bounds)/2;
    }
    
    self.center = center;
    
    [self.contentLayer setNeedsDisplay];
}

#pragma mark  invoke  by setNeedDisplay
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
    float width = CGRectGetWidth(self.frame);
    
    float height = CGRectGetHeight(self.frame);
    
    //宽高
    CGContextTranslateCTM(ctx,width * 0.5, height * 0.5);
    
    //缩放比例
    CGContextScaleCTM(ctx, 1.5, 1.5);
    
    //x y 坐标转换
    CGContextTranslateCTM(ctx, -self.pointTomagnify.x , -self.pointTomagnify.y - 20);
    
    //截屏并显示
    [self.magnifyView.layer renderInContext:ctx];
    
}
@end
