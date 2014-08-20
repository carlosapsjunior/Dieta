//
//  AnalisaRefeicao.h
//  Dieta
//
//  Created by senac2012 on 22/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlimentoView.h"
#import "GrupoAlimentar.h"
#import "ProblemaAlimentar.h"

@interface AnalisaRefeicao : NSObject

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
