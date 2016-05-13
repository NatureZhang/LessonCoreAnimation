//
//  TransformVC.m
//  LessonCoreAnimation
//
//  Created by zhangdong on 16/5/12.
//  Copyright © 2016年 zhangdong. All rights reserved.
//

#import "TransformVC.h"

@interface TransformVC ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (weak, nonatomic) IBOutlet UIView *innerView;

@end

@implementation TransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self contents];
    
//    [self transform2d];
    
//    [self groupTransform];
    
//    [self transForm3d];
//    [self toushiTouying];
    [self 扁平化图层];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)contents {
    UIImage *image = [UIImage imageNamed:@"studyCard_finish"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;
    
    // 与UIView 的contentMode 对应
//    self.layerView.layer.contentsGravity = kCAGravityCenter;
//    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
}

// 仿射变换
- (void)transform2d {
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    self.layerView.layer.affineTransform = transform;
}

// 混合变换
- (void)groupTransform {
    CGAffineTransform transform = CGAffineTransformIdentity; //相当于初始化1
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    transform = CGAffineTransformRotate(transform, M_PI/180.0 * 3);
    transform = CGAffineTransformTranslate(transform, 200, 0);
    
    self.layerView.layer.affineTransform = transform;
}
// 3d变换
- (void)transForm3d {
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView.layer.transform = transform;
}

// 透视投影
- (void)toushiTouying {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0/500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    self.layerView.layer.transform = transform;
}

// 背面
- (void)beimian {
    /*
     绕Y轴旋转180度，可以看到背面
     
     图层是双面绘制的，反面显示的是正面的一个镜像图片
     
     既然看不到背面，为什么要绘制它呢
     
     可以通过设置 layer的 doubleSided 的属性来确定是否需要绘制
     */
}

// 扁平化图层
- (void)扁平化图层 {
//    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//    self.outerView.layer.transform = outer;
//    
//    CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
//    self.innerView.layer.transform = inner;
    
    CATransform3D outer = CATransform3DIdentity;
    outer.m34 = -1.0/500.0;
    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
    self.outerView.layer.transform = outer;
    
    CATransform3D inner = CATransform3DIdentity;
    inner.m34 = -1.0/500.0;
    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
    self.innerView.layer.transform = inner;
    
    
}
@end
