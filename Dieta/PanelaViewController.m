//
//  PanelaViewController.m
//  Dieta
//
//  Created by senac2012 on 05/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "PanelaViewController.h"

@interface PanelaViewController ()

@end

@implementation PanelaViewController

@synthesize panela, alimentosPanela, foodScroller, audioController, listaAlimentosCoreData, gerenciadorCoreData, ingredienteDaVez, receita, imagemProximoIngrediente, nomeReceita,nomeProximoIngrediente, imagemCerto, imagemErrado, imagemReceita, nomeReceitaPronta, viewReceitaPronta, lblAdicione;

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"cozinha.png"]]];
    
    ingredienteDaVez = 0;
    receita = [[Receita alloc] init];
    [receita setNome:@"Pizza"];
    [receita setImagemReceita:[UIImage imageNamed:@"pizza.png"]];
    //[receita adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"]];
    [receita adicionaIngrediente:@"queijo" : [UIImage imageNamed:@"queijo.png"]];
    //[receita adicionaIngrediente:@"frango" : [UIImage imageNamed:@"frango.png"]];
    
    [nomeReceita setText: [receita nome]];
    
    listaAlimentosCoreData = [[NSMutableArray alloc]init];
    gerenciadorCoreData = [[GerenciadorCoreData alloc]init];
    
    [imagemProximoIngrediente setImage: [[[receita ingredientes]objectAtIndex:ingredienteDaVez] imagemAlimento]];
    [nomeProximoIngrediente setText:[[[[receita ingredientes]objectAtIndex:ingredienteDaVez ]nome] uppercaseString]];
    
    [super viewDidLoad];
    [self alocaAlimentosPanela];
    [self alocaFoodScroller];
    [self alocaAudioController];
    [self inicializaAlimentos];
    
    //[gerenciadorCoreData mostraCoreData];
    //[gerenciadorCoreData atualizarQuantidade:3 index:@"maça"];
}

-(void)copiaAlimento: (AlimentoView*)alimentoView {
    
    AlimentoView *copyView = [[AlimentoView alloc] initWithFrame:[alimentoView frame]];
    [copyView setNome:alimentoView.nome];
    [copyView setImagemAlimento:[alimentoView imagemAlimento]];
    //[copyView defineImagem];
    [copyView setGrupoAlimento:alimentoView.grupoAlimento];
    [copyView setGrupoAux:alimentoView.grupoAux];
    [copyView setValorPorcao:alimentoView.valorPorcao];
    [copyView setValorPorcaoAux:alimentoView.valorPorcaoAux];
    [alimentoView setCopia:copyView];
    if ([[alimentoView quantidade] intValue] - 1 == 0) {
        [copyView setAlpha:0.5f];
    }
    else {
        UILongPressGestureRecognizer *p = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveAlimento2:)];
        p.minimumPressDuration = 0.1;
        [copyView addGestureRecognizer:p];
    }
    NSNumber *quantidade = [[NSNumber alloc] initWithInt:[[alimentoView quantidade] intValue] - 1];
    [copyView setQuantidade:quantidade];
    [foodScroller addSubview:copyView];
}

-(void)limparPanelaAposRefeicao {
    for( UIView *v in self.view.subviews) {
        if([v isKindOfClass:[AlimentoView class]]) {
            [v removeFromSuperview];
        }
    }
}


-(IBAction)moveAlimento2:(UILongPressGestureRecognizer *)recognizer {
    AlimentoView *alimentoView = (AlimentoView *)recognizer.view;
    if (recognizer.state == UIGestureRecognizerStateBegan){
        [[audioController somClick]play];
    }
    if (recognizer.state == UIGestureRecognizerStateChanged || recognizer.state == UIGestureRecognizerStateBegan){
        CGPoint position = [recognizer locationInView:self.view];
        
        [self.view addSubview:recognizer.view];
        
        if(alimentoView.estaNaSuperView == 0){
            
            [alimentoView setEstaNaSuperView:1];
            [self copiaAlimento:alimentoView];
            [[alimentoView quantidadeAlimentos] removeFromSuperview];
            [[alimentoView circulo] removeFromSuperview];
        }
        [alimentoView setCenter:position];
        position = CGPointMake(0,0);
    }
    
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        
        if ([self foraDaPanela:alimentoView]) {
            [self verificaIngrediente:alimentoView];
        }
        
    }
}

