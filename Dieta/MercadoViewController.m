//
//  MercadoViewController.m
//  Dieta
//
//  Created by senac2012 on 22/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "MercadoViewController.h"
#import "MascoteViewController.h"

@interface MercadoViewController ()

@end

@implementation MercadoViewController
@synthesize btnAcucaresView,btnCarnesFrangoPeixesOvosView,btnFrutasView,btnLeguminosasView,btnLeitesQueijosIorgutesView,btnOleosGordurasView,btnPaosCereaisTuberculosRaizesView,btnVerdurasLegumesHortalicasView, collectionView, imagens, gerenciadorCoreData, personagemCoreData,todosAlimentos, carrinho, audioController, dinheiro, personagem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    gerenciadorCoreData = [[GerenciadorCoreData alloc]init];
    todosAlimentos = [gerenciadorCoreData selecionaAlimentoPorGrupo:1];
    
    personagemCoreData = [[PersonagemCoreData alloc]init];
    personagem = [personagemCoreData returnPersonagem];
    
    NSString *dindin = [NSString stringWithFormat:@"%d", [[personagem dinheiro] intValue]];
    [dinheiro setText:dindin];
    
    carrinho = [[NSMutableArray alloc]init];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 300, 1024, 355) collectionViewLayout:layout];
    [collectionView setBackgroundColor: [UIColor colorWithWhite:0 alpha:0]];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    [collectionView setBounces:NO];
    [collectionView setShowsHorizontalScrollIndicator:NO];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    [self.view addSubview:collectionView];
    
    [self alocaAudioController];
    
    [btnAcucaresView addTarget:self action:@selector(mudaViewMercado:) forControlEvents:UIControlEventTouchUpInside];
    [btnCarnesFrangoPeixesOvosView addTarget:self action:@selector(mudaViewMercado:) forControlEvents:UIControlEventTouchUpInside];
    [btnFrutasView addTarget:self action:@selector(mudaViewMercado:) forControlEvents:UIControlEventTouchUpInside];
    [btnLeguminosasView addTarget:self action:@selector(mudaViewMercado:) forControlEvents:UIControlEventTouchUpInside];
    [btnLeitesQueijosIorgutesView addTarget:self action:@selector(mudaViewMercado:) forControlEvents:UIControlEventTouchUpInside];
    [btnOleosGordurasView addTarget:self action:@selector(mudaViewMercado:) forControlEvents:UIControlEventTouchUpInside];
    [btnPaosCereaisTuberculosRaizesView addTarget:self action:@selector(mudaViewMercado:) forControlEvents:UIControlEventTouchUpInside];
    [btnVerdurasLegumesHortalicasView addTarget:self action:@selector(mudaViewMercado:) forControlEvents:UIControlEventTouchUpInside];

}

- (IBAction)fechaView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}



-(void)mudaViewMercado:(id)sender{
    UIButton *btn = (UIButton*)sender;
    
    switch ([btn tag]) {
        case 1:
            [self pegaAlimentosCategoria:1];
            break;
        case 2:
            [self pegaAlimentosCategoria:2];
            break;
        case 3:
            [self pegaAlimentosCategoria:3];
            break;
        case 4:
            [self pegaAlimentosCategoria:4];
            break;
        case 5:
            [self pegaAlimentosCategoria:5];
            break;
        case 6:
            [self pegaAlimentosCategoria:6];
            break;
        case 7:
            [self pegaAlimentosCategoria:7];
            break;
        case 8:
            [self pegaAlimentosCategoria:8];
            break;
        default:
            break;
    }
    
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
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [self limpaCell:cell];
    
    Alimento *alimento = [todosAlimentos objectAtIndex:indexPath.row];
    AlimentoView *alimentoView = [self addAlimento:[alimento nome] imagem:[alimento imagem] preco:[[alimento preco] intValue]];
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
    if ([[alimentoView quantidade] intValue] < 99 && [[personagem dinheiro] intValue] >= [[alimentoView preco] intValue]) {
        [[audioController somClick]play];
        [self atualizarQuantidade:alimentoView];
        int valor = [[personagem dinheiro] intValue] - [[alimentoView preco] intValue];
        [[self personagemCoreData] atualizarDinheiro:valor];
        [[self dinheiro] setText:[NSString stringWithFormat:@"%d", valor]];
        [self atualizarVenda];
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

-(void)atualizarVenda {
    for(UICollectionViewCell *cell in self.collectionView.subviews) {
        for (AlimentoView *alimento in cell.subviews) {
            if([alimento isKindOfClass:[AlimentoView class]]) {
                if ([[personagem dinheiro] intValue] < [[alimento preco] intValue]) {
                    [alimento setAlpha:0.5f];
                }
            }
        }
    }
}

-(AlimentoView*)addAlimento: (NSString*)nome imagem: (NSString*)imagem preco: (int)preco {
    NSNumber *number;
    AlimentoView *alimentoView = [[AlimentoView alloc] initWithFrame:CGRectMake(26, 16, 128, 128)];
    [alimentoView setNome:nome];
    [alimentoView setImagemAlimento:[UIImage imageNamed:imagem]];
    [alimentoView setImagem:imagem];
    number = [[NSNumber alloc] initWithInt:[[gerenciadorCoreData pegaQuantidade:nome] intValue]];
    [alimentoView setQuantidade:number];
    number = [[NSNumber alloc] initWithInt:preco];
    [alimentoView setPreco:number];
    
    if ([[alimentoView quantidade] intValue] == 99) {
        [alimentoView setAlpha:0.5f];
    }
    if ([[personagem dinheiro] intValue] < [[alimentoView preco] intValue]) {
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
