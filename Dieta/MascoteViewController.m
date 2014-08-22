//
//  MascoteViewController.m
//  Dieta
//
//  Created by RENAN GOMES on 25/06/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "MascoteViewController.h"

@interface MascoteViewController ()

@end

@implementation MascoteViewController

@synthesize gerenciadorCoreData, personagemCoreData, dinheiro, valorDinheiro, saudeBar, fomeBar, personagemView, tutorialCoreData, timerFome, timerSaude;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tutorialCoreData = [[TutorialCoreData alloc]init];
    Tutorial *tutorial = [tutorialCoreData returnTutorial];
    
    if ([[tutorial intro02] intValue] == 0) {
        [self alocaMascote];
        [tutorialCoreData intro02];
    }

    gerenciadorCoreData = [[GerenciadorCoreData alloc]init];
    personagemCoreData = [[PersonagemCoreData alloc]init];
    
    [gerenciadorCoreData iniciaCoreData];

    Personagem *personagem = [personagemCoreData returnPersonagem];
    NSString *dindin = [NSString stringWithFormat:@"%d", [[personagem dinheiro] intValue]];
    [dinheiro setText:dindin];
    
    //[personagemCoreData atualizarFome:55.0f];
    
    UIView *personagemBorda  = [[UIView alloc] initWithFrame:CGRectMake(45, 45, 220, 220)];
    personagemBorda.backgroundColor = [UIColor blackColor];
    [self.view addSubview:personagemBorda];
    
    UIView *personagemBackground  = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 210, 210)];
    personagemBackground.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:personagemBackground];
    
    NSString *imageName;
    
    personagemView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 210, 210)];
    if( [[personagem fome]intValue] >= 66 || [[personagem saude]intValue] >= 66){
        imageName = [NSString stringWithFormat:@"mascote%d_1", [[personagem tipo] intValue]];
    }
    if ([[personagem fome]intValue] <= 66 || [[personagem saude]intValue] <= 66){
        imageName = [NSString stringWithFormat:@"mascote%d_2", [[personagem tipo] intValue]];
    }
    if ([[personagem fome]intValue] <= 33 || [[personagem saude]intValue] <= 33){
        imageName = [NSString stringWithFormat:@"mascote%d_3", [[personagem tipo] intValue]];
    }
    
    [personagemView setImage:[UIImage imageNamed:imageName]];
    [self.view addSubview:personagemView];
    
    
	// Do any additional setup after loading the view.
}
- (IBAction)goPrato:(id)sender {
    [timerFome invalidate];
    timerFome = nil;
    
    [timerSaude invalidate];
    timerSaude = nil;
}

-(void)diminuiFome{
    Personagem *personagemFome =[personagemCoreData returnPersonagem];
    float novaFome = [[personagemFome fome]floatValue] - 1.8;
    
    if(novaFome  > 0) {
        [personagemCoreData atualizarFome:novaFome];
        [fomeBar setFrame:CGRectMake(0, 200, fomeBar.bounds.size.width, -([[personagemFome fome] floatValue]*200)/100)];
    }
}

-(void)diminuiSaude{
    Personagem *personagemSaude = [personagemCoreData returnPersonagem];
    float novaSaude = [[personagemSaude saude]floatValue] - 1.8;
    if ([[personagemSaude fome]floatValue] < 10) {
        if(novaSaude  > 0) {
            [personagemCoreData atualizarSaude:novaSaude];
            [saudeBar setFrame:CGRectMake(0, 200, saudeBar.bounds.size.width, -([[personagemSaude saude] floatValue]*200)/100)];
        }
    }
}

-(void)alocaMascote {
    MascoteView *mascote = [[MascoteView alloc] initWithFrameAndAlimentos:CGRectMake(0, 0, 1024, 768) :nil];
    [mascote falaHome];
    [self.view addSubview:mascote];
}

-(void)atualizaDinheiro {
    Personagem *personagem = [personagemCoreData returnPersonagem];
    NSString *dindin = [NSString stringWithFormat:@"%d", [[personagem dinheiro] intValue]];
    [dinheiro setText:dindin];
}

-(void)viewDidAppear:(BOOL)animated {
    Personagem *personagem = [personagemCoreData returnPersonagem];
    NSString *dindin = [NSString stringWithFormat:@"%d", [[personagem dinheiro] intValue]];
    [dinheiro setText:dindin];
    
    if (timerFome == nil) {
        timerFome = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(diminuiFome) userInfo:nil repeats:YES];
    }
    
    if (timerSaude == nil) {
        timerSaude = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(diminuiSaude) userInfo:nil repeats:YES];
    }

    [fomeBar setBackgroundColor:[UIColor colorWithRed:0.0 green:0.7 blue:0.0f alpha:1.0f]];
    
    [fomeBar setFrame:CGRectMake(0, 200, fomeBar.bounds.size.width, -([[personagem fome] floatValue]*200)/100)];
    [saudeBar setFrame:CGRectMake(0, 200, saudeBar.bounds.size.width, -([[personagem saude] floatValue]*200)/100)];
    
    [self atualizaImagemPersonagem];
}

-(void)atualizaImagemPersonagem {
    Personagem *personagem = [personagemCoreData returnPersonagem];
    NSString *imageName;
    //UIImageView *personagemView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 210, 210)];
    if( [[personagem fome]intValue] >= 66 || [[personagem saude]intValue] >= 66){
        imageName = [NSString stringWithFormat:@"mascote%d_1", [[personagem tipo] intValue]];
    }
    if ([[personagem fome]intValue] <= 66 || [[personagem saude]intValue] <= 66){
        imageName = [NSString stringWithFormat:@"mascote%d_2", [[personagem tipo] intValue]];
    }
    if ([[personagem fome]intValue] <= 33 || [[personagem saude]intValue] <= 33){
        imageName = [NSString stringWithFormat:@"mascote%d_3", [[personagem tipo] intValue]];
    }
    
    [personagemView setImage:[UIImage imageNamed:imageName]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