-(void) verificaIngrediente:(AlimentoView *)alimento{
    
    if(ingredienteDaVez <= ([[receita ingredientes]count] - 1)){
        
        if([[[receita ingredientes]objectAtIndex:ingredienteDaVez] nome] == [alimento nome]){
            
            NSLog(@"Alimento Certo!!");
            [imagemErrado setHidden:YES];
            [imagemCerto setHidden:NO];
            [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(ocultaImagensCertoErrado) userInfo:nil repeats:NO];
            [alimento setHidden:YES];
            
            if(ingredienteDaVez == ([[receita ingredientes]count] - 1)){
                NSLog(@"Receita Concluída");
                
                int quantidade = [[[gerenciadorCoreData buscaAlimento:[[receita nome] lowercaseString]]quantidade]intValue] + 1;
                [gerenciadorCoreData atualizarQuantidade:quantidade index:[[receita nome] lowercaseString]];
                
                [self processaAlimentos:nil];
                
                [self limparPanelaAposRefeicao];
                ingredienteDaVez = 0;
                
                [imagemProximoIngrediente setHidden:YES];
                [nomeProximoIngrediente setHidden:YES];
                [lblAdicione setText:@"Parabéns"];
                
                [imagemReceita setImage:[receita imagemReceita]];
                [nomeReceitaPronta setText:[receita nome]];
                [self desativaAlimentos];
                [viewReceitaPronta setHidden:NO];
                
            }
            
            else{
                ingredienteDaVez++;
                [imagemProximoIngrediente setImage: [[[receita ingredientes]objectAtIndex:ingredienteDaVez] imagemAlimento]];
                [nomeProximoIngrediente setText:[[[[receita ingredientes]objectAtIndex:ingredienteDaVez] nome] uppercaseString]];
            }
            
        }
        else{
            [imagemCerto setHidden:YES];
            [imagemErrado setHidden:NO];
            [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(ocultaImagensCertoErrado) userInfo:nil repeats:NO];
            NSLog(@"Alimento Errado!");
            AlimentoView *referencia = [self buscaReferencia:[alimento nome]];
            [self atualizarQuantidade:referencia];
            [alimento removeFromSuperview];
        
        }
        
    }
    
}

-(void)desativaAlimentos{
    for(UIView *v in self.view.subviews){
        if([v isKindOfClass:[UIScrollView class]]) {
            for(AlimentoView *alimento in v.subviews){
                    alimento.gestureRecognizers = nil;
            }
        }
    }
    [foodScroller setPagingEnabled:NO];
    [foodScroller setContentSize:CGSizeMake(150, self.view.bounds.size.height)];
}

-(void)ocultaImagensCertoErrado{
    [imagemCerto setHidden:YES];
    [imagemErrado setHidden:YES];
}

-(IBAction)moveAlimento:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self.view];
    AlimentoView *alimentoView = (AlimentoView *)recognizer.view;
    
    alimentoView.center = CGPointMake(alimentoView.center.x + translation.x, alimentoView.center.y + translation.y);
    
    [recognizer setTranslation:CGPointMake(0,0) inView:self.view];
    
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        [self foraDaPanela:alimentoView];
        alimentoView.gestureRecognizers = nil;
        UIPanGestureRecognizer *p = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveAlimento:)];
        [alimentoView addGestureRecognizer:p];
    }
}

-(BOOL)foraDaPanela :(AlimentoView *)alimento {
    for(UIView *v in self.view.subviews){
        if([v isKindOfClass:[AlimentoView class]]) {
            float dx = (v.center.x - panela.center.x);
            float dy = (v.center.y - panela.center.y);
            float dist = sqrt(dx*dx + dy*dy);
            
            if(dist >= 300){
                AlimentoView *referencia = [self buscaReferencia:[alimento nome]];
                [self atualizarQuantidade:referencia];
                
                [alimento removeFromSuperview];
                if ([[audioController somLixo]isPlaying]) {
                    [[audioController somLixo]setCurrentTime: 0.0f];
                }
                [[audioController somLixo]play];
                return NO;
            }
            else
                return YES;
        }
    }
    return NO;
}

