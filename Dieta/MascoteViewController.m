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

@synthesize gerenciadorCoreData, personagemCoreData, dinheiro, valorDinheiro, saudeBar, fomeBar, personagemView, vozIntro2;

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
    
    NSString *path;
    NSURL *url;
    
    path = [[NSBundle mainBundle] pathForResource:@"intro02" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    
    vozIntro2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    //[NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(diminui) userInfo:nil repeats:YES];
    
    gerenciadorCoreData = [[GerenciadorCoreData alloc]init];
    personagemCoreData = [[PersonagemCoreData alloc]init];
    
    [gerenciadorCoreData iniciaCoreData];

    [personagemCoreData atualizarFome:33];
    [personagemCoreData atualizarSaude:57];
    
    Personagem *personagem = [personagemCoreData returnPersonagem];
    NSString *dindin = [NSString stringWithFormat:@"%d", [[personagem dinheiro] intValue]];
    [dinheiro setText:dindin];
    
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

-(void)diminui{
    float novaFome = [[[personagemCoreData returnPersonagem] fome]floatValue] - 1.8;
    if(novaFome  > 0){
    [personagemCoreData atualizarFome:novaFome];
        NSLog(@"%f,%f", [[[personagemCoreData returnPersonagem] fome]floatValue], novaFome);
        [fomeBar setFrame:CGRectMake(320, 210, ([[[personagemCoreData returnPersonagem] fome] floatValue]*300)/100, 50)];
    }
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
    
    [fomeBar setBackgroundColor:[UIColor colorWithRed:0.0 green:0.7 blue:0.0f alpha:1.0f]];
    
    [fomeBar setFrame:CGRectMake(0, 200, fomeBar.bounds.size.width, -([[personagem fome] floatValue]*200)/100)];
    [saudeBar setFrame:CGRectMake(0, 200, saudeBar.bounds.size.width, -([[personagem saude] floatValue]*200)/100)];
 
    [vozIntro2 play];
    
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
