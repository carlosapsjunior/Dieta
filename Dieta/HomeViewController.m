//
//  HomeViewController.m
//  Dieta
//
//  Created by senac2012 on 11/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "HomeViewController.h"
#import "MascoteViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize personagemCoreData;

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
    personagemCoreData = [[PersonagemCoreData alloc]init];
}

-(void)viewDidAppear:(BOOL)animated {
    if ([personagemCoreData coreDataIniciado]) {
        [self mostraViewMascote];
    }
}

-(void)mostraViewMascote {
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"mascote"];
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selecionaPersonagem1:(id)sender {
    [self inicializaPersonagemCoreData:1];
}

- (IBAction)selecionaPersonagem2:(id)sender {
    [self inicializaPersonagemCoreData:2];
}

- (IBAction)selecionaPersonagem3:(id)sender {
    [self inicializaPersonagemCoreData:4];
}

- (IBAction)selecionaPersonagem4:(id)sender {
    [self inicializaPersonagemCoreData:3];
}

-(void)inicializaPersonagemCoreData: (int)tipo {
    [personagemCoreData iniciarCoreData:tipo];
    [personagemCoreData atualizarFome:10];
    [personagemCoreData atualizarSaude:67];
    [personagemCoreData atualizarDinheiro:350];
    [self mostraViewMascote];
}

@end
