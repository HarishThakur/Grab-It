//
//  ViewController.m
//  Grab It
//
//  Created by Harish Singh on 12/11/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "ParkViewController.h"
#import "ParkView.h"

@interface ParkViewController ()

@end

@implementation ParkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    ParkView *view = [[ParkView alloc] initWithFrame:frame];
    [self setView:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
