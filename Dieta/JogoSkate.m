//
//  JogoSkate.m
//  Dieta
//
//  Created by Renan Gomes on 11/07/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "JogoSkate.h"
#import "GameTesteViewController.h"

static const UInt32 mascoteCategory = 0x1 << 0;
static const UInt32 blockCategory = 0x1 << 1;

@implementation JogoSkate

@synthesize camera, world, mascote, canJump, blockList, MView, classe;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        blockList = [[NSMutableArray alloc] init];
        
        [self.physicsWorld setContactDelegate:self];
        
        canJump = NO;
        
        self.anchorPoint = CGPointMake (0.25, 0.0);
        
        world = [SKNode node];
        [self addChild:world];
        
        camera = [SKNode node];
        camera.name = @"camera";
        [world addChild:camera];
        
        mascote = [SKSpriteNode spriteNodeWithImageNamed:@"normal1.png"];
        mascote.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:mascote.size];
        mascote.position = CGPointMake(-100, 350);
        
        mascote.name = @"mascote";
        mascote.physicsBody.dynamic = YES;
        mascote.physicsBody.affectedByGravity = YES;
        mascote.physicsBody.allowsRotation = NO;
        mascote.physicsBody.categoryBitMask = mascoteCategory;
        mascote.physicsBody.contactTestBitMask = blockCategory;
        mascote.physicsBody.density = 0.5f;
        mascote.physicsBody.restitution = 0.0f;
        [world addChild:mascote];
//        [self buildScene];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (canJump) {
        [mascote.physicsBody applyForce:CGVectorMake(0, 2000)];
        canJump = NO;
    }
    
    [self.view removeFromSuperview];
    [classe dismissView];
    
    for (UITouch *touch in touches) {
        //CGPoint location = [touch locationInNode:self];
        
        
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact {
    canJump = YES;
}

- (void) buildScene {
    float positionX;
    float positionY;
    int blockSize;
    SKSpriteNode *block;
    
    for (int i = 0; i <= 200; i++) {
        block = [[self blockList] objectAtIndex:i];
        positionX = block.position.x + 360;
        
        positionX = 120 * i * 3;
        positionY = [self randomFloat:60 Max:120];
        [self creatBlock:positionX positionY:positionY];
        
        blockSize = [self randomFloat:5 Max:15];
        
        for (int p = 0; p <= blockSize; p++) {
            block = [[self blockList] objectAtIndex:i];
            positionX = block.position.x + 120;
            [self creatBlock:positionX positionY:positionY];
        }
    }
}

- (void)creatBlock: (float)pX positionY: (float)pY {
    SKSpriteNode *block;
    
    block = [SKSpriteNode spriteNodeWithImageNamed:@"block.png"];
    block.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: block.size];
    block.position = CGPointMake(pX, pY);
    block.physicsBody.dynamic = NO;
    block.physicsBody.affectedByGravity = NO;
    block.physicsBody.allowsRotation = NO;
    block.physicsBody.restitution = 0;
    
    [self.world addChild:block];
    
    [[self blockList] addObject:block];
}

- (void)didSimulatePhysics {
    
    
    
    camera.position = mascote.position;
    [self centerOnNode: [self childNodeWithName: @"//camera"]];
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    if (mascote.physicsBody.velocity.dx < 500) {
        [mascote.physicsBody applyForce:CGVectorMake(50, 0)];
    }
}

- (void) centerOnNode: (SKNode *) node
{
    CGPoint cameraPositionInScene = [node.scene convertPoint:node.position fromNode:node.parent];
    node.parent.position = CGPointMake(node.parent.position.x - cameraPositionInScene.x, node.parent.position.y);
}

-(float) randomFloat: (float)Min Max: (float)Max {
    return ((arc4random()%RAND_MAX)/(RAND_MAX*1.0))*(Max-Min)+Min;

 
}

@end
