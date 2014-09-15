//
//  MascoteView.m
//  Dieta
//
//  Created by Carlos Augusto Pereira da Silva Junior on 18/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "MascoteView.h"



@implementation MascoteView
@synthesize lblDialogo, count, dialogo, listAlimentos, somOla, viewDialogo, personagem, vozes;

- (id)initWithFrameAndAlimentos:(CGRect)frame :(NSMutableArray *)alimentos
{
    self = [super initWithFrame:frame];
    if (self) {
        
        listAlimentos = alimentos;
        [self setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.5]];

        personagem = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 215, 215)];
        [personagem setImage:[UIImage imageNamed:@"doutora.png"]];
        
        viewDialogo = [[UIView alloc] initWithFrame:CGRectMake(0, 60, 1024, 160)];
        [viewDialogo setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [self addSubview:viewDialogo];
        
        lblDialogo = [[UITextView alloc] initWithFrame:CGRectMake(280, 100, 500, 140)];
        [lblDialogo setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
        [lblDialogo setTextColor:[UIColor whiteColor]];
        [lblDialogo setEditable:NO];
        [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
        [lblDialogo setFont:[UIFont systemFontOfSize:20]];
        UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"HelveticaNeue-Bold"] size:20];
        [lblDialogo setFont:newFont];
        [lblDialogo setTextAlignment:NSTextAlignmentLeft];
        [lblDialogo addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avanca)]];
        //BalaoView *balaoView = [[BalaoView alloc] initWithFrame:CGRectMake(250, 30, 350, 215)];
        
        UILabel *toqueParaContinuar = [[UILabel alloc] initWithFrame:CGRectMake(700, 120, 300, 30)];
        toqueParaContinuar.text = @"Toque para continuar.";
        toqueParaContinuar.textColor = [UIColor whiteColor];
        [viewDialogo addSubview:toqueParaContinuar];
        
        UIImageView *balao = [[UIImageView alloc] initWithFrame:CGRectMake(300, 300, 200, 200)];
        [balao setImage:[UIImage imageNamed:@"balaoDialogo.png"]];
        
        [self addSubview:viewDialogo];
        [self addSubview:personagem];
        //[self addSubview:balaoView];
        //[self addSubview:balao];
        [self addSubview:lblDialogo];
        
        
        NSString *path;
        NSURL *url;
        
        path = [[NSBundle mainBundle] pathForResource:@"somPrato" ofType:@"mp3"];
        url = [NSURL fileURLWithPath:path];
        somOla = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    return self;
}

-(void)falaInicial{
    NSString *path;
    NSURL *url;
    AVAudioPlayer *voz;
    
    vozes = [[NSMutableArray alloc]init];
    
    path = [[NSBundle mainBundle] pathForResource:@"prato02" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    [voz play];
    
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Para alimentar seu amigo, arraste os alimentos para o prato."];

    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)falaHomeMercado {
    NSString *path;
    NSURL *url;
    AVAudioPlayer *vozInicial;
    AVAudioPlayer *voz;
    
    vozes = [[NSMutableArray alloc]init];
    
    path = [[NSBundle mainBundle] pathForResource:@"intro02" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    vozInicial = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:vozInicial];
    
    [vozInicial play];
    
    path = [[NSBundle mainBundle] pathForResource:@"mercado01" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    [personagem setFrame:CGRectMake(30, 290, 215, 215)];
    [viewDialogo setFrame:CGRectMake(0, 320, 1025, 160)];
    [lblDialogo setFrame:CGRectMake(280, 360, 500, 140)];
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Olá, meu nome é Cristina, e vou ajudar você a alimentar corretamente o seu amigo."];
    [arrayFala addObject:@"Primeiro aperte o icone do carrinho para comprar os alimentos do seu amigo."];
    
    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)falaHomePanela {
    NSString *path;
    NSURL *url;
    AVAudioPlayer *voz;
    
    vozes = [[NSMutableArray alloc]init];
    
    path = [[NSBundle mainBundle] pathForResource:@"panela01" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    [voz play];
    
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Agora vamos cozinhar para o seu amigo."];
    
    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)falaHomePrato {
    NSString *path;
    NSURL *url;
    AVAudioPlayer *voz;
    
    vozes = [[NSMutableArray alloc]init];
    
    path = [[NSBundle mainBundle] pathForResource:@"prato01" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    [voz play];
    
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Agora chegou a hora de alimentar seu amigo, aperte o icone do prato para começar."];
    
    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

/*-(void)falaHome {
    NSString *path;
    NSURL *url;
    AVAudioPlayer *vozInicial;
    AVAudioPlayer *voz;
    
    vozes = [[NSMutableArray alloc]init];
    
    path = [[NSBundle mainBundle] pathForResource:@"intro02" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    vozInicial = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:vozInicial];
    
    [vozInicial play];
    
    path = [[NSBundle mainBundle] pathForResource:@"mercado01" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    path = [[NSBundle mainBundle] pathForResource:@"prato01" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    path = [[NSBundle mainBundle] pathForResource:@"panela01" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    [personagem setFrame:CGRectMake(30, 290, 215, 215)];
    [viewDialogo setFrame:CGRectMake(0, 320, 1025, 160)];
    [lblDialogo setFrame:CGRectMake(280, 360, 500, 140)];
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Olá, meu nome é Cristina, e vou ajudar você a alimentar corretamente o seu amigo."];
    [arrayFala addObject:@"Primeiro aperte o icone do carrinho para comprar os alimentos do seu amigo."];
    [arrayFala addObject:@"Agora chegou a hora de alimentar seu amigo, aperte o icone do prato para começar."];
    [arrayFala addObject:@"Agora vamos cozinhar para o seu amigo."];
    
    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}*/


-(void)falaPanela {
    NSString *path;
    NSURL *url;
    AVAudioPlayer *voz;
    
    vozes = [[NSMutableArray alloc]init];
    
    path = [[NSBundle mainBundle] pathForResource:@"panela02" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    [voz play];
    
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Arraste os ingredientes que eu mostro para a panela."];
    
    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)falaMercado {
    NSString *path;
    NSURL *url;
    AVAudioPlayer *voz;
    
    vozes = [[NSMutableArray alloc]init];
    
    path = [[NSBundle mainBundle] pathForResource:@"mercado02" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    voz = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [vozes addObject:voz];
    
    [voz play];
    
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Aperte nos alimentos que quer comprar, cada um deles tem seu preço em moedas."];
    
    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)falaAnaliseAlimento {
    AnalisaRefeicao *analiseRefeicao = [[AnalisaRefeicao alloc] initWithAlimentos:listAlimentos];
    [analiseRefeicao verifica];
    //dialogo = [analiseRefeicao  geraDialogo];
    dialogo = [analiseRefeicao geraDialogo];
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self avanca];
}

-(void)avanca {
    AVAudioPlayer *voz = [vozes objectAtIndex:count];
    if (![voz isPlaying]) {
        count++;
        if(count < [dialogo count]) {
            AVAudioPlayer *voz = [vozes objectAtIndex:count];
            [voz play];
            [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
        }
        else {
            [self setAlpha:0];
            count = 0;
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
