//
//  CategoriaMercadoView.m
//  Dieta
//
//  Created by senac2012 on 23/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "CategoriaMercadoView.h"


@implementation CategoriaMercadoView
@synthesize collectionView, imagens, gerenciadorCoreData, todosAlimentos, carrinho, audioController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        gerenciadorCoreData = [[GerenciadorCoreData alloc]init];
        todosAlimentos = [gerenciadorCoreData selecionaAlimentoPorGrupo:1];
        
        carrinho = [[NSMutableArray alloc]init];
        
        //[self setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"fotojornalimo-ufc-416-editada5.jpg"]]];
        [self setBackgroundColor: [UIColor whiteColor]];
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(30, 30, 964, 560) collectionViewLayout:layout];
        [collectionView setBackgroundColor: [UIColor colorWithWhite:0 alpha:0]];
        //[collectionView setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"fotojornalimo-ufc-416-editada5.jpg"]]];
        [collectionView setDataSource:self];
        [collectionView setDelegate:self];
        [collectionView setBounces:NO];
        [collectionView setShowsHorizontalScrollIndicator:NO];
        
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        
        [self addSubview:collectionView];
        
        [self alocaAudioController];
    }
    return self;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(void)limpaCell:(UICollectionViewCell*)cell{
    for(UIView *v in [cell subviews]){
        [v removeFromSuperview];
    }
}

-(void)pegaAlimentosCategoria:(int)grupoAlimento{
    todosAlimentos = [gerenciadorCoreData selecionaAlimentoPorGrupo:grupoAlimento];
    [collectionView reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [todosAlimentos count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [self limpaCell:cell];
    
    Alimento *alimento = [todosAlimentos objectAtIndex:indexPath.row];
    AlimentoView *alimentoView = [self addAlimento:[alimento nome] imagem:[alimento imagem]];
    [cell addSubview:alimentoView];
    
    UIImageView *imgMoeda = [[UIImageView alloc] initWithFrame:CGRectMake(30, 144, 32, 32)];
    UIImage *moeda = [UIImage imageNamed:@"moeda2"];
    [imgMoeda setImage: moeda];
    [cell addSubview:imgMoeda];
    
    UILabel *preco = [[UILabel alloc] initWithFrame:CGRectMake(70, 128, 64, 64)];
    NSString *precoValue = [[NSString alloc] initWithFormat:@"%d", [[alimento preco] intValue]];
    [preco setText: precoValue];
    [preco setTextColor:[[UIColor alloc] initWithRed:245/255.0f green:195/255.0f blue:35/255.0f alpha:1.0f]];
    [preco setFont: [UIFont fontWithName:@"Arial-BoldMT" size:25.0]];
    [cell addSubview:preco];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180, 180);
}

-(void)compra:(UITapGestureRecognizer *)recognizer {
    AlimentoView *alimentoView = (AlimentoView *)recognizer.view;
    if ([[alimentoView quantidade] intValue] < 99) {
        [[audioController somClick]play];
        [self atualizarQuantidade:alimentoView];
    }
}

-(void)atualizarQuantidade: (AlimentoView*)alimento {
    NSNumber *quantidadeAlimento = [[NSNumber alloc]initWithInt:[[alimento quantidade] intValue] + 1];
    [alimento  setQuantidade:quantidadeAlimento];
    [[alimento quantidadeAlimentos] setText:[quantidadeAlimento stringValue]];
    
    [gerenciadorCoreData atualizarQuantidade:[[alimento quantidade] intValue] index:[alimento nome]];
    
    if ([[alimento quantidade] intValue] == 99) {
        [alimento setAlpha:0.5f];
    }
}

-(AlimentoView*)addAlimento: (NSString*)nome imagem: (NSString*) imagem {
    NSNumber *number;
    AlimentoView *alimentoView = [[AlimentoView alloc] initWithFrame:CGRectMake(26, 16, 128, 128)];
    [alimentoView setNome:nome];
    [alimentoView setImagemAlimento:[UIImage imageNamed:imagem]];
    [alimentoView setImagem:imagem];
    number = [[NSNumber alloc] initWithInt:[[gerenciadorCoreData pegaQuantidade:nome] intValue]];
    [alimentoView setQuantidade:number];
    
    if ([[alimentoView quantidade] intValue] == 99) {
        [alimentoView setAlpha:0.5f];
    }
    
    UITapGestureRecognizer *p = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(compra:)];
    [alimentoView addGestureRecognizer:p];
    
    return alimentoView;
}

-(void)alocaAudioController {
    audioController = [[AudioController alloc]init];
    [audioController alocaSons];
}

@end

