//
//  ParkView.m
//  Grab It
//
//  Created by Harish Singh on 12/11/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "ParkView.h"



@implementation ParkView


-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //1. Load the bgImage
        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"grass.jpeg"]];
        [self addSubview:backgroundImage];
        
        //2. Create first layer for dog
        dogLayer = [[CALayer alloc] init];
        [dogLayer setBounds:CGRectMake(0.0, 0.0, 85, 85)];
        [dogLayer setPosition:CGPointMake(160, 160)];
        [dogLayer setZPosition:0.0];
        [dogLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
        
        //3. Load the image onto dog layer
        UIImage *dogLayerImage = [UIImage imageNamed:@"dog-1.png"];
        CGImageRef image = [dogLayerImage CGImage];
        [dogLayer setContents:(__bridge id)image];
        [dogLayer setContentsRect:CGRectMake(-0.1, -0.1, 1.2, 1.2)];
        [dogLayer setContentsGravity:kCAGravityResizeAspect];
        
        //4. Load the dog layer onto the view which contains the background image
        [[self layer] addSublayer:dogLayer];
        
        //5. Create second layer for the bone image
        boneLayer = [[CALayer alloc] init];
        [boneLayer setBounds:CGRectMake(0.0, 0.0, 30, 30)];
        [boneLayer setPosition:CGPointMake(0, 0)];
        [boneLayer setZPosition:5.0];
        [boneLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
        
        //6. Load the bone layer onto the view
        [[self layer] addSublayer:boneLayer];
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    
    CGImageRef boneLayerImage = [[UIImage imageNamed:@"bone-1.png"] CGImage];
    [boneLayer setContents:(__bridge id)boneLayerImage];
    [boneLayer setPosition:p];
    
    CABasicAnimation *dogMovementAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [dogMovementAnimation setFromValue:[NSValue valueWithCGPoint:[[dogLayer presentationLayer] position]]];
    [dogMovementAnimation setToValue:[NSValue valueWithCGPoint:p]];
    [dogMovementAnimation setDuration:3.0];
    [dogLayer setPosition:p];
    [dogLayer addAnimation:dogMovementAnimation forKey:@"dogAnimation"];
}

-(BOOL) canBecomeFirstResponder {
    return YES;
}

- (void)drawRect:(CGRect)rect {
    [self becomeFirstResponder];
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    static int shakeCount;
    
    if(shakeCount == 0) {
        CGImageRef dog = [[UIImage imageNamed:@"dog-2.png"] CGImage];
        [dogLayer setContents:(__bridge id)dog];
        shakeCount += 1;
    }
    else {
        CGImageRef dog = [[UIImage imageNamed:@"dog-1.png"] CGImage];
        [dogLayer setContents:(__bridge id)dog];
        shakeCount = 0;
    }
}


@end
