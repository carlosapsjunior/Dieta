//
//  TutorialCoreData.m
//  Dieta
//
//  Created by RENAN GOMES on 21/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "TutorialCoreData.h"

@implementation TutorialCoreData

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)iniciarCoreData {
    if (![self coreDataIniciado]) {
        Tutorial *tutorial = [NSEntityDescription insertNewObjectForEntityForName:@"Tutorial" inManagedObjectContext:self.managedObjectContext];
        NSNumber *number = [[NSNumber alloc] initWithInt:0];
        
        [tutorial setIntro01:number];
        [tutorial setIntro02:number];
        [tutorial setMercado01:number];
        [tutorial setMercado02:number];
        [tutorial setPanela01:number];
        [tutorial setPanela01:number];
        [tutorial setPrato01:number];
        [tutorial setPrato02:number];
        
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }
}

- (void)mostraCoreData {
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial;
    tutorial = [fetchedRecords objectAtIndex:0];
    NSLog(@"intro01: %d, intro2: %d, mercado01: %d, mercado02: %d, panela01: %d, panela02: %d, prato01: %d, prato02: %d",[[tutorial intro01] intValue] , [[tutorial intro02] intValue], [[tutorial mercado01] intValue], [[tutorial mercado02] intValue], [[tutorial panela01] intValue], [[tutorial panela02] intValue], [[tutorial prato01] intValue], [[tutorial prato02] intValue]);
    printf("\nPersonagens: %d\n\n", [fetchedRecords count]);
}

- (BOOL)coreDataIniciado {
    NSArray *fetchedRecords = [self pegaTutorial];
    if ([fetchedRecords count] == 0)
        return NO;
    return YES;
}

- (NSArray*)pegaTutorial {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tutorial" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    NSError* error;
    
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return fetchedRecords;
}

- (Tutorial*)returnTutorial {
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial;
    tutorial = [fetchedRecords objectAtIndex:0];
    
    return tutorial;
}

-(void)intro02 {
    NSNumber *number = [[NSNumber alloc] initWithInt:1];
    
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial = [fetchedRecords objectAtIndex:0];
    
    [tutorial setIntro02:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(void)mercado01 {
    NSNumber *number = [[NSNumber alloc] initWithInt:1];
    
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial = [fetchedRecords objectAtIndex:0];
    
    [tutorial setMercado01:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(void)mercado02 {
    NSNumber *number = [[NSNumber alloc] initWithInt:1];
    
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial = [fetchedRecords objectAtIndex:0];
    
    [tutorial setMercado02:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(void)panela01 {
    NSNumber *number = [[NSNumber alloc] initWithInt:1];
    
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial = [fetchedRecords objectAtIndex:0];
    
    [tutorial setPanela01:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(void)panela02 {
    NSNumber *number = [[NSNumber alloc] initWithInt:1];
    
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial = [fetchedRecords objectAtIndex:0];
    
    [tutorial setPanela02:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(void)prato01 {
    NSNumber *number = [[NSNumber alloc] initWithInt:1];
    
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial = [fetchedRecords objectAtIndex:0];
    
    [tutorial setPrato01:number];
    
    NSError *error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(void)prato02 {
    NSNumber *number = [[NSNumber alloc] initWithInt:1];
    
    NSArray *fetchedRecords = [self pegaTutorial];
    Tutorial *tutorial = [fetchedRecords objectAtIndex:0];
    
    [tutorial setPrato02:number];
    
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
