//
//  ViewController.m
//  DemoiOS
//
//  Created by Mark Glagola on 3/2/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //will load data into tableview later on
    tableView.dataSource = nil;
    tableView.delegate = nil;
}

@end
