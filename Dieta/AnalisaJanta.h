//
//  NSObject+AnalisaJanta.h
//  Dieta
//
//  Created by Daniel Missima Teodoro on 08/10/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlimentoView.h"
#import "GrupoAlimentar.h"
#import "ProblemaAlimentar.h"

@interface AnalisaJanta : NSObject

@property NSArray *refeicao;
@property NSMutableArray *gruposAlimentos;
@property NSMutableArray *problemasAlimentares;
@property NSMutableArray *gruposAlimentares;

-(id)initWithAlimentos:(NSArray *)alimentos;
-(NSMutableArray *)geraDialogo;
-(void)defineGrupos;
-(void)verifica;
-(float)verificaSaude;

@end
