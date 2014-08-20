//
//  GerenciadorCoreData.h
//  Dieta
//
//  Created by RENAN GOMES on 20/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Alimento.h"
#import "AlimentoView.h"

@interface GerenciadorCoreData : NSObject

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property NSMutableArray *listaAlimentosCoreData;

-(void)iniciaCoreData;
-(void)mostraCoreData;
-(NSArray*)pegaTodosAlimentos;
-(Alimento*)buscaAlimento: (NSString*)nome;
-(void)atualizarQuantidade: (int)quantidade index: (NSString*)nome;
-(void)incrementaQuantidade: (NSString*)nome;
-(void)decrementaQuantidade: (NSString*)nome;
-(BOOL)coreDataIniciado;
-(NSNumber*)pegaQuantidade: (NSString*)nome;
-(NSArray*)selecionaAlimentoPorGrupo: (int)grupo;

@end
