//
//  SATViewController.m
//  ObjCNYCCodingChallenge
//
//  Created by Christopher Pung on 11/3/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

#import "SATViewController.h"

@interface SATViewController ()

@property (strong, nonatomic) IBOutlet UILabel *readingLabel;
@property (strong, nonatomic) IBOutlet UILabel *writingLabel;
@property (strong, nonatomic) IBOutlet UILabel *mathLabel;

@end

@implementation SATViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _readingLabel.text = _readingScore;
    _mathLabel.text = _mathScore;
    _writingLabel.text = _writingScore;

}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
