//
//  JogoViewController.m
//  Dieta
//
//  Created by Daniel Missima Teodoro on 06/08/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "JogoViewController.h"
#import "JogoSkate.h"
#import "FoodDrop.h"

@interface JogoViewController ()

@end

@implementation JogoViewController
@synthesize viewInstrucoes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)abreSkate:(id)sender{
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        SKView *skView = [[SKView alloc] initWithFrame:frame];
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        [self.view addSubview: skView];
        
        JogoSkate *scene = [JogoSkate sceneWithSize:skView.bounds.size];
        
        //[scene setClasse:self];
        
        [scene setMView:self.view];
        
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
        [skView presentScene:scene];
        
        //[scene.view removeFromSuperview];
        
        //[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)abreInstrucoes:(id)sender {

    [viewInstrucoes setHidden:NO];
    
}

- (IBAction)fechaView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];

}


@end
