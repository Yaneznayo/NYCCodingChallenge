//
//  SchoolsTableViewCell.m
//  ObjCNYCCodingChallenge
//
//  Created by Christopher Pung on 11/3/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

#import "SchoolsTableViewCell.h"

@interface SchoolsTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *textLabel;


@end

@implementation SchoolsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
