//
//  MascoteView.m
//  Dieta
//
//  Created by Carlos Augusto Pereira da Silva Junior on 18/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "MascoteView.h"



@implementation MascoteView
@synthesize lblDialogo, count, dialogo, listAlimentos, somOla, viewDialogo;

- (id)initWithFrameAndAlimentos:(CGRect)frame :(NSMutableArray *)alimentos
{
    self = [super initWithFrame:frame];
    if (self) {
        
        listAlimentos = alimentos;
        [self setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.5]];

        UIImageView *personagem = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 215, 215)];
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
    
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Olá, meu amigo!"];
    [arrayFala addObject:@"Vamos ver o que você comeu hoje?"];
    [arrayFala addObject:@"Clique com os dois dedos nos alimento que você comeu, e os arraste para o prato."];
    [arrayFala addObject:@"Clicando com um dedo e arrastando ele para o lado, você pode ver e selecionar outros alimentos."];
    [arrayFala addObject:@"Depois que selecionar tudo o que você comeu, clique no 'jóinha' na parte inferior da tela!"];

    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)falaHome{
    
    NSMutableArray *arrayFala = [[NSMutableArray alloc] init];
    [arrayFala addObject:@"Escolha o seu amigo."];
    
    dialogo = arrayFala;
    
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)falaAnaliseAlimento{
    AnalisaRefeicao *analiseRefeicao = [[AnalisaRefeicao alloc] initWithAlimentos:listAlimentos];
    [analiseRefeicao verifica];
    //dialogo = [analiseRefeicao  geraDialogo];
    dialogo = [analiseRefeicao geraDialogo];
    [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /*if (count == 0) {
        [somOla play];
    }*/
    [self avanca];
    
}

-(void)avanca{
    count++;
    if(count < [dialogo count]){
        [lblDialogo setText:[NSString stringWithFormat:@"%@", [dialogo objectAtIndex:count]]];
    }
    else{
        [self setAlpha:0];
        count = 0;
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
