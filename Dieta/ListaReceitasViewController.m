//
//  ListaReceitasViewController.m
//  Dieta
//
//  Created by senac2012 on 21/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "ListaReceitasViewController.h"
#import "Receita.h"
#import "PanelaViewController.h"

@interface ListaReceitasViewController ()

@end

@implementation ListaReceitasViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (IBAction)fazerReceitaPizza:(id)sender {
    
    Receita *receita = [[Receita alloc] init];
    [receita setNome:@"Pizza"];
    [receita setImagemReceita:[UIImage imageNamed:@"pizza.png"]];
    [receita adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"]];
    [receita adicionaIngrediente:@"queijo" : [UIImage imageNamed:@"queijo.png"]];
    [receita adicionaIngrediente:@"frango" : [UIImage imageNamed:@"frango.png"]];
}*/

- (IBAction)fechaView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"Pizza"]){
        
        NSString *pathTomate = [[NSBundle mainBundle] pathForResource:@"tomate1" ofType:@"mp3"];
        NSURL *urlTomate = [NSURL fileURLWithPath:pathTomate];
        AVAudioPlayer *audioTomate = [[AVAudioPlayer alloc] initWithContentsOfURL:urlTomate error:nil];
        
        NSString *pathQueijo = [[NSBundle mainBundle] pathForResource:@"queijo1" ofType:@"mp3"];
        NSURL *urlQueijo = [NSURL fileURLWithPath:pathQueijo];
        AVAudioPlayer *audioQueijo = [[AVAudioPlayer alloc] initWithContentsOfURL:urlQueijo error:nil];
        
        NSString *pathFrango = [[NSBundle mainBundle] pathForResource:@"frango1" ofType:@"mp3"];
        NSURL *urlFrango = [NSURL fileURLWithPath:pathFrango];
        AVAudioPlayer *audioFrango = [[AVAudioPlayer alloc] initWithContentsOfURL:urlFrango error:nil];
        
        Receita *receitaPizza = [[Receita alloc] init];
        [receitaPizza setNome:@"Pizza"];
        [receitaPizza setImagemReceita:[UIImage imageNamed:@"pizza.png"]];
        [receitaPizza adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"] :audioTomate];
        [receitaPizza adicionaIngrediente:@"queijo" : [UIImage imageNamed:@"queijo.png"] :audioQueijo];
        [receitaPizza adicionaIngrediente:@"frango" : [UIImage imageNamed:@"frango.png"] :audioFrango];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaPizza;
        
    }
    
    if([segue.identifier isEqualToString:@"Frango"]){
        
        NSString *pathTomate = [[NSBundle mainBundle] pathForResource:@"tomate1" ofType:@"mp3"];
        NSURL *urlTomate = [NSURL fileURLWithPath:pathTomate];
        AVAudioPlayer *audioTomate = [[AVAudioPlayer alloc] initWithContentsOfURL:urlTomate error:nil];
        
        NSString *pathCebola = [[NSBundle mainBundle] pathForResource:@"cebola1" ofType:@"mp3"];
        NSURL *urlCebola = [NSURL fileURLWithPath:pathCebola];
        AVAudioPlayer *audioCebola = [[AVAudioPlayer alloc] initWithContentsOfURL:urlCebola error:nil];
        
        NSString *pathFrango = [[NSBundle mainBundle] pathForResource:@"frango1" ofType:@"mp3"];
        NSURL *urlFrango = [NSURL fileURLWithPath:pathFrango];
        AVAudioPlayer *audioFrango = [[AVAudioPlayer alloc] initWithContentsOfURL:urlFrango error:nil];
        
        Receita *receitaFrango = [[Receita alloc] init];
        [receitaFrango setNome:@"Frango"];
        [receitaFrango setImagemReceita:[UIImage imageNamed:@"frango.png"]];
        [receitaFrango adicionaIngrediente:@"frango" : [UIImage imageNamed:@"frango.png"] :audioFrango];
        [receitaFrango adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"] :audioTomate];
        [receitaFrango adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"] :audioCebola];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaFrango;
        
    }
    
    if([segue.identifier isEqualToString:@"Carne"]){
        
        Receita *receitaCarne = [[Receita alloc] init];
        [receitaCarne setNome:@"Carne"];
        
        NSString *pathCarne = [[NSBundle mainBundle] pathForResource:@"carne" ofType:@"mp3"];
        NSURL *urlCarne = [NSURL fileURLWithPath:pathCarne];
        AVAudioPlayer *audioCarne = [[AVAudioPlayer alloc] initWithContentsOfURL:urlCarne error:nil];
        
        NSString *pathTomate = [[NSBundle mainBundle] pathForResource:@"tomate1" ofType:@"mp3"];
        NSURL *urlTomate = [NSURL fileURLWithPath:pathTomate];
        AVAudioPlayer *audioTomate = [[AVAudioPlayer alloc] initWithContentsOfURL:urlTomate error:nil];
        
        NSString *pathCebola = [[NSBundle mainBundle] pathForResource:@"cebola1" ofType:@"mp3"];
        NSURL *urlCebola = [NSURL fileURLWithPath:pathCebola];
        AVAudioPlayer *audioCebola = [[AVAudioPlayer alloc] initWithContentsOfURL:urlCebola error:nil];
        
        [receitaCarne setImagemReceita:[UIImage imageNamed:@"carne.png"]];
        [receitaCarne adicionaIngrediente:@"carne" : [UIImage imageNamed:@"carne.png"] :audioCarne];
        [receitaCarne adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"] :audioTomate];
        [receitaCarne adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"] :audioCebola];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaCarne;
        
    }
    
    if([segue.identifier isEqualToString:@"Hamburger"]){
        
        NSString *pathPao = [[NSBundle mainBundle] pathForResource:@"pao" ofType:@"mp3"];
        NSURL *urlPao = [NSURL fileURLWithPath:pathPao];
        AVAudioPlayer *audioPao = [[AVAudioPlayer alloc] initWithContentsOfURL:urlPao error:nil];
        
        NSString *pathCarne = [[NSBundle mainBundle] pathForResource:@"carne" ofType:@"mp3"];
        NSURL *urlCarne = [NSURL fileURLWithPath:pathCarne];
        AVAudioPlayer *audioCarne = [[AVAudioPlayer alloc] initWithContentsOfURL:urlCarne error:nil];
        
        NSString *pathTomate = [[NSBundle mainBundle] pathForResource:@"tomate1" ofType:@"mp3"];
        NSURL *urlTomate = [NSURL fileURLWithPath:pathTomate];
        AVAudioPlayer *audioTomate = [[AVAudioPlayer alloc] initWithContentsOfURL:urlTomate error:nil];
        
        NSString *pathCebola = [[NSBundle mainBundle] pathForResource:@"cebola1" ofType:@"mp3"];
        NSURL *urlCebola = [NSURL fileURLWithPath:pathCebola];
        AVAudioPlayer *audioCebola = [[AVAudioPlayer alloc] initWithContentsOfURL:urlCebola error:nil];
        
        NSString *pathAlface = [[NSBundle mainBundle] pathForResource:@"alface1" ofType:@"mp3"];
        NSURL *urlAlface = [NSURL fileURLWithPath:pathAlface];
        AVAudioPlayer *audioAlface = [[AVAudioPlayer alloc] initWithContentsOfURL:urlAlface error:nil];
        
        NSString *pathQueijo = [[NSBundle mainBundle] pathForResource:@"queijo1" ofType:@"mp3"];
        NSURL *urlQueijo = [NSURL fileURLWithPath:pathQueijo];
        AVAudioPlayer *audioQueijo = [[AVAudioPlayer alloc] initWithContentsOfURL:urlQueijo error:nil];
        
        Receita *receitaHamburger = [[Receita alloc] init];
        [receitaHamburger setNome:@"Hamburger"];
        [receitaHamburger setImagemReceita:[UIImage imageNamed:@"hamburguer.png"]];
        [receitaHamburger adicionaIngrediente:@"pão" : [UIImage imageNamed:@"pao.png"] :audioPao];
        [receitaHamburger adicionaIngrediente:@"carne" : [UIImage imageNamed:@"carne.png"] :audioCarne];
        [receitaHamburger adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"] :audioTomate];
        [receitaHamburger adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"] :audioCebola];
        [receitaHamburger adicionaIngrediente:@"alface" : [UIImage imageNamed:@"alface.png"] :audioAlface];
        [receitaHamburger adicionaIngrediente:@"queijo" : [UIImage imageNamed:@"queijo.png"] :audioQueijo];
        
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaHamburger;
        
    }
    
}

@end
