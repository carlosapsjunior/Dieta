//
//  BalaoView.m
//  Dieta
//
//  Created by senac2012 on 24/04/14.
//  Copyright (c) 2014 senac2012. All rights reserved.
//

#import "BalaoView.h"

@implementation BalaoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRect: self.bounds];
     [[UIColor whiteColor]setFill];
     [bezier fill];
     bezier.lineWidth = 6.0f;
     [[UIColor blackColor]setStroke];
     [bezier stroke];
     [bezier closePath];
}


@end
