//
//  TableViewController.m
//  ObjCNYCCodingChallenge
//
//  Created by Christopher Pung on 11/3/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//


#import "TableViewController.h"
#import "SchoolsTableViewCell.h"
#import "SATViewController.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *schoolInfo;

@end
@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.parser = [[SchoolParser alloc] init];
    _schoolInfo = self.parser.schoolInfo;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"SchoolsTableViewCell"
                                bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"SchoolsTableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_schoolInfo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SchoolsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SchoolsTableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [_schoolInfo[indexPath.row] name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SATViewController *vc = [sb instantiateViewControllerWithIdentifier:@"SATViewController"];
    
    if ([[_schoolInfo[indexPath.row] scores] criticalReading] != nil){
        [vc setReadingScore: [[_schoolInfo[indexPath.row] scores] criticalReading]];
    }
    else [vc setReadingScore: @"N/A"];
    
    if ([[_schoolInfo[indexPath.row] scores] math] != nil){
        [vc setMathScore: [[_schoolInfo[indexPath.row] scores] math]];
    }
    else [vc setMathScore: @"N/A"];
    
    if ([[_schoolInfo[indexPath.row] scores] writing] != nil || [[_schoolInfo[indexPath.row] scores] writing] == @"s"){
        [vc setWritingScore: [[_schoolInfo[indexPath.row] scores] writing]];
    }
    else [vc setWritingScore: @"N/A"];

    [self presentViewController:vc animated:YES completion:NULL];
}


@end
