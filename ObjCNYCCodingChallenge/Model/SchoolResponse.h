//
//  SchoolResponse.h
//  ObjCNYCCodingChallenge
//
//  Created by Christopher Pung on 11/2/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SATScore.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolResponse : NSObject

@property NSString *dbn;
@property NSString *name;
@property SATScore *scores;

@end

NS_ASSUME_NONNULL_END
