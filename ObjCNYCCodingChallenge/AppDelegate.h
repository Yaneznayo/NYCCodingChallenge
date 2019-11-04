//
//  AppDelegate.h
//  ObjCNYCCodingChallenge
//
//  Created by Christopher Pung on 11/2/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end
