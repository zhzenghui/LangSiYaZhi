//
//  NineSquaredView.m
//  LangSiYaZhi
//
//  Created by bejoy on 14/8/15.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "NineSquaredView.h"
#import "CMSCoinView.h"


@implementation NineSquaredView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        currentIndex = 0;
        [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(animation) userInfo:nil repeats:YES];
    }
    return self;
}


- (void)animation
{
    
    
    
    for (UIView *v  in tempArray) {

        [v removeFromSuperview];
    }

    NSLog(@"%i", self.subviews.count);
    
    
    [self setBackground];
}




- (void)setBackground
{
    
    
    if (currentIndex == self.viewsArray.count -1 ) {
        currentIndex = 0;
    }

    
    UIImageView *iv =self.viewsArray[currentIndex];
    [self animateTransition:iv ];
    
    
    
    currentIndex ++;
    
}

- (void)setViewsArray:(NSMutableArray *)viewsArray
{
    if ( ! [self.viewsArray isEqual: viewsArray]) {
        _viewsArray = viewsArray;
        [self setBackground];
    }
}

#define HLINEHEIGHT 256
#define HLINEWIDTH 256
#define RANDOM_FLOAT(MIN,MAX) (((CGFloat)arc4random() / 0x100000000) * (MAX - MIN) + MIN);


int trans = 0;

- (void)animateTransition:(UIView *)fromVC
{
    
    
    UIView *mainSnap = [fromVC snapshotViewAfterScreenUpdates:YES];

    
    
    tempArray = outgoingLineViews;

//    切割视图
    outgoingLineViews = [self cutView:mainSnap intoSlicesOfHeight:HLINEHEIGHT OfWidth:HLINEWIDTH yOffset:fromVC.frame.origin.y];

    
 
    
    int i = 0;
    for (UIView *v in outgoingLineViews) {
        v.alpha = 1;
        
        

        
        
        CGFloat f = RANDOM_FLOAT(3.0, 4.0);
        NSLog(@"%i  %f", i, f);
        i ++;

        

        if (trans == 0) {
            trans = 1;
        }
        else
            trans = 0;
        
        [self fullSrceen:v time:f transition:trans];
        



    }

}



- (void)fullSrceen:(UIView *)b time:(CGFloat)time transition:(int )transition
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
	//开始准备动画
    
	[UIView beginAnimations:nil context:context];
	//设置动画曲线，翻译不准，见苹果官方文档
    
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
	//设置动画持续时间
    
	[UIView setAnimationDuration:time];
	//因为没给viewController类添加成员变量，所以用下面方法得到viewDidLoad添加的子视图
    
    
	//设置动画效果
    
    
    if (transition) {
        [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:b cache:NO];  //从上向下
        
    }
    else {
        [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:b cache:NO];  //从上向下

    }
	//设置动画委托
    
    
	[UIView setAnimationDelegate:self];
    
	//当动画执行结束，执行animationFinished方法
    
//	[UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    
	//提交动画
    
	[UIView commitAnimations];
    
}




#define RANDOM_FLOAT(MIN,MAX) (((CGFloat)arc4random() / 0x100000000) * (MAX - MIN) + MIN);


-(NSMutableArray *)cutView:(UIView *)view intoSlicesOfHeight:(float)height OfWidth:(float)width yOffset:(float)yOffset{
    
    CGFloat lineWidth = HLINEWIDTH; //CGRectGetWidth(view.frame);
    CGFloat lineHieht = HLINEHEIGHT;//CGRectGetWidth(view.frame);


    NSMutableArray *lineViews = [NSMutableArray array];
    
    for (int y=0; y<CGRectGetHeight(view.frame); y+=height) {

        for (int x=0; x<CGRectGetWidth(view.frame); x+=width) {


            CGRect subrect = CGRectMake(x, y, lineWidth, lineHieht);
            
            
            UIView *subsnapshot;
            subsnapshot = (UIView *)[view resizableSnapshotViewFromRect:subrect afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
            subrect.origin.y += yOffset;
            subsnapshot.frame = subrect;
            [self addSubview:subsnapshot];

            subsnapshot.alpha = 0;
            
            [lineViews addObject:subsnapshot];
            


        }

    }
    return lineViews;
    
}

@end
