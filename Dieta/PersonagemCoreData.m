//
//  PersonagemCoreData.m
//  Dieta
//
//  Created by RENAN GOMES on 05/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "PersonagemCoreData.h"

@implementation PersonagemCoreData

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)iniciarCoreData: (int)tipo {
    if (![self coreDataIniciado]) {
        printf("Iniciou CoredData\n");
        Personagem *personagem = [NSEntityDescription insertNewObjectForEntityForName:@"Personagem" inManagedObjectContext:self.managedObjectContext];
    
        //[personagem setNome:nome];
        NSNumber *number = [[NSNumber alloc] initWithInt:tipo];
        [personagem setTipo:number];
        
        [self atualizarFome:25];
        [self atualizarSaude:75];
        [self atualizarDinheiro:5000];
    
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }
}

- (BOOL)coreDataIniciado {
    NSArray *fetchedRecords = [self pegaPersonagem];
    if ([fetchedRecords count] == 0)
        return NO;
    return YES;
}

- (void)mostraCoreData {
    NSArray *fetchedRecords = [self pegaPersonagem];
    Personagem *personagem;
    personagem = [fetchedRecords objectAtIndex:0];
    NSLog(@"%@, fome: %d, saude: %d",[personagem nome] , [[personagem fome] intValue], [[personagem saude]intValue]);
    printf("\nPersonagens: %d\n\n", [fetchedRecords count]);
}

- (Personagem*)returnPersonagem {
    NSArray *fetchedRecords = [self pegaPersonagem];
    Personagem *personagem;
    personagem = [fetchedRecords objectAtIndex:0];
    
    return personagem;
}

- (NSArray*)pegaPersonagem {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Personagem" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    NSError* error;

    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];

    return fetchedRecords;
}

- (void)atualizarFome: (float)quantidade {
    NSNumber *number = [[NSNumber alloc] initWithInt:quantidade];
    NSArray *fetchedRecords = [self pegaPersonagem];
    Personagem *personagem = [fetchedRecords objectAtIndex:0];
    
    [personagem setFome:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

- (void)atualizarSaude: (float)quantidade {
    NSNumber *number = [[NSNumber alloc] initWithInt:quantidade];
    NSArray *fetchedRecords = [self pegaPersonagem];
    Personagem *personagem = [fetchedRecords objectAtIndex:0];
    
    [personagem setSaude:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

- (void)atualizarDinheiro: (int)quantidade {
    NSNumber *number = [[NSNumber alloc] initWithInt:quantidade];
    NSArray *fetchedRecords = [self pegaPersonagem];
    Personagem *personagem = [fetchedRecords objectAtIndex:0];
    
    [personagem setDinheiro:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

//FUNCOES DO COREDATA

- (NSManagedObjectContext *) managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"ListaAlimentos.sqlite"]];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        /*Error for store creation should be handled in here*/
    }
    
    return _persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
