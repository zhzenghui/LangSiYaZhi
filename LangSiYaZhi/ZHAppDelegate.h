//
//  ZHAppDelegate.h
//  LangSiYaZhi
//
//  Created by bejoy on 14/8/15.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>




@interface ZHAppDelegate : UIResponder <UIApplicationDelegate>
{
    CMMotionManager *motionmanager;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, readonly) CMMotionManager *sharedManager;




@end
