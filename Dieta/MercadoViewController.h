//
//  MercadoViewController.h
//  Dieta
//
//  Created by senac2012 on 22/05/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorCoreData.h"
#import "PersonagemCoreData.h"
#import "MascoteView.h"
#import "AudioController.h"
#import "TutorialCoreData.h"

@interface MercadoViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *dinheiro;

@property UICollectionView *collectionView;
@property UIView *ofertasView;
@property NSArray *imagens;
@property GerenciadorCoreData *gerenciadorCoreData;
@property PersonagemCoreData *personagemCoreData;
@property Personagem *personagem;
@property NSArray *todosAlimentos;
@property NSMutableArray *carrinho;
@property AudioController *audioController;
@property int controladorPag, indAtual, grupoAlimento;
@property CGPoint pagina;
-(void)pegaAlimentosCategoria:(int)grupoAlimento;

@property (weak, nonatomic) IBOutlet UIButton *btnFrutasView;
@property (weak, nonatomic) IBOutlet UIButton *btnPaosCereaisTuberculosRaizesView;
@property (weak, nonatomic) IBOutlet UIButton *btnVerdurasLegumesHortalicasView;
@property (weak, nonatomic) IBOutlet UIButton *btnLeguminosasView;
@property (weak, nonatomic) IBOutlet UIButton *btnCarnesFrangoPeixesOvosView;
@property (weak, nonatomic) IBOutlet UIButton *btnLeitesQueijosIorgutesView;
@property (weak, nonatomic) IBOutlet UIButton *btnOleosGordurasView;
@property (weak, nonatomic) IBOutlet UIButton *btnAcucaresView;

@end
