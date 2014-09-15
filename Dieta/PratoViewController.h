//
//  ViewController.h
//  Dieta
//
//  Created by senac2012 on 16/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlimentoView.h"
#import "MascoteView.h"
#import "AnalisaRefeicao.h"
#import "AudioController.h"
#import "GerenciadorCoreData.h"
#import "AudioController.h"
#import "PersonagemCoreData.h"
#import "TutorialCoreData.h"

@interface PratoViewController : UIViewController <UIAlertViewDelegate>

@property UIScrollView *foodScroller;
@property (weak, nonatomic) IBOutlet UIImageView *prato;

@property NSMutableArray *alimentosPrato;
@property NSArray *listaAlimentosCoreData;

@property AudioController *audioController;
@property GerenciadorCoreData *gerenciadorCoreData;
@property PersonagemCoreData *personagemCoreData;
@property Personagem *personagem;
@property UIView *fomeBar;
@property UIView *saudeBar;
@property UIImageView *personagemView;
@property float saude;

- (IBAction)mostraConfirmacaoParaLimparPrato:(id)sender;
- (IBAction)processaAlimentos:(id)sender;

//Porções: 19

//Café da manha
//- Um alimento do grupo dos carboidratos: biscoito, torrada, algum tipo de pão ou cereal matinal.
//- Um alimento do grupo das frutas: frutas frescas, vitaminas ou sucos de frutas.
//- Um alimento do grupo dos leites e derivados: leite, iogurte ou queijo.

//Almoço e Jantar
//- Verduras: 2 ou mais.
//- Legumes
//- Fonte de carboidratos: Arroz e macarrão, batata, farinhas, farofas e purê de batata.
//- Grãos: feijões, grão de bico, lentilha, soja.
//- Carnes: aves, peixes e carnes magras

//Lanches
//- Frutas
//- Iogurtes
//- Biscoitos e cookies integrais:
//- Carboidratos integrais:
//
//

@end
