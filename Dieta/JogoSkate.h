//
//  JogoSkate.h
//  Dieta
//
//  Created by Renan Gomes on 11/07/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
@class GameTesteViewController;

@interface JogoSkate : SKScene <SKPhysicsContactDelegate>

@property SKNode *camera;
@property SKNode *world;
@property SKSpriteNode *mascote;
@property NSMutableArray *blockList;
@property UIView *MView;

@property GameTesteViewController *classe;

@property BOOL canJump;

@end
