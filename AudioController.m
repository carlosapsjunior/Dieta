//
//  AudioController.m
//  Dieta
//
//  Created by senac2012 on 25/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "AudioController.h"

@implementation AudioController

@synthesize somClick, somConfirma, somLixo, somPrato, somVassoura;

-(void)alocaSons {
    NSString *path;
    NSURL *url;
    
    path = [[NSBundle mainBundle] pathForResource:@"somClick" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    somClick = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    path = [[NSBundle mainBundle] pathForResource:@"somConfirma" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    somConfirma = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    path = [[NSBundle mainBundle] pathForResource:@"somLixo" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    somLixo = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    path = [[NSBundle mainBundle] pathForResource:@"somPrato" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    somPrato = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    path = [[NSBundle mainBundle] pathForResource:@"somVassoura" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    somVassoura = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
}

@end
