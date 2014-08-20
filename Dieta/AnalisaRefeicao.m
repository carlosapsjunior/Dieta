//
//  AnalisaRefeicao.m
//  Dieta
//
//  Created by Daniel Missima on 22/04/14.
//  Copyright (c) 2014 Daniel Missima. All rights reserved.
//

// {5, 3, 3, 3, 2, 3, 1, 1}

#import "AnalisaRefeicao.h"

@implementation AnalisaRefeicao
@synthesize  gruposAlimentos, refeicao, problemasAlimentares, gruposAlimentares;

-(id)initWithAlimentos:(NSArray *)alimentos{
    self = [super init];
    if (self) {
        gruposAlimentos = [[NSMutableArray alloc] initWithObjects:[[NSNumber alloc]initWithDouble:0],[[NSNumber alloc]initWithDouble:0],[[NSNumber alloc]initWithDouble:0],[[NSNumber alloc]initWithDouble:0],[[NSNumber alloc]initWithDouble:0],[[NSNumber alloc]initWithDouble:0],[[NSNumber alloc]initWithDouble:0],[[NSNumber alloc]initWithDouble:0], nil];
        refeicao = [[NSArray alloc]init];
        refeicao = alimentos;
        
        problemasAlimentares = [[NSMutableArray alloc]init];
        gruposAlimentares = [[NSMutableArray alloc]init];
        
        GrupoAlimentar *grupo;
        
        //Minimo: 19
        //Maximo: 29
        //Porcao: 3.45
        
        grupo = [[GrupoAlimentar alloc]initWithNome:@"Cereais" porcaoIdeal:5];
        [grupo setDescricaoExcedente:@"Você está comendo muitos cereais, eles são bons para o intestino, mas em excesso eles podem engordar."];
        [grupo setDescricaoDeficiencia:@"Coma mais cereais, eles contém muitas fibras, que são importantes para o funcionamento do seu intestino."];
        [gruposAlimentares addObject:grupo];
        
        grupo = [[GrupoAlimentar alloc]initWithNome:@"Frutas" porcaoIdeal:3];
        [grupo setDescricaoExcedente:@"Você está comendo muitas frutas, elas são ricas fontes de vitamina mas contém açucar também."];
        [grupo setDescricaoDeficiencia:@"Coma mais frutas, elas são ricas em vitaminas importantes para a sua saúde."];
        [gruposAlimentares addObject:grupo];
        
        grupo = [[GrupoAlimentar alloc]initWithNome:@"Hortaliças" porcaoIdeal:3];
        [grupo setDescricaoExcedente:nil];
        [grupo setDescricaoDeficiencia:@"Coma mais salada, eles contém muitas fibras, que são importantes para o funcionamento do seu intestino."];
        [gruposAlimentares addObject:grupo];
        
        grupo = [[GrupoAlimentar alloc]initWithNome:@"Leguminosas" porcaoIdeal:3];
        [grupo setDescricaoExcedente:nil];
        [grupo setDescricaoDeficiencia:@"Coma mais legumes, eles são fontes de nutrientes, vitaminas e proteínas."];
        [gruposAlimentares addObject:grupo];
        
        grupo = [[GrupoAlimentar alloc]initWithNome:@"Carnes" porcaoIdeal:2];
        [grupo setDescricaoExcedente:@"Você está comendo muita carne, elas são ótimas para os músculos mas também tem muita gordura."];
        [grupo setDescricaoDeficiencia:@"Coma mais carnes, é muito importante para o crescimento dos seus músculos."];
        [gruposAlimentares addObject:grupo];
        
        grupo = [[GrupoAlimentar alloc]initWithNome:@"Derivados" porcaoIdeal:3];
        [grupo setDescricaoExcedente:@"Você está comendo muitos derivados de leite, eles são ótimas para os ossos mas também tem muita gordura."];
        [grupo setDescricaoDeficiencia:@"Coma mais derivados de leite, eles te ajudam a crescer e ter ossos mais fortes."];
        [gruposAlimentares addObject:grupo];
        
        grupo = [[GrupoAlimentar alloc]initWithNome:@"Doces" porcaoIdeal:1];
        [grupo setDescricaoExcedente:@"Você está comendo muitos doces, eles são ricos em açúcar e gordura e engordam"];
        [grupo setDescricaoDeficiencia:nil];
        [gruposAlimentares addObject:grupo];
        
        grupo = [[GrupoAlimentar alloc]initWithNome:@"Gorduras" porcaoIdeal:1];
        [grupo setDescricaoExcedente:@"Você está comendo muita gordura, isso pode fazer mal ao seu coração"];
        [grupo setDescricaoDeficiencia:nil];
        [gruposAlimentares addObject:grupo];
        
        [self defineGrupos];
        //[self verifica];
    }
    return self;
}

-(void)defineGrupos {
    for(AlimentoView *a in refeicao) {
        
        double porcao = [[gruposAlimentos objectAtIndex:([[a grupoAlimento] intValue] - 1)] doubleValue];
        [gruposAlimentos replaceObjectAtIndex:([[a grupoAlimento] intValue] - 1)  withObject:[[NSNumber alloc]initWithDouble:porcao + [[a valorPorcao] floatValue]]];
        
        if ([[a grupoAux] intValue] > 0) {
            porcao = [[gruposAlimentos objectAtIndex:([[a grupoAux] intValue] - 1)] doubleValue];
            [gruposAlimentos replaceObjectAtIndex:([[a grupoAux] intValue] - 1)  withObject:[[NSNumber alloc]initWithDouble:porcao + [[a valorPorcaoAux] floatValue]]];
        }
    }
}

-(void)verifica {
    for (int i = 0; i < [gruposAlimentos count]; i++) {
        if ([[gruposAlimentos objectAtIndex:i] doubleValue] > [[gruposAlimentares objectAtIndex:i] porcaoIdeal]) {
            ProblemaAlimentar *problema = [[ProblemaAlimentar alloc]init];
            [problema setGrupoAlimentar:[gruposAlimentares objectAtIndex:i]];
            [problema setExcedente:YES];
            [problemasAlimentares addObject:problema];
        }
        if ([[gruposAlimentos objectAtIndex:i] doubleValue] < [[gruposAlimentares objectAtIndex:i] porcaoIdeal]) {
            ProblemaAlimentar *problema = [[ProblemaAlimentar alloc]init];
            [problema setGrupoAlimentar:[gruposAlimentares objectAtIndex:i]];
            [problema setExcedente:NO];
            [problemasAlimentares addObject:problema];
        }
    }
}

-(float)verificaSaude {
    float value = 0;
    for (int i = 0; i < [gruposAlimentos count]; i++) {
        if ([[gruposAlimentos objectAtIndex:i] doubleValue] > [[gruposAlimentares objectAtIndex:i] porcaoIdeal]) {
            value -= 6.9 * ([[gruposAlimentos objectAtIndex:i] doubleValue] - [[gruposAlimentares objectAtIndex:i] porcaoIdeal]);
        }
    }
    return value;
}

-(NSMutableArray *)geraDialogo {
    NSString *texto;
    NSMutableArray *dialogo = [[NSMutableArray alloc]init];
    for (int i = 0; i < [problemasAlimentares count]; i++) {
        texto = [[problemasAlimentares objectAtIndex:i] descricao];
        if (texto != nil) {
            [dialogo addObject:texto];
        }
    }
    return dialogo;
}

@end
