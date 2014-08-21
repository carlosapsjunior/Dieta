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
        [receitaPizza adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"]];
        [receitaPizza adicionaIngrediente:@"queijo" : [UIImage imageNamed:@"queijo.png"]];
        [receitaPizza adicionaIngrediente:@"frango" : [UIImage imageNamed:@"frango.png"]];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaPizza;
        
    }
    
    if([segue.identifier isEqualToString:@"Frango"]){
        
        Receita *receitaFrango = [[Receita alloc] init];
        [receitaFrango setNome:@"Frango"];
        [receitaFrango setImagemReceita:[UIImage imageNamed:@"frango.png"]];
        [receitaFrango adicionaIngrediente:@"frango" : [UIImage imageNamed:@"frango.png"]];
        [receitaFrango adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"]];
        [receitaFrango adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"]];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaFrango;
        
    }
    
    if([segue.identifier isEqualToString:@"Carne"]){
        
        Receita *receitaCarne = [[Receita alloc] init];
        [receitaCarne setNome:@"Carne"];
        [receitaCarne setImagemReceita:[UIImage imageNamed:@"carne.png"]];
        [receitaCarne adicionaIngrediente:@"carne" : [UIImage imageNamed:@"carne.png"]];
        [receitaCarne adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"]];
        [receitaCarne adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"]];
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaCarne;
        
    }
    
    if([segue.identifier isEqualToString:@"Hamburger"]){
        
        Receita *receitaHamburger = [[Receita alloc] init];
        [receitaHamburger setNome:@"Hamburger"];
        [receitaHamburger setImagemReceita:[UIImage imageNamed:@"hamburguer.png"]];
        [receitaHamburger adicionaIngrediente:@"carne" : [UIImage imageNamed:@"carne.png"]];
        [receitaHamburger adicionaIngrediente:@"tomate" : [UIImage imageNamed:@"tomate3.png"]];
        [receitaHamburger adicionaIngrediente:@"cebola" : [UIImage imageNamed:@"cebola.png"]];
        [receitaHamburger adicionaIngrediente:@"alface" : [UIImage imageNamed:@"alface.png"]];
        [receitaHamburger adicionaIngrediente:@"queijo" : [UIImage imageNamed:@"queijo.png"]];
        
        
        PanelaViewController *panela = [segue destinationViewController];
        panela.receita = receitaHamburger;
        
    }
    
}

@end
