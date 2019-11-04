//
//  TableViewController.h
//  ObjCNYCCodingChallenge
//
//  Created by Christopher Pung on 11/3/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchoolParser.h"

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) SchoolParser *parser;

@end
