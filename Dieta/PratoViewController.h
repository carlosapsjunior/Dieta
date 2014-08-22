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

@end
