//
//  ViewController.m
//  TimerCellDemo
//
//  Created by Yuanhai on 10/12/18.
//  Copyright © 2018年 Yuanhai. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)pushMyTable:(id)sender
{
    MyTableViewController *controller = [[MyTableViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:controller animated:YES completion:nil];
}


@end
