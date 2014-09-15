//
//  Receita.h
//  Dieta
//
//  Created by senac2012 on 05/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Ingrediente.h"

@interface Receita : NSObject

@property NSString *nome;
@property UIImage *imagemReceita;
@property NSMutableArray *ingredientes;



-(void)adicionaIngrediente:(NSString *) nome :(UIImage *)image :(AVAudioPlayer *)som;


@end
