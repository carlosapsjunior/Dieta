//
//  FoodDrop.m
//  Dieta
//
//  Created by Daniel Missima Teodoro on 06/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "FoodDrop.h"
#import "GameTesteViewController.h"

#define pontosHud @"pontosLabel"
#define vidasHud @"vidasLabel";

static const uint32_t eaterCategory     =  0x1 << 0;
static const uint32_t comidaCategory        =  0x1 << 1;
static const uint32_t maComidaCategory        =  0x1 << 2;

@implementation FoodDrop


@synthesize MView, eater, pontos, vidas, personagemCoreData, pontosLabel, vidasLabel, cenaMontada, inicio;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        cenaMontada = NO;
        inicio =[[SKSpriteNode alloc] initWithImageNamed:@"Cancela.png"];
        inicio.position = CGPointMake(CGRectGetMaxX(self.frame)/2, CGRectGetMaxY(self.frame)/2);
        [self addChild:inicio];

    }
    return self;
}

-(void) startGame {

    personagemCoreData = [[PersonagemCoreData alloc]init];
    
    self.physicsWorld.contactDelegate = self;
    
    self.backgroundColor = [SKColor whiteColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    //Atribuindo vidas
    vidas = 3;
    
    //Criando pac
    [self newPac];
    
    //Criando comidas
    SKAction *criarComidas = [SKAction sequence:@[[SKAction waitForDuration:1 withRange:2],[SKAction performSelector: @selector(addComida) onTarget:self],[SKAction waitForDuration:1 withRange:2]]];
    
    [self runAction:[SKAction repeatActionForever:criarComidas]];
    
    SKAction *criarMaComidas = [SKAction sequence:@[[SKAction waitForDuration:5 withRange:7],[SKAction performSelector: @selector(addMaComida) onTarget:self],[SKAction waitForDuration:5 withRange:7]]];
    
    [self runAction:[SKAction repeatActionForever:criarMaComidas]];
    
    NSLog(@"Vidas: %d", vidas);
    NSLog(@"Pontos: %d", pontos);

}


-(void) setHud{
    
    //Pontos
    pontosLabel =[[SKLabelNode alloc] initWithFontNamed:@"Courier"];
    pontosLabel.name = pontosHud;
    pontosLabel.fontSize = 25;
    pontosLabel.fontColor = [SKColor greenColor];
    
    pontosLabel.text = [NSString stringWithFormat:@"Pontos: %d", pontos];
    
    pontosLabel.position = CGPointMake(100,700);
    [self addChild:pontosLabel];
    
    //Vidas
    vidasLabel =[[SKLabelNode alloc] initWithFontNamed:@"Courier"];
    vidasLabel.name = pontosHud;
    vidasLabel.fontSize = 25;
    vidasLabel.fontColor = [SKColor redColor];
    
    vidasLabel.text = [NSString stringWithFormat:@"Vidas: %d", vidas];
    
    vidasLabel.position = CGPointMake(900,700);
    [self addChild:vidasLabel];

    
}

-(void) addComida{
    //Atribuindo textures randomicas
    NSArray *aTexturas = [[NSArray alloc] initWithObjects:@"frango.png",@"feijao.png",@"carne.png",@"milho.png",@"arroz.png",@"queijo.png",@"pimentão.png",@"cebola.png",@"berinjela.png",@"cenoura.png",@"alface.png",@"abobora.png",@"tomate3.png",@"uva.png",@"laranja.png",@"pera.png",@"cereja.png",@"morango.png",@"kiwi.png",@"manga.png",@"pessego.png",@"banana.png",@"limao.png",@"melancia.png",@"maca.png",@"pao.png", nil];
    
    int randomComida = (arc4random_uniform(5));
    
    NSString *newTextura =[[NSString alloc]initWithString: [aTexturas objectAtIndex:randomComida]];
    
    SKTexture *textura = [SKTexture textureWithImageNamed:newTextura];
    
    //iniciando Comida
    SKSpriteNode *comida = [[SKSpriteNode alloc] initWithTexture:textura];
    
    //random da posição da comida
    int minX = comida.size.width / 2;
    int maxX = self.frame.size.width - comida.size.width / 2;
    int rangeX = maxX - minX;
    int actualX = (arc4random_uniform(rangeX)) + minX;
    
    comida.position = CGPointMake(actualX, self.frame.size.height + comida.size.height/2);
    
    //add fisica
    comida.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:comida.size];
    comida.physicsBody.categoryBitMask = comidaCategory;
    comida.physicsBody.contactTestBitMask = eaterCategory;
    comida.physicsBody.usesPreciseCollisionDetection = YES;
    
    [self addChild:comida];
}
-(void) addMaComida{
    //Atribuindo textures randomicas
    NSArray *aTexturas = [[NSArray alloc] initWithObjects:@"bolinho.png",@"sorvete2.png",@"bolacha.png",@"refri.png",@"donut2.png",@"batatafrita.png",@"pizza.png",@"hamburguer.png", nil];
    
    int randomComida = (arc4random_uniform(8));
    
    NSString *newTextura =[[NSString alloc]initWithString: [aTexturas objectAtIndex:randomComida]];
    
    SKTexture *textura = [SKTexture textureWithImageNamed:newTextura];
    
    //iniciando Comida
    SKSpriteNode *maComida = [[SKSpriteNode alloc] initWithTexture:textura];
    
    //random da posição da comida
    int minX = maComida.size.width / 2;
    int maxX = self.frame.size.width - maComida.size.width / 2;
    int rangeX = maxX - minX;
    int actualX = (arc4random_uniform(rangeX)) + minX;
    
    maComida.position = CGPointMake(actualX, self.frame.size.height + maComida.size.height/2);
    
    //add fisica
    maComida.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:maComida.size];
    maComida.physicsBody.categoryBitMask = maComidaCategory;
    maComida.physicsBody.contactTestBitMask = eaterCategory;
    maComida.physicsBody.usesPreciseCollisionDetection = YES;
    
    [self addChild:maComida];

}

