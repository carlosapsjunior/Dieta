//
//  GrupoAlimentar.m
//  Dieta
//
//  Created by RENAN GOMES on 14/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "GrupoAlimentar.h"

@implementation GrupoAlimentar

@synthesize nome, porcaoIdeal, descricaoExcedente, descricaoDeficiencia;

- (id)initWithNome: (NSString*)inNome porcaoIdeal: (int)inPorcaoIdeal {
    self = [super init];
    if(self) {
        nome = inNome;
        porcaoIdeal = inPorcaoIdeal;
    }
    return self;
}

@end
