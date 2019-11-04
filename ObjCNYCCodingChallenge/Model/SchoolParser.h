//
//  SchoolParser.h
//  ObjCNYCCodingChallenge
//
//  Created by Christopher Pung on 11/2/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SchoolResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolParser : NSObject

@property (nonatomic, strong) NSURLSession *session;

@property NSMutableArray *avgScore;
@property NSMutableArray *schoolInfo;
@property NSMutableArray *bothInfo;

-(instancetype)init;
-(void)getData;
-(void)schoolParse: (NSData *)school;
-(void)scoreParse: (NSData *)score;
-(void)both;

@end

NS_ASSUME_NONNULL_END
