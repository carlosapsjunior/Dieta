//
//  Personagem.h
//  Dieta
//
//  Created by RENAN GOMES on 05/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Personagem : NSManagedObject

@property (nonatomic, retain) NSNumber * dinheiro;
@property (nonatomic, retain) NSNumber * fome;
@property (nonatomic, retain) NSNumber * saude;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * tipo;

@end
