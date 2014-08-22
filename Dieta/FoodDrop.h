//
//  FoodDrop.h
//  Dieta
//
//  Created by Daniel Missima Teodoro on 06/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PersonagemCoreData.h"

@interface FoodDrop : SKScene <SKPhysicsContactDelegate> {
    CGPoint point;
}
@property UIView *MView;
@property SKSpriteNode *eater, *inicio, *coracao, *coracao2, *coracao3;
@property SKLabelNode *pontosLabel, *vidasLabel;
@property int pontos, vidas;
@property PersonagemCoreData *personagemCoreData;
@property BOOL finalizado;

@end