-(AlimentoView*)buscaReferencia: (NSString*)nome {
    for(UIView *v in self.foodScroller.subviews){
        if([v isKindOfClass:[AlimentoView class]]){
            AlimentoView *referencia = (AlimentoView*)v;
            if ([[referencia nome] isEqualToString:nome]) {
                return referencia;
            }
        }
    }
    return nil;
}
- (IBAction)fechaView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)atualizarQuantidade: (AlimentoView*)alimento {
    if ([[alimento quantidade] intValue] == 0) {
        [alimento setAlpha:1.0];
        UILongPressGestureRecognizer *p = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveAlimento2:)];
        p.minimumPressDuration = 0.1;
        [alimento addGestureRecognizer:p];
    }
    NSNumber *quantidadeAlimento = [[NSNumber alloc]initWithInt:[[alimento quantidade] intValue] + 1];
    [alimento  setQuantidade:quantidadeAlimento];
    [[alimento quantidadeAlimentos] setText:[quantidadeAlimento stringValue]];
}


-(void)addAlimento: (NSString*)nome linha: (int)linha coluna: (int)coluna imagem: (NSString*) imagem grupo: (int)grupo grupoAux: (int)grupoAux porcao:(double)valorPorcao porcaoAux:(double)valorPorcaoAux preco: (int)preco {
    NSNumber *number;
    AlimentoView *alimentoView = [[AlimentoView alloc] initWithFrame:CGRectMake(150 * coluna + 10, 30 + (150 * linha), 128, 128)];
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
    number = [[NSNumber alloc] initWithInt:[[gerenciadorCoreData pegaQuantidade:nome] intValue]];
    [alimentoView setQuantidade:number];
    number = [[NSNumber alloc] initWithInt:preco];
    [alimentoView setPreco:number];
    
    if ([[alimentoView quantidade] intValue] == 0) {
        [alimentoView setAlpha:0.5f];
    }
    else {
        UILongPressGestureRecognizer *p = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveAlimento2:)];
        p.minimumPressDuration = 0.1;
        [alimentoView addGestureRecognizer:p];
    }
    [self.foodScroller addSubview: alimentoView];
}

