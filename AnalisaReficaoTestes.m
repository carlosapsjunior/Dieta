//
//  AnalisaRefeicaoTests.m
//  Dieta
//
//  Created by RENAN GOMES on 16/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AnalisaRefeicao.h"
#import "AlimentoView.h"

@interface AnalisaRefeicaoTestes : XCTestCase
@property AnalisaRefeicao *analisa;
@end

@implementation AnalisaRefeicaoTestes
@synthesize analisa;

- (void)setUp
{
    [super setUp];
    analisa = [[AnalisaRefeicao alloc] initWithAlimentos:nil];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testeInit {
    
    XCTAssertNil([analisa refeicao], @"Deveria ser nil");
    XCTAssertNotNil([analisa problemasAlimentares], @"Deveria não ser nulo");
    XCTAssertTrue([[analisa gruposAlimentos] count] == 8, @"Deveria conter 8");
    XCTAssertTrue([[analisa gruposAlimentares] count] == 8, @"Deveria conter 8");
}

- (void)testeDefineGrupos {
    AlimentoView *alimento = [[AlimentoView alloc] init];
    [alimento setNome:@"queijo"];
    NSNumber *number;
    number = [[NSNumber alloc] initWithInt:6];
    [alimento setGrupoAlimento:number];
    number = [[NSNumber alloc] initWithInt:8];
    [alimento setGrupoAux:number];
    number = [[NSNumber alloc] initWithInt:1];
    [alimento setValorPorcao:number];
    number = [[NSNumber alloc] initWithFloat:0.5];
    [alimento setValorPorcaoAux:number];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [array addObject:alimento];
    [array addObject:alimento];
    [array addObject:alimento];
    
    analisa = [[AnalisaRefeicao alloc] initWithAlimentos:array];
    
    XCTAssertTrue([[[analisa gruposAlimentos] objectAtIndex:5] floatValue] == 3, @"Deveria ser 3");
    XCTAssertTrue([[[analisa gruposAlimentos] objectAtIndex:7] floatValue] == 1.5, @"Deveria ser 1,5");
}

- (void)testeVerifica {
    
    XCTAssertTrue([[analisa problemasAlimentares] count] == 8, @"Gera 8 problemas");
}


-(void)testeGeraDialogo{
    
    XCTAssertTrue([[analisa geraDialogo]count] != 0, @"Não gerou dialogo");
}


@end
