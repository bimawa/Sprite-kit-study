//
//  SPMyScene.m
//  SpriteKitGame
//
//  Created by Maksim Bunkow on 18.02.14.
//  Copyright (c) 2014 Bimawa. All rights reserved.
//

#import "SPMyScene.h"

@implementation SPMyScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Setup your scene here */

        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];

        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.name = @" theLabel";
                myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                CGRectGetMidY(self.frame));

        [self addChild:myLabel];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */

    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInNode:self];

        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];

        sprite.position = location;

        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];

        [sprite runAction:[SKAction repeatActionForever:action]];

        [self addChild:sprite];
    }
}

- (void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
    [self enumerateChildNodesWithName:@" theLabel" usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - 2, node.position.y);
        if (node.position.x < -node.frame.size.width)
        {
            node.position = CGPointMake(self.frame.size.width, node.position.y);
        }
    }];
}

@end
