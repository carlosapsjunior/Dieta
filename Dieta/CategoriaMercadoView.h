//
//  CategoriaMercadoView.h
//  Dieta
//
//  Created by senac2012 on 23/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorCoreData.h"
#import "AudioController.h"

@interface CategoriaMercadoView : UIView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property UICollectionView *collectionView;
@property NSArray *imagens;
@property GerenciadorCoreData *gerenciadorCoreData;
@property NSArray *todosAlimentos;
@property NSMutableArray *carrinho;
@property AudioController *audioController;
-(void)pegaAlimentosCategoria:(int)grupoAlimento;

@end
