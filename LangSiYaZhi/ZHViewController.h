//
//  ZHViewController.h
//  LangSiYaZhi
//
//  Created by bejoy on 14/8/15.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface ZHViewController : LSViewController


@property (strong, nonatomic) MPMoviePlayerController *videoController;


@property (strong, nonatomic) IBOutlet UIView *feiYeView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *suoImageView;

- (IBAction)enterMain:(id)sender;

@end
