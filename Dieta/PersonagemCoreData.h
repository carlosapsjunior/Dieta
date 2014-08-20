//
//  PersonagemCoreData.h
//  Dieta
//
//  Created by RENAN GOMES on 05/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Personagem.h"

@interface PersonagemCoreData : NSObject

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)iniciarCoreData: (int)tipo;
- (void)mostraCoreData;
- (void)atualizarFome: (float)quantidade;
- (void)atualizarSaude: (float)quantidade;
- (void)atualizarDinheiro: (int)quantidade;
- (Personagem*)returnPersonagem;
- (BOOL)coreDataIniciado;

@end
