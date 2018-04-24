//
//  ViewController.m
//  archiverTest
//
//  Created by 铁血-mac on 2017/10/24.
//  Copyright © 2017年 tiexue. All rights reserved.
//

#import "ViewController.h"
#import "model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    model *mod = [[model alloc] init];
    [mod archiver];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
