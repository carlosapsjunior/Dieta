//
//  Receita.m
//  Dieta
//
//  Created by senac2012 on 05/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "Receita.h"

@implementation Receita

@synthesize nome, ingredientes;

- (id)init
{
    self = [super init];
    if (self) {
        
        ingredientes = [[NSMutableArray alloc]init];
    }
    return self;
    
}


-(void)adicionaIngrediente:(NSString *) nome :(UIImage *)image :(AVAudioPlayer *)som {
        
    Ingrediente *ingrediente = [[Ingrediente alloc] init];
    [ingrediente setNome: nome];
    [ingrediente setImagemAlimento:image];
    [ingrediente setSom: som];
    [ingredientes addObject:ingrediente];
    
}



@end
