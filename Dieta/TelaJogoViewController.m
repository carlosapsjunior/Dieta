//
//  TelaJogoViewController.m
//  Dieta
//
//  Created by Daniel Missima Teodoro on 11/09/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "TelaJogoViewController.h"
#import "FoodDrop.h"

@interface TelaJogoViewController ()


@end

@implementation TelaJogoViewController

//@synthesize viewInstrucoes;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            

            
        }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [viewInstrucoes setHidden:NO];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)abreDrop:(id)sender{
    
//    [viewInstrucoes setHidden:YES];
    
    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    SKView *skView = [[SKView alloc] initWithFrame:frame];
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;

    [self.view addSubview: skView];
    
    FoodDrop *scene = [FoodDrop sceneWithSize:skView.bounds.size];
    
    [scene setMView:self.view];
    
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    [skView presentScene:scene];
    
}

- (IBAction)fechaView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
