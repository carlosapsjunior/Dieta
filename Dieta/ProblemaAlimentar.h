//
//  ProblemaAlimentar.h
//  Dieta
//
//  Created by RENAN GOMES on 14/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GrupoAlimentar.h"


@interface ProblemaAlimentar : NSObject

@property GrupoAlimentar *grupoAlimentar;
@property BOOL excedente;

-(NSString*) descricao;

@end
