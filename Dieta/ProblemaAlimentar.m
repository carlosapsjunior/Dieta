//
//  ProblemaAlimentar.m
//  Dieta
//
//  Created by RENAN GOMES on 14/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "ProblemaAlimentar.h"

@implementation ProblemaAlimentar

@synthesize grupoAlimentar, excedente;

-(NSString*) descricao {
    NSString *descricao;
    if (excedente)
        descricao = [grupoAlimentar descricaoExcedente];
    else
        descricao = [grupoAlimentar descricaoDeficiencia];
    
    return
    
    
    descricao;
}

@end
