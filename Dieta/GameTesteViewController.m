//
//  GameTesteViewController.m
//  Dieta
//
//  Created by RENAN GOMES on 16/06/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "GameTesteViewController.h"
#import "JogoSkate.h"

@implementation GameTesteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width);
    SKView *skView = [[SKView alloc] initWithFrame:frame];
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    [self.view addSubview: skView];
    
    JogoSkate *scene = [JogoSkate sceneWithSize:skView.bounds.size];
    
    [scene setClasse:self];
    
    [scene setMView:self.view];
    
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    [skView presentScene:scene];
    
    //[scene.view removeFromSuperview];
    
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissView {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
