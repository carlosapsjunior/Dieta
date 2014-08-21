//
//  TutorialCoreData.h
//  Dieta
//
//  Created by RENAN GOMES on 21/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tutorial.h"

@interface TutorialCoreData : NSObject

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)iniciarCoreData;
- (void)mostraCoreData;
- (Tutorial*)returnTutorial;

-(void)intro02;

@end
