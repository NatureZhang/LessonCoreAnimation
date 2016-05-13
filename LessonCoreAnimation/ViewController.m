//
//  ViewController.m
//  LessonCoreAnimation
//
//  Created by zhangdong on 16/5/9.
//  Copyright © 2016年 zhangdong. All rights reserved.
//

#import "ViewController.h"
#import "TransformVC.h"
#import "CubeViewController.h"
#import "SubCaLayerVC.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = @"Transform";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"立方体";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"专有图层";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UIViewController *vc = nil;
    if (indexPath.row == 1) {
        vc = [[TransformVC alloc] init];
    }
    if (indexPath.row == 2) {
        vc = [[CubeViewController alloc] init];
    }
    if (indexPath.row == 3) {
        vc = [[SubCaLayerVC alloc] init];
    }
    
    if (vc) {
         [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
