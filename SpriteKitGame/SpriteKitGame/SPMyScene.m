//
//  SPMyScene.m
//  SpriteKitGame
//
//  Created by Maksim Bunkow on 18.02.14.
//  Copyright (c) 2014 Bimawa. All rights reserved.
//

#import "SPBackground.h"
#import "SPMyScene.h"

@interface SPMyScene ()
@property (nonatomic) CFTimeInterval lastUpdateTimeInterval;
@end

@implementation SPMyScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Setup your scene here */

        self.currentBackground = [SPBackground generateNewBackground];
        [self addChild:self.currentBackground];

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
    CFTimeInterval timeSinceLast = currentTime-self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
    }

    /* Called before each frame is rendered */
    [self enumerateChildNodesWithName:backgroundName usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - 2, node.position.y);
        if (node.position.x < -node.frame.size.width)
        {
            node.position = CGPointMake( node.position.x - backgroundMoveSpeed * timeSinceLast, node.position.y);
        }
    }];
}

@end
