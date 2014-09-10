//
//  MascoteView.h
//  Dieta
//
//  Created by Carlos Augusto Pereira da Silva Junior on 18/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alimento.h"
#import "BalaoView.h"
#import "AnalisaRefeicao.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface MascoteView : UIView

@property UITextView *lblDialogo;
@property int count;
@property NSMutableArray *dialogo;
@property NSArray *listAlimentos;
@property NSMutableArray *vozes;
@property UIView *viewDialogo;
@property UIImageView *personagem;

@property AVAudioPlayer *somOla;

- (id)initWithFrameAndAlimentos:(CGRect)frame :(NSMutableArray *)alimentos;
-(void)falaAnaliseAlimento;
-(void)falaInicial;
-(void)falaHomeMercado;
-(void)falaHomePanela;
-(void)falaHomePrato;
//-(void)falaHome;
-(void)falaPanela;
-(void)falaMercado;

@end
