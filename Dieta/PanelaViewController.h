//
//  PanelaViewController.h
//  Dieta
//
//  Created by senac2012 on 05/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receita.h"
#import "AlimentoView.h"
#import "MascoteView.h"
#import "AnalisaRefeicao.h"
#import "AudioController.h"
#import "GerenciadorCoreData.h"
#import "AudioController.h"


@interface PanelaViewController : UIViewController

@property UIScrollView *foodScroller;
@property (weak, nonatomic) IBOutlet UIImageView *panela;
@property (weak, nonatomic) IBOutlet UIImageView *imagemProximoIngrediente;
@property (weak, nonatomic) IBOutlet UILabel *nomeReceita;
@property (weak, nonatomic) IBOutlet UILabel *nomeProximoIngrediente;
@property (weak, nonatomic) IBOutlet UIImageView *imagemCerto;
@property (weak, nonatomic) IBOutlet UIImageView *imagemErrado;
@property (weak, nonatomic) IBOutlet UIImageView *imagemReceita;
@property (weak, nonatomic) IBOutlet UILabel *nomeReceitaPronta;
@property (weak, nonatomic) IBOutlet UIView *viewReceitaPronta;
@property (weak, nonatomic) IBOutlet UILabel *lblAdicione;

@property int ingredienteDaVez;
@property Receita *receita;


@property NSMutableArray *alimentosPanela;
@property NSArray *listaAlimentosCoreData;

@property AudioController *audioController;
@property GerenciadorCoreData *gerenciadorCoreData;

- (IBAction)mostraConfirmacaoParaLimparPrato:(id)sender;
- (IBAction)processaAlimentos:(id)sender;

@end
