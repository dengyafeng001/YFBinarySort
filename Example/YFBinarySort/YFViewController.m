//
//  YFViewController.m
//  YFBinarySort
//
//  Created by Atmosphere201410 on 03/19/2021.
//  Copyright (c) 2021 Atmosphere201410. All rights reserved.
//

#import "YFViewController.h"
#import <YFBinarySort/YFMakeOrderFile.h>
#import "YFBinarySort_Example-Swift.h"

@interface YFViewController ()

@end

@implementation YFViewController

+(void)load
{
    [SwiftTest swiftTest];
}

void testc(){
    testblock();
}

void(^testblock)(void) = ^(void){

};

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    testc();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [YFMakeOrderFile getOrderFile];
}

@end
