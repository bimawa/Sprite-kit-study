//
//  SPViewController.m
//  SpriteKitGame
//
//  Created by Maksim Bunkow on 18.02.14.
//  Copyright (c) 2014 Bimawa. All rights reserved.
//

#import "SPViewController.h"
#import "SPMyScene.h"

@implementation SPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    SKView *skView = (SKView *) self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES; // Create and configure the scene.
    SKScene * scene = [SPMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill; // Present the scene.
    [skView presentScene:scene];

}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    else
    {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
