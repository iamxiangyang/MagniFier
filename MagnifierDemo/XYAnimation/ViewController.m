//
//  ViewController.m
//  XYAnimation
//
//  Created by 陈向阳 on 15/12/11.
//  Copyright © 2015年 陈向阳. All rights reserved.
//

#import "ViewController.h"
#import "CXYMagnifierView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *demoLabel;

//放大镜
@property (strong, nonatomic) CXYMagnifierView *magnifierView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILongPressGestureRecognizer * pressGesTure = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(magniFierAction:)];

    
    self.demoLabel.userInteractionEnabled = YES;
    
    [self.demoLabel addGestureRecognizer:pressGesTure];
    
    

}

-(void)magniFierAction:(UILongPressGestureRecognizer *)gesture
{
    
    NSLog(@"长按手势");
    
    //获取手势位置
    
    CGPoint point = [gesture locationInView:self.view];
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            
            //设置放大镜位置
            
            [self magnifierPosition:point];
            
            //显示放大镜
            [self.magnifierView makeKeyAndVisible];
            
            
            break;
        }
            case UIGestureRecognizerStateChanged:
        {
            
            //设置放大镜位置
            
            [self magnifierPosition:point];
            
            
            
            break;
        }
            case UIGestureRecognizerStateEnded:
        {
            //长按结束取消放大镜
            
            self.magnifierView.hidden  =  YES;
            
            
            
            
            
            break;
        }
        default:
            break;
    }
    
    
    
}



-(void)magnifierPosition:(CGPoint )position
{
    CGPoint  point = position;
    
    point.y -= 25;
    
    position  =  point;
    
    self.magnifierView.pointTomagnify = point;
    
    
}


#pragma mark lazy laod
-(CXYMagnifierView *)magnifierView
{
    if (! _magnifierView) {
        
        _magnifierView = [[CXYMagnifierView alloc]init];
        
        _magnifierView.magnifyView = self.view.window;
    }
    
    
    return _magnifierView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
