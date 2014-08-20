//
//  ProblemaAlimentar.m
//  Dieta
//
//  Created by RENAN GOMES on 16/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ProblemaAlimentar.h"

@interface ProblemaAlimentarTestes : XCTestCase

@property ProblemaAlimentar *problema;

@end

@implementation ProblemaAlimentarTestes
@synthesize problema;

- (void)setUp
{
    [super setUp];
    problema = [[ProblemaAlimentar alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testeDescricao{
    
    [problema descricao];
    //XCTAssertNotEqual( [problema descricao], @"", @"Descriçao vazia" );
    
    XCTAssertFalse([[problema descricao] isEqualToString:@""], @"Não gerou dialogo");
    
}


@end
