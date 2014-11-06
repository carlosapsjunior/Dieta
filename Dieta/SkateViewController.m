//
//  SkateViewController.m
//  Dieta
//
//  Created by Daniel Missima Teodoro on 11/09/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "SkateViewController.h"
#import "JogoSkate.h"

@interface SkateViewController ()

@end

@implementation SkateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
