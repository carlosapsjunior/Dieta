//
//  AudioController.h
//  Dieta
//
//  Created by senac2012 on 25/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioController : NSObject

@property AVAudioPlayer *somClick, *somConfirma, *somLixo, *somPrato, *somVassoura;

-(void)alocaSons;

@end
