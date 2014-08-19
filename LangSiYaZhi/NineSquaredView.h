//
//  NineSquaredView.h
//  LangSiYaZhi
//
//  Created by bejoy on 14/8/15.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMSCoinView.h"


@interface NineSquaredView : UIView
{
    int currentIndex;
    
    NSMutableArray *outgoingLineViews;
    
    
    NSMutableArray *tempArray;
}


@property(nonatomic, strong) NSMutableArray *viewsArray;


- (void)animateTransition:(UIView *)fromVC;

@end
