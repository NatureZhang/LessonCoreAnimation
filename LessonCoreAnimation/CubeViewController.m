//
//  CubeViewController.m
//  LessonCoreAnimation
//
//  Created by zhangdong on 16/5/12.
//  Copyright © 2016年 zhangdong. All rights reserved.
//

#import "CubeViewController.h"

@interface CubeViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *cubeFaces;
@end

@implementation CubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self rangeCubefaceTransform];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform {
    UIView *face = self.cubeFaces[index];
    [self.containerView addSubview:face];
    
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width/2.0, containerSize.height/2.0);
    face.layer.transform = transform;
}

- (void)rangeCubefaceTransform {
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.containerView.layer.sublayerTransform = perspective;
    
    
    // face1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    
    // face 2
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];

    // face 3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];

    // face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    // face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    
    // face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
}
@end
