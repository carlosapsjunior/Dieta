//
//  Alimento.h
//  Dieta
//
//  Created by RENAN GOMES on 23/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Alimento : NSManagedObject

@property (nonatomic, retain) NSNumber *grupoAlimento;
@property (nonatomic, retain) NSNumber *grupoAux;
@property (nonatomic, retain) NSString *imagem;
@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSNumber *preco;
@property (nonatomic, retain) NSNumber *quantidade;
@property (nonatomic, retain) NSNumber *valorPorcao;
@property (nonatomic, retain) NSNumber *valorPorcaoAux;

@end