-(void)inicializaAlimentos {
    //Cereais, pães, tubérculos, raízes e massas
    [self addAlimento:@"pão" linha:0 coluna:0 imagem:@"pao.png" grupo:1 grupoAux:0 porcao:2 porcaoAux:0 preco:50];
    [self addAlimento:@"arroz" linha:0 coluna:1 imagem:@"arroz.png" grupo:1 grupoAux:0 porcao:0.5 porcaoAux:0 preco:390];
    //Açúcares e doces
    [self addAlimento:@"bolacha" linha:0 coluna:2 imagem:@"bolacha.png" grupo:7 grupoAux:1 porcao:0.5 porcaoAux:0.34 preco:100];
    [self addAlimento:@"bolinho" linha:0 coluna:3 imagem:@"bolinho.png" grupo:7 grupoAux:0 porcao:1 porcaoAux:0 preco:30];
    [self addAlimento:@"sorvete" linha:0 coluna:4 imagem:@"sorvete2.png" grupo:7 grupoAux:0 porcao:1 porcaoAux:0 preco:15];
    [self addAlimento:@"donut" linha:0 coluna:5 imagem:@"donut2.png" grupo:7 grupoAux:0 porcao:1 porcaoAux:0 preco:260];
    
    //Hortaliças
    [self addAlimento:@"alface" linha:1 coluna:0 imagem:@"alface.png" grupo:3 grupoAux:0 porcao:0.125 porcaoAux:0 preco:370];
    [self addAlimento:@"cenoura" linha:1 coluna:1 imagem:@"cenoura.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:980];
    [self addAlimento:@"cebola" linha:1 coluna:2 imagem:@"cebola.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:1090];
    [self addAlimento:@"berinjela" linha:1 coluna:3 imagem:@"berinjela.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:893];
    [self addAlimento:@"pimentao" linha:1 coluna:4 imagem:@"pimentao.png" grupo:3 grupoAux:0 porcao:1 porcaoAux:0 preco:246];
    
    //Frutas
    [self addAlimento:@"maça" linha:2 coluna:0 imagem:@"maca.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:734];
    [self addAlimento:@"laranja" linha:2 coluna:1 imagem:@"laranja.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:95];
    [self addAlimento:@"cereja" linha:2 coluna:2 imagem:@"cereja.png" grupo:2 grupoAux:0 porcao:0.2 porcaoAux:0 preco:421];
    [self addAlimento:@"kiwi" linha:2 coluna:3 imagem:@"kiwi.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:245];
    [self addAlimento:@"morango" linha:2 coluna:4 imagem:@"morango.png" grupo:2 grupoAux:0 porcao:0.112 porcaoAux:0 preco:830];
    [self addAlimento:@"pessego" linha:2 coluna:5 imagem:@"pessego.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:474];
    [self addAlimento:@"melancia" linha:2 coluna:6 imagem:@"melancia.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:642];
    [self addAlimento:@"banana" linha:2 coluna:7 imagem:@"banana.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:57];
    [self addAlimento:@"manga" linha:2 coluna:8 imagem:@"manga.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:86];
    [self addAlimento:@"pera" linha:2 coluna:9 imagem:@"pera.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:530];
    [self addAlimento:@"limao" linha:2 coluna:10 imagem:@"limao.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:1230];
    [self addAlimento:@"tomate" linha:2 coluna:11 imagem:@"tomate3.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:3590];
    [self addAlimento:@"uva" linha:2 coluna:12 imagem:@"uva.png" grupo:2 grupoAux:0 porcao:0.1 porcaoAux:0 preco:2100];
    [self addAlimento:@"abobora" linha:2 coluna:13 imagem:@"abobora.png" grupo:2 grupoAux:0 porcao:1 porcaoAux:0 preco:632];
    
    //Leite e derivados
    [self addAlimento:@"queijo" linha:3 coluna:0 imagem:@"queijo.png" grupo:6 grupoAux:8 porcao:1 porcaoAux:0.5 preco:5];
    
    //Carnes e ovos
    [self addAlimento:@"carne" linha:3 coluna:1 imagem:@"carne.png" grupo:5 grupoAux:0 porcao:2 porcaoAux:0 preco:3];
    [self addAlimento:@"frango" linha:3 coluna:2 imagem:@"frango.png" grupo:5 grupoAux:0 porcao:2 porcaoAux:0 preco:9];
    [self addAlimento:@"ovo" linha:3 coluna:3 imagem:@"ovo.png" grupo:5 grupoAux:0 porcao:1 porcaoAux:0 preco:5];
    
    //Leguminosas
    [self addAlimento:@"feijão" linha:4 coluna:0 imagem:@"feijao.png" grupo:4 grupoAux:0 porcao:1 porcaoAux:0 preco:10];
    [self addAlimento:@"milho" linha:4 coluna:1 imagem:@"milho.png" grupo:4 grupoAux:0 porcao:1 porcaoAux:0 preco:90];
    
    //Óledos e gorduras
    [self addAlimento:@"hamburger" linha:4 coluna:2 imagem:@"hamburguer.png" grupo:8 grupoAux:0 porcao:1 porcaoAux:0 preco:1];
    [self addAlimento:@"batata frita" linha:4 coluna:3 imagem:@"batatafrita.png" grupo:8 grupoAux:1 porcao:1 porcaoAux:1 preco:2];
    [self addAlimento:@"pizza" linha:4 coluna:4 imagem:@"pizza.png" grupo:8 grupoAux:0 porcao:1 porcaoAux:0 preco:8];
}

- (IBAction)fechaViewController:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

- (IBAction)processaAlimentos:(id)sender {
    [[audioController somConfirma]play];
    for(UIView *v in self.view.subviews){
        if([v isKindOfClass:[AlimentoView class]]) {
            
            float dx = (v.center.x - panela.center.x);
            float dy = (v.center.y - panela.center.y);
            float dist = sqrt(dx*dx + dy*dy);
            
            AlimentoView *alimentoView = (AlimentoView*)v;
            
            [gerenciadorCoreData decrementaQuantidade:[alimentoView nome]];
            
            if(dist <= 301){
                [alimentosPanela addObject: alimentoView];
            }
        }
    }

    [alimentosPanela removeAllObjects];
}



-(void)alocaAlimentosPanela {
    alimentosPanela = [[NSMutableArray alloc] init];
}

-(void)alocaFoodScroller {
    foodScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(874, 0, 150, self.view.bounds.size.height)];
    [foodScroller setContentSize:CGSizeMake(2100, 0)];
    [foodScroller setPagingEnabled:YES];
    [foodScroller setBackgroundColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:0.7]];
    [self.view addSubview:self.foodScroller];
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
