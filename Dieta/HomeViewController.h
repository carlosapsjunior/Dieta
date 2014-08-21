//
//  HomeViewController.h
//  Dieta
//
//  Created by senac2012 on 11/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PersonagemCoreData.h"
#import "MascoteViewController.h"
#import "TutorialCoreData.h"

@interface HomeViewController : UIViewController

@property PersonagemCoreData *personagemCoreData;
@property TutorialCoreData *tutorialCoreData;
@property AVAudioPlayer *vozIntro;

@end
