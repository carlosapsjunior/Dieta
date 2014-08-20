//
//  GrupoAlimentar.h
//  Dieta
//
//  Created by RENAN GOMES on 14/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GrupoAlimentar : NSObject

@property NSString *nome;
@property int porcaoIdeal;
@property NSString *descricaoExcedente;
@property NSString *descricaoDeficiencia;

- (id)initWithNome: (NSString*)inNome porcaoIdeal: (int)inPorcaoIdeal;

@end
