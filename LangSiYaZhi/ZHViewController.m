//
//  ZHViewController.m
//  LangSiYaZhi
//
//  Created by bejoy on 14/8/15.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHViewController.h"
#import "LSMainViewController.h"



#import "LSModelViewController.h"
#import "ZHWujinViewController.h"
#import "ZHSecurityViewController.h"
#import "BejoyViewController.h"
#import "NineSquaredView.h"


@interface ZHViewController ()
{
    NineSquaredView *nsv;
    NSMutableArray *a;
}
@end

@implementation ZHViewController





#pragma mark - CMMotionManager
static const NSTimeInterval deviceMotionMin = 0.1;
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
//#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
- (void)startUpdates
{
    NSTimeInterval updateInterval = deviceMotionMin ;
    
    CMMotionManager *mManager = [(ZHAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    
    
    if ([mManager isDeviceMotionAvailable] == YES) {
        [mManager setDeviceMotionUpdateInterval:updateInterval];
        [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
            
            double gravityX = deviceMotion.gravity.x;
            double gravityY = deviceMotion.gravity.y;
            double gravityZ = deviceMotion.gravity.z;
            
            
            //            角度
            CGFloat r = sqrtf(gravityX*gravityX + gravityY*gravityY + gravityZ*gravityZ);
            CGFloat tiltForwardBackward = acosf(gravityZ/r) * 180.0f / M_PI - 90.0f;
            CGFloat x = 0 ;
            
            if (tiltForwardBackward > 50) {
                x = tiltForwardBackward - 50;
            }
            else  {
                x = tiltForwardBackward - 50;
            }
            //                NSLog(@"%f", tiltForwardBackward);
            //
                NSLog(@"%f", x);
            self.suoImageView.frame = CGRectMake(x*2, 0, self.suoImageView.frame.size.width, self.suoImageView.frame.size.height);
            
        }];
    }
}

- (void)stop
{
    CMMotionManager *mManager = [(ZHAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    [mManager stopDeviceMotionUpdates];
}



#pragma mark - action

int i = 0;

- (IBAction)openViewController:(UIButton *)button
{
    
    LSViewController *lsVC = nil;
    switch (button.tag) {
        case 1:
        {
            lsVC = [[LSMainViewController alloc] initWithNibName:@"LSMainViewController" bundle:nil];
            break;
        }
        case 2:
        {
            
            lsVC = [[LSModelViewController alloc] initWithNibName:@"LSModelViewController" bundle:nil];
            
            break;
        }
        case 3:
        {
            
            lsVC = [[ZHWujinViewController alloc] initWithNibName:@"ZHWujinViewController" bundle:nil];
            
            break;
        }
        case 4:
        {
            
            lsVC = [[ZHSecurityViewController alloc] initWithNibName:@"ZHSecurityViewController" bundle:nil];
            
            break;
        }
        case 5:
        {
            
            lsVC = [[BejoyViewController alloc] init];
            return;
            break;
        }
        case 6:
        {
            
            lsVC = [[BejoyViewController alloc] init];
            
            break;
        }
        default:
            break;
    }
    
    
    lsVC.view.frame = CGRectMake(0, 0, 1024, 768);
    
    lsVC.view.alpha = 0;
    
    [UIView animateWithDuration:KMiddleDuration animations:^{
        lsVC.view.alpha = 1;
    }];
    
    [self addChildViewController:lsVC];
    
    [self.view addSubview:lsVC.view];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self startUpdates];

    
    
    
    
    self.view.frame = CGRectMake(0, 0, 1024, 768);

    nsv = [[NineSquaredView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.contentView addSubview:nsv];
    
    
    
    
    a = [[NSMutableArray alloc] init];
    
    for (int i = 1 ; i < 6; i++) {
        NSString *s = [NSString stringWithFormat:@"雅致-首页-bg0%i@2x.png", i];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:s]];
        iv.frame = CGRectMake(0, 0, 1024, 768);
        
        [a addObject:iv];
    }


}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)enter
{

    
    nsv.viewsArray = a;

}
- (IBAction)enterMain:(id)sender {
    
    [UIView animateWithDuration:KLongDuration animations:^{
        
        self.feiYeView.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            
            
            
            [self stop];
            [self enter];
        }
        
        
    }];
    
}
@end