-(void) didSimulatePhysics {
    //Remove as comidas fora de tela
    [self enumerateChildNodesWithName:@"comida" usingBlock:^(SKNode *node, BOOL *stop) {
        if(node.position.y <0)
            [node removeFromParent];
    }];
    
}

-(SKSpriteNode *) newPac {
    
    Personagem *personagem = [personagemCoreData returnPersonagem];
    
    eater = [[SKSpriteNode alloc] initWithImageNamed:[NSString stringWithFormat:@"mascote%d_1.png", [[personagem tipo] intValue]]];
    eater.position = CGPointMake(CGRectGetMidX(self.frame), 100);
    
    eater.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:eater.size];
    eater.physicsBody.categoryBitMask = eaterCategory;
    eater.physicsBody.contactTestBitMask = comidaCategory;
    eater.physicsBody.collisionBitMask = 0;
    eater.physicsBody.usesPreciseCollisionDetection = YES;
    
    eater.physicsBody.dynamic = NO;
    
    [self addChild:eater];
    
    return eater;
}

-(void) didBeginContact: (SKPhysicsContact*) contact{
    SKPhysicsBody *firstBody, *secondBody;
    
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if ((firstBody.categoryBitMask & eaterCategory) != 0 &&
        (secondBody.categoryBitMask & comidaCategory) != 0)
    {
        pontos= pontos +10;
        NSLog(@"Pontos: %d", pontos);

        [secondBody.node removeFromParent];
    }
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if ((firstBody.categoryBitMask & eaterCategory) != 0 && (secondBody.categoryBitMask & maComidaCategory) != 0) {
        vidas--;
        NSLog(@"Vidas: %d", vidas);
        [secondBody.node removeFromParent];
        if (vidas < 1 ) {
            [self gameOver];
        }
    }
}

-(void) gameOver {
    
    self.scene.view.paused = YES;
    SKSpriteNode *over = [[SKSpriteNode alloc] initWithImageNamed:@"Confirma.png"];
    over.position = CGPointMake(CGRectGetMaxX(self.frame)/2, CGRectGetMaxY(self.frame)/2);
    [self addChild:over];
    
    Personagem *personagem = [personagemCoreData returnPersonagem];
    [personagemCoreData atualizarDinheiro: [[personagem dinheiro] intValue] + pontos];
    //NSNumber *novoDinheiro = [[NSNumber alloc]initWithInt:[[personagem dinheiro] intValue] + pontos ];
    //NSLog(@"%d", [novoDinheiro intValue]);
    //[personagem setDinheiro:novoDinheiro];
    
    [self.view removeFromSuperview];
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    [pontosLabel removeFromParent];
    [vidasLabel removeFromParent];
    
    [self setHud];
    

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    point = [touch locationInView: self.view];
    
            [eater setPosition:CGPointMake(point.x, eater.position.y)];




    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
            UITouch *touch = [touches anyObject];
    point = [touch locationInView:self.view];
    if (cenaMontada == NO) {

        [inicio removeFromParent];
        cenaMontada = YES;
        [self startGame];
    }

    
}

@end
