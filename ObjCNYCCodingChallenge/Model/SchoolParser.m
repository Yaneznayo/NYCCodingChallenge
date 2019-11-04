//
//  SchoolParser.m
//  ObjCNYCCodingChallenge
//
//  Created by Christopher Pung on 11/2/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

#import "SchoolParser.h"

typedef void (^DataTaskComp)(NSData *, NSURLResponse *, NSError *);

@implementation SchoolParser

- (instancetype)init {
    if (self = [super init]) {
        [self getData];
    }
    return self;
}

-(void)getData{
    _schoolInfo = [[NSMutableArray alloc] init];
    _avgScore = [[NSMutableArray alloc] init];
    NSString *base = @"https://data.cityofnewyork.us/resource/s3k6-pzi2.json";
    NSURL *url = [NSURL URLWithString:base];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [self schoolParse:data];
    
    base = @"https://data.cityofnewyork.us/resource/f9bf-2cp4.json";
    url = [NSURL URLWithString:base];
    data = [NSData dataWithContentsOfURL:url];
    [self scoreParse:data];
    
    [self combine];
}

-(void)schoolParse: (NSData *)school{

    NSArray *json = [NSJSONSerialization JSONObjectWithData: school options: NSJSONReadingMutableLeaves error: nil];
    NSMutableArray *names = [[NSMutableArray alloc] init];
    NSMutableArray *dbn = [[NSMutableArray alloc] init];
    
    for (int i =0; i < json.count; i++){
        [names addObject: json[i][@"school_name"]];
        [dbn addObject: json[i][@"dbn"]];
    }
    
    for (int i = 0; i < dbn.count; i++){
        SchoolResponse *response = [[SchoolResponse alloc] init];
        response.name = names[i];
        response.dbn = dbn[i];
        [_schoolInfo addObject: response];
}
}

-(void)scoreParse: (NSData *)scoreData{
    NSArray *json = [NSJSONSerialization JSONObjectWithData: scoreData options: NSJSONReadingMutableLeaves error:nil];
    NSMutableArray *dbn = [[NSMutableArray alloc] init];
    NSMutableArray *readingScore = [[NSMutableArray alloc] init];
    NSMutableArray *writingScore = [[NSMutableArray alloc] init];
    NSMutableArray *mathScore = [[NSMutableArray alloc] init];

    
    for (int i =0; i < json.count; i++){
        [dbn addObject: json[i][@"dbn"]];
        [readingScore addObject: json[i][@"sat_critical_reading_avg_score"]];
        [writingScore addObject:json[i][@"sat_writing_avg_score"]];
        [mathScore addObject: json[i][@"sat_math_avg_score"]];

    }
    
    for (int i = 0; i < dbn.count; i++){
        SATScore *score = [[SATScore alloc] init];
        score.dbn = dbn[i];
        score.criticalReading = readingScore[i];
        score.writing = writingScore[i];
        score.math = mathScore[i];

        [_avgScore addObject: score];
    }
}

-(void)combine{
    for (int i = 0; i < _schoolInfo.count; i++){
        for (int j = 0; j < _avgScore.count; j++){
            if ( [_schoolInfo[i] dbn] == [_avgScore[j] dbn]){
                [_schoolInfo[i] setScores:_avgScore[j]];
                break;
            }
        }
    }
}

@end
