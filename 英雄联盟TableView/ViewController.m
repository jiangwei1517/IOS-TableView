//
//  ViewController.m
//  英雄联盟TableView
//
//  Created by jiangwei18 on 17/6/11.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"
@interface ViewController () <UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property(nonatomic, strong) NSArray* heros;

@end

@implementation ViewController

-(NSArray *)heros {
    if (_heros == nil) {
        NSString* path = [[NSBundle mainBundle]pathForResource:@"heros.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *newHeros = [NSMutableArray new];
        for (NSDictionary* dict in array) {
            Hero* hero = [Hero heroWithDict:dict];
            [newHeros addObject:hero];
        }
        _heros = newHeros;
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.mTableView.backgroundColor = [UIColor redColor];
    self.mTableView.rowHeight = 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    } else {
        return 60;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"LOL";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"英雄联盟";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Hero *hero = self.heros[indexPath.row];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"英雄联盟" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.tag = indexPath.row;
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView textFieldAtIndex:0].text = hero.name;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        // 点击了确定,更新内容
        NSString* newName = [alertView textFieldAtIndex:0].text;
        Hero *hero = self.heros[alertView.tag];
        hero.name = newName;
//        [self.mTableView reloadData];
        NSIndexPath *index = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
        [self.mTableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* ID = @"hero";
    UITableViewCell* cell = [self.mTableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    long row = indexPath.row;
    Hero *hero = self.heros[row];
    [cell.imageView setImage:[UIImage imageNamed:hero.icon]];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    [cell setBackgroundColor:[UIColor blueColor]];
    return cell;
}

@end
