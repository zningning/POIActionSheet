//
//  ViewController.m
//  POIActionSheet
//
//  Created by yaoning on 15/11/15.
//  Copyright © 2015年 yaoning. All rights reserved.
//

#import "ViewController.h"
#import "POIButtonActionSheetController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
    
    NSArray *titles = @[@"POIButtonActionSheet",@"POICustomViewActionSheet",@"浮窗"];
    self.titles = titles;
}

#pragma mark UITableViewDataSource UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    if (indexPath.row == 0) {
        POIButtonActionSheetController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"buttonActionSheet"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        
    }
    if (indexPath.row == 2) {
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
