//
//  MyTableViewController.m
//  TimerCellDemo
//
//  Created by Yuanhai on 10/12/18.
//  Copyright © 2018年 Yuanhai. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"

@interface MyTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MyTableViewController

- (void)dealloc
{
    NSLog(@"MyTableViewController dealloc..........");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"ProductionCellIdentifier";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    
    if (cell == nil)
    {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCellIdentifier];
    }
    
    cell.leftInterval = indexPath.row * 1000 + 100000;
    
    return cell;
}


@end
