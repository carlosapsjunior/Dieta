//
//  AlimentoView.h
//  Dieta
//
//  Created by RENAN GOMES on 22/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlimentoView : UIView

@property (nonatomic, retain) NSNumber *grupoAlimento;
@property (nonatomic, retain) NSNumber *grupoAux;
@property (nonatomic, retain) NSString *imagem;
@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSNumber *preco;
@property (nonatomic, retain) NSNumber *quantidade;
@property (nonatomic, retain) NSNumber *valorPorcao;
@property (nonatomic, retain) NSNumber *valorPorcaoAux;
@property AlimentoView *copia;

@property UIImage *imagemAlimento;
@property int estaNaSuperView;

@property UIImageView *circulo;
@property UILabel *quantidadeAlimentos;

-(void)removeViews;

@end
