//
//  AlimentoView.m
//  Dieta
//
//  Created by RENAN GOMES on 22/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "AlimentoView.h"

@implementation AlimentoView

@synthesize grupoAlimento, grupoAux, imagem, nome, quantidade, valorPorcao, valorPorcaoAux, estaNaSuperView, imagemAlimento, circulo, quantidadeAlimentos, copia, preco;

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        self.estaNaSuperView = 0;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    circulo = [[UIImageView alloc ] initWithFrame:CGRectMake(80, 80, 48, 48)];
    [circulo setImage:[UIImage imageNamed:@"circulo.png"]];
    
    UIImageView *imageViewAlimento = [[UIImageView alloc] initWithImage:imagemAlimento];
    [imageViewAlimento setBounds:CGRectMake(11, 11, 128, 128)];
    
    quantidadeAlimentos = [[UILabel alloc] initWithFrame:CGRectMake(100, 95, 20, 20)];
    [quantidadeAlimentos setText:[quantidade stringValue]];
    [quantidadeAlimentos setTextColor:[UIColor whiteColor]];
    
    
    [self addSubview:imageViewAlimento];
    [self addSubview:circulo];
    [self addSubview:quantidadeAlimentos];
    
}

-(void)removeViews {
    
    [circulo removeFromSuperview];
    [quantidadeAlimentos removeFromSuperview];

}


@end
