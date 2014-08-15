//
//  ZHViewController.m
//  LangSiYaZhi
//
//  Created by bejoy on 14/8/15.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHViewController.h"
#import "LSMainViewController.h"


@interface ZHViewController ()

@end

@implementation ZHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    LSMainViewController *ls = [[LSMainViewController alloc] initWithNibName:@"LSMainViewController" bundle:nil];
    
    
    [self.view addSubview:ls.view];
    [self addChildViewController:ls];
    
    
//    NSString *movieFile = [[NSBundle mainBundle] pathForResource:@"lens1" ofType:@"mp4"];
//    NSURL *url = [NSURL fileURLWithPath:movieFile];
//    
//    NSLog(@"%@", [url absoluteString]);
//    
//    
//    self.videoController = [[MPMoviePlayerController alloc] init];
//    
//    [self.videoController setContentURL:url];
//    [self.videoController.view setFrame:CGRectMake (0, 0, 320, 460)];
//    [self.view addSubview:self.videoController.view];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(videoPlayBackDidFinish:)
//                                                 name:MPMoviePlayerPlaybackDidFinishNotification
//                                               object:self.videoController];
//    [self.videoController play];
    
}




//- (void)videoPlayBackDidFinish:(NSNotification *)notification {
//    
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
//    
//    // Stop the video player and remove it from view
//    [self.videoController stop];
//    [self.videoController.view removeFromSuperview];
//    self.videoController = nil;
//    
//    // Display a message
//    UIAlertView *alert = [[UIAlertView alloc]
//                          initWithTitle:@"Video Playback" message:@"Just finished the video playback. The video is now removed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alert show];
//    
//}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
