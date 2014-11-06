//
//  GerenciadorCoreData.m
//  Dieta
//
//  Created by RENAN GOMES on 20/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "GerenciadorCoreData.h"

@implementation GerenciadorCoreData

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

@synthesize listaAlimentosCoreData;

-(void)iniciaCoreData {
    if (![self coreDataIniciado]) {
        printf("Iniciou CoredData\n");
        listaAlimentosCoreData = [[NSMutableArray alloc]init];
        [self inicializaAlimentos];
        for (int i = 0; i < [listaAlimentosCoreData count]; i++) {
            Alimento *alimento = [NSEntityDescription insertNewObjectForEntityForName:@"Alimento" inManagedObjectContext:self.managedObjectContext];
            AlimentoView *referencia = [listaAlimentosCoreData objectAtIndex:i];
            
            NSLog(@"%@", [referencia nome]);
            
            [alimento setNome:[referencia nome]];
            [alimento setGrupoAlimento:[referencia grupoAlimento]];
            [alimento setValorPorcao:[referencia valorPorcao]];
            [alimento setGrupoAux:[referencia grupoAux]];
            [alimento setValorPorcaoAux:[referencia valorPorcaoAux]];
            [alimento setQuantidade:[referencia quantidade]];
            [alimento setImagem:[referencia imagem]];
            [alimento setPreco:[referencia preco]];

            NSError *error;
            if (![self.managedObjectContext save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }
        }
    }
}

-(BOOL)coreDataIniciado {
    NSArray *fetchedRecords = [self pegaTodosAlimentos];
    if ([fetchedRecords count] == 0)
        return NO;
    return YES;
}

-(NSNumber*)pegaQuantidade: (NSString*)nome {
    Alimento *alimento = [self buscaAlimento:nome];
    if (alimento != nil) {
        return [alimento quantidade];
    }
    NSNumber *quantidade = [[NSNumber alloc]initWithInt:5];
    return quantidade;
}

-(void)mostraCoreData {
    NSArray *fetchedRecords = [self pegaTodosAlimentos];
    Alimento *alimento;
    for (int i = 0; i < [fetchedRecords count]; i++) {
        alimento = [fetchedRecords objectAtIndex:i];
        NSLog(@"%@, %d",[alimento nome] , [[alimento quantidade] intValue]);
    }
    printf("\n%d\n\n", [fetchedRecords count]);
}

-(NSArray*)pegaTodosAlimentos {
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Alimento" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    // Returning Fetched Records
    return fetchedRecords;
}

-(Alimento*)buscaAlimento: (NSString*)nome {
    NSArray *fetchedRecords = [self pegaTodosAlimentos];
    Alimento *alimento;
    for (int i = 0; i < [fetchedRecords count]; i++) {
        alimento = [fetchedRecords objectAtIndex:i];
        if ([nome isEqualToString:[alimento nome]]) {
            return alimento;
        }
    }
    return nil;
}

-(NSArray*)selecionaAlimentoPorGrupo: (int)grupo {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Alimento" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicateID = [NSPredicate predicateWithFormat:@"grupoAlimento == %d",grupo];
    [fetchRequest setPredicate:predicateID];
    
    NSError* error;
    
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return fetchedRecords;
    
}

- (void)atualizarQuantidade: (int)quantidade index: (NSString*)nome {
    NSNumber *number = [[NSNumber alloc] initWithInt:quantidade];
    Alimento *alimento = [self buscaAlimento:nome];
    
    [alimento setQuantidade:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(void)incrementaQuantidade: (NSString*)nome {
    Alimento *alimento = [self buscaAlimento:nome];
    if ([[alimento quantidade] intValue] < 99) {
        NSNumber *number = [[NSNumber alloc] initWithInt:([[alimento quantidade] intValue] + 1)];
        [alimento setQuantidade:number];
        
        NSError *error;
        if (![_managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }
}

-(void)decrementaQuantidade: (NSString*)nome {
    Alimento *alimento = [self buscaAlimento:nome];
    NSNumber *number = [[NSNumber alloc] initWithInt:([[alimento quantidade] intValue] - 1)];
    [alimento setQuantidade:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(void)addAlimento: (NSString*)nome imagem: (NSString*) imagem grupo: (int)grupo grupoAux: (int)grupoAux porcao:(double)valorPorcao porcaoAux:(double)valorPorcaoAux preco: (int)preco {
    NSNumber *number;
    AlimentoView *alimentoView = [[AlimentoView alloc] init];
    [alimentoView setNome:nome];
    [alimentoView setImagemAlimento:[UIImage imageNamed:imagem]];
    [alimentoView setImagem:imagem];
    number = [[NSNumber alloc] initWithInt:grupo];
    [alimentoView setGrupoAlimento:number];
    number = [[NSNumber alloc] initWithInt:grupoAux];
    [alimentoView setGrupoAux:number];
    number = [[NSNumber alloc] initWithFloat:valorPorcao];
    [alimentoView setValorPorcao:number];
    number = [[NSNumber alloc] initWithFloat:valorPorcaoAux];
    [alimentoView setValorPorcaoAux:number];
    number = [[NSNumber alloc] initWithInt:[[self pegaQuantidade:nome] intValue]];
    [alimentoView setQuantidade:number];
    number = [[NSNumber alloc] initWithInt:preco];
    [alimentoView setPreco:number];
    
    [listaAlimentosCoreData addObject:alimentoView];
}

-(void)inicializaAlimentos {
    //Cereais, pães, tubérculos, raízes e massas
    [self addAlimento:@"pão" imagem:@"pao.png" grupo:1 grupoAux:0 porcao:2 porcaoAux:0 preco:2];
    [self addAlimento:@"arroz" imagem:@"arroz.png" grupo:1 grupoAux:0 porcao:0.5 porcaoAux:0 preco:1];
    [self addAlimento:@"farinha" imagem:@"farinha.png" grupo:1 grupoAux:0 porcao:1 porcaoAux:0 preco:3];
    
    //Açúcares e doces
    [self addAlimento:@"bolacha" imagem:@"bolacha.png" grupo:7 grupoAux:1 porcao:0.5 porcaoAux:0.34 preco:4];
    [self addAlimento:@"bolinho" imagem:@"bolinho.png" grupo:7 grupoAux:0 porcao:1 porcaoAux:0 preco:13];
    [self addAlimento:@"sorvete" imagem:@"sorvete2.png" grupo:7 grupoAux:0 porcao:1 porcaoAux:0 preco:15];
    [self addAlimento:@"donut" imagem:@"donut2.png" grupo:7 grupoAux:0 porcao:1 porcaoAux:0 preco:16];
    [self addAlimento:@"cupcake" imagem:@"cupcake.png" grupo:7 grupoAux:0 porcao:1 porcaoAux:0 preco:10];
    [self addAlimento:@"refrigerante" imagem:@"refrigerante.png" grupo:7 grupoAux:0 porcao:1 porcaoAux:0 preco:5];
    
    //Hortaliças
    [self addAlimento:@"alface" imagem:@"alface.png" grupo:3 grupoAux:0 porcao:0.125 porcaoAux:0 preco:7];
    [self addAlimento:@"cenoura" imagem:@"cenoura.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:6];
    [self addAlimento:@"cebola" imagem:@"cebola.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:9];
    [self addAlimento:@"berinjela" imagem:@"berinjela.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:11];
    [self addAlimento:@"pimentao" imagem:@"pimentao.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:13];
    [self addAlimento:@"feijão" imagem:@"feijao.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:1];
    [self addAlimento:@"milho" imagem:@"milho.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:13];
    [self addAlimento:@"brocolis" imagem:@"brocolis.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:7];
    [self addAlimento:@"ervilha" imagem:@"ervilha.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:3];
    
    //Frutas
    [self addAlimento:@"maça" imagem:@"maca.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:3];
    [self addAlimento:@"laranja" imagem:@"laranja.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:4];
    [self addAlimento:@"cereja" imagem:@"cereja.png" grupo:2 grupoAux:0 porcao:0.2 porcaoAux:0 preco:2];
    [self addAlimento:@"kiwi" imagem:@"kiwi.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:5];
    [self addAlimento:@"morango" imagem:@"morango.png" grupo:2 grupoAux:0 porcao:0.112 porcaoAux:0 preco:1];
    [self addAlimento:@"pessego" imagem:@"pessego.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:5];
    [self addAlimento:@"melancia" imagem:@"melancia.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:8];
    [self addAlimento:@"banana" imagem:@"banana.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:4];
    [self addAlimento:@"manga" imagem:@"manga.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:7];
    [self addAlimento:@"pera" imagem:@"pera.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:5];
    [self addAlimento:@"limao" imagem:@"limao.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:6];
    [self addAlimento:@"tomate" imagem:@"tomate3.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:8];
    [self addAlimento:@"uva" imagem:@"uva.png" grupo:2 grupoAux:0 porcao:0.1 porcaoAux:0 preco:10];
    [self addAlimento:@"abobora" imagem:@"abobora.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:12];
    
    //Leite e derivados
    [self addAlimento:@"queijo" imagem:@"queijo.png" grupo:6 grupoAux:8 porcao:1 porcaoAux:0.5 preco:7];
    [self addAlimento:@"leite" imagem:@"leite.png" grupo:6 grupoAux:0 porcao:1 porcaoAux:0 preco:3];
    [self addAlimento:@"danone" imagem:@"danone.png" grupo:6 grupoAux:0 porcao:1 porcaoAux:0 preco:5];
    
    //Carnes e ovos
    [self addAlimento:@"carne" imagem:@"carne.png" grupo:5 grupoAux:0 porcao:2 porcaoAux:0 preco:9];
    [self addAlimento:@"frango" imagem:@"frango.png" grupo:5 grupoAux:0 porcao:2 porcaoAux:0 preco:11];
    [self addAlimento:@"ovo" imagem:@"ovo.png" grupo:5 grupoAux:0 porcao:1 porcaoAux:0 preco:6];
    [self addAlimento:@"peixe" imagem:@"peixe.png" grupo:5 grupoAux:0 porcao:1 porcaoAux:0 preco:10];
    [self addAlimento:@"burguer" imagem:@"burg.png" grupo:5 grupoAux:0 porcao:1 porcaoAux:0 preco:7];
    
    //Leguminosas

    
    //Óledos e gorduras
    [self addAlimento:@"hamburger" imagem:@"hamburguer.png" grupo:8 grupoAux:0 porcao:1 porcaoAux:0 preco:26];
    [self addAlimento:@"batata frita" imagem:@"batatafrita.png" grupo:8 grupoAux:1 porcao:1 porcaoAux:1 preco:13];
    [self addAlimento:@"pizza" imagem:@"pizza.png" grupo:8 grupoAux:0 porcao:1 porcaoAux:0 preco:29];
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
