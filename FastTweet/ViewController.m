//
//  ViewController.m
//  FastTweet
//
//  Created by Jonathan Gaull on 4/14/13.
//  Copyright (c) 2013 OneHeadedLlama. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self showTweetView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTweetComplete:(id)sender {
    [self dismissTweetView];
}

- (void)showTweetView {
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
        [self dismissTweetView];
    };
    
    [self presentViewController:tweetSheet animated:YES completion:nil];
}

- (void)dismissTweetView {
    [self dismissViewControllerAnimated:YES completion:^{
        [self showTweetView];
    }];
}

@end
