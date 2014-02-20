//
// Created by Maksim Bunkow on 20.02.14.
// Copyright (c) 2014 Bimawa. All rights reserved.
//

#import "SPBackground.h"


@implementation SPBackground
{


}

+ (SPBackground *)generateNewBackground
{
    SPBackground *background = [[SPBackground alloc] initWithImageNamed:@"background.png"];
    background.anchorPoint = CGPointMake(0, 0);
    background.name = backgroundName;
    background.position = CGPointMake(0, 0);
    return background;
}

@end