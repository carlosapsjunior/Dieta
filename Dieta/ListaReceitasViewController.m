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
        
        Receita *receitaPizza = [[Receita alloc] init];
        [receitaPizza setNome:@"Pizza"];
        [receitaPizza setImagemReceita:[UIImage imageNamed:@"pizza.png"]];
        [receitaPizza adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"] :nil];
        [receitaPizza adicionaIngrediente:@"queijo" : [UIImage imageNamed:@"queijo.png"] :nil];
        [receitaPizza adicionaIngrediente:@"frango" : [UIImage imageNamed:@"frango.png"] :nil];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaPizza;
        
    }
    
    if([segue.identifier isEqualToString:@"Frango"]){
        
        Receita *receitaFrango = [[Receita alloc] init];
        [receitaFrango setNome:@"Frango"];
        [receitaFrango setImagemReceita:[UIImage imageNamed:@"frango.png"]];
        [receitaFrango adicionaIngrediente:@"frango" : [UIImage imageNamed:@"frango.png"] :nil];
        [receitaFrango adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"] :nil];
        [receitaFrango adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"] :nil];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaFrango;
        
    }
    
    if([segue.identifier isEqualToString:@"Carne"]){
        
        Receita *receitaCarne = [[Receita alloc] init];
        [receitaCarne setNome:@"Carne"];
        
        NSString *pathCarne = [[NSBundle mainBundle] pathForResource:@"carne" ofType:@"mp3"];
        NSURL *urlCarne = [NSURL fileURLWithPath:pathCarne];
        AVAudioPlayer *audioCarne = [[AVAudioPlayer alloc] initWithContentsOfURL:urlCarne error:nil];
        
        [receitaCarne setImagemReceita:[UIImage imageNamed:@"carne.png"]];
        [receitaCarne adicionaIngrediente:@"carne" : [UIImage imageNamed:@"carne.png"] :audioCarne];
        [receitaCarne adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"] :nil];
        [receitaCarne adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"] :nil];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaCarne;
        
    }
    
    if([segue.identifier isEqualToString:@"Hamburger"]){
        
        Receita *receitaHamburger = [[Receita alloc] init];
        [receitaHamburger setNome:@"Hamburger"];
        [receitaHamburger setImagemReceita:[UIImage imageNamed:@"hamburguer.png"]];
        [receitaHamburger adicionaIngrediente:@"pão" : [UIImage imageNamed:@"pao.png"] :nil];
        [receitaHamburger adicionaIngrediente:@"carne" : [UIImage imageNamed:@"carne.png"] :nil];
        [receitaHamburger adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"] :nil];
        [receitaHamburger adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"] :nil];
        [receitaHamburger adicionaIngrediente:@"alface" : [UIImage imageNamed:@"alface.png"] :nil];
        [receitaHamburger adicionaIngrediente:@"queijo" : [UIImage imageNamed:@"queijo.png"] :nil];
        
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaHamburger;
        
    }
    
}

@end
