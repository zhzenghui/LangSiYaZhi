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

@end

@implementation ZHViewController



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
    
    
    lsVC.view.frame = self.view.frame;
    
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
    
    self.view.frame = CGRectMake(0, 0, 1024, 768);

    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    
    for (int i = 1 ; i < 6; i++) {
        NSString *s = [NSString stringWithFormat:@"雅致-首页-bg0%i@2x.png", i];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:s]];
        iv.frame = CGRectMake(0, 0, 1024, 768);

        [a addObject:iv];
    }
    
    
    NineSquaredView *nsv = [[NineSquaredView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.contentView addSubview:nsv];
    nsv.viewsArray = a;

    
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


- (IBAction)enterMain:(id)sender {
    
    [UIView animateWithDuration:KLongDuration animations:^{
        
        self.feiYeView.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            
        }
        
        
    }];
    
}
@end
