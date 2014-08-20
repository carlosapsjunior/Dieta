//
//  ViewController.h
//  Dieta
//
//  Created by senac2012 on 16/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alimentos.h"
#import "MascoteView.h"

@interface PratoViewController : UIViewController <UIAlertViewDelegate>

@property UIScrollView *foodScroller;
@property (weak, nonatomic) IBOutlet UIImageView *prato;

@property NSMutableArray *alimentosPrato;


-(IBAction)pan:(UIPanGestureRecognizer *)recognizer;

- (IBAction)mostraConfirmacaoParaLimparPrato:(id)sender;
- (IBAction)processaAlimentos:(id)sender;





@end
