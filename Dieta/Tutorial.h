//
//  Tutorial.h
//  Dieta
//
//  Created by RENAN GOMES on 21/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Tutorial : NSManagedObject

@property (nonatomic, retain) NSNumber *intro01;
@property (nonatomic, retain) NSNumber *intro02;
@property (nonatomic, retain) NSNumber *mercado01;
@property (nonatomic, retain) NSNumber *mercado02;
@property (nonatomic, retain) NSNumber *panela01;
@property (nonatomic, retain) NSNumber *panela02;
@property (nonatomic, retain) NSNumber *prato01;
@property (nonatomic, retain) NSNumber *prato02;

@end
