//
//  MascoteViewController.h
//  Dieta
//
//  Created by RENAN GOMES on 25/06/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorCoreData.h"
#import "PersonagemCoreData.h"
#import "MascoteView.h"
#import <AVFoundation/AVFoundation.h>
#import "TutorialCoreData.h"

@interface MascoteViewController : UIViewController

@property GerenciadorCoreData *gerenciadorCoreData;
@property PersonagemCoreData *personagemCoreData;
@property (weak, nonatomic) IBOutlet UILabel *dinheiro;
@property NSString *valorDinheiro;
@property (weak, nonatomic) IBOutlet UIView *fomeBar;
@property (weak, nonatomic) IBOutlet UIView *saudeBar;
@property UIImageView *personagemView;
@property TutorialCoreData *tutorialCoreData;
@property NSTimer *timerFome;
@property NSTimer *timerSaude;

//313, 58
//532, 58

-(void)atualizaDinheiro;

@end
