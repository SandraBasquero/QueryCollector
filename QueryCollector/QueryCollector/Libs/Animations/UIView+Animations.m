//
//  UIView+Animations.m
//  Epsilon
//
//  Created by Juan Benavides Romero on 05/06/14.
//  Copyright (c) 2014 Letshealth. All rights reserved.
//

#import "UIView+Animations.h"
#import "Defines.h"

@implementation UIView (Animations)

-(void)fadeIn {
    [self fadeIn:BE_ANIMATION_DURATION];
}


-(void)fadeIn:(float)duration {
    [self fadeIn:duration withDelay:0];
}


-(void)fadeIn:(float)duration withDelay:(float)delay {
    [self fadeIn:duration withDelay:delay withBlock:nil];
}


-(void)fadeIn:(float)duration withDelay:(float)delay withBlock:(void (^)(void))block {
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        [self setAlpha:1];
    } completion:^(BOOL finished) {
        if(block != nil) {
            block();
        }
    }];
}



-(void)fadeOut {
    [self fadeOut:BE_ANIMATION_DURATION];
}


-(void)fadeOut:(float)duration {
    [self fadeOut:duration withDelay:0];
}


-(void)fadeOut:(float)duration withDelay:(float)delay {
    [self fadeOut:duration withDelay:delay withBlock:nil];
}


-(void)fadeOut:(float)duration withDelay:(float)delay withBlock:(void (^)(void))block {
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        if(block != nil) {
            block();
        }
    }];
}



-(void)move:(float)x withY:(float)y {
    [self setFrame:CGRectMake(self.frame.origin.x + x, self.frame.origin.y + y, self.frame.size.width, self.frame.size.height)];
}


-(void)moving:(float)x withY:(float)y {
    [self moving:x withY:y withDuration:BE_ANIMATION_DURATION];
}


-(void)moving:(float)x withY:(float)y withDuration:(float)duration {
    [self moving:x withY:y withDuration:duration withDealy:0];
}


-(void)moving:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay {
    [self moving:x withY:y withDuration:duration withDealy:delay withBlock:nil];
}


-(void)moving:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block {
    [self moving:x withY:y withDuration:duration withDealy:delay withBlock:block withOptions:UIViewAnimationOptionCurveEaseOut];
}


-(void)moving:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block withOptions:(UIViewAnimationOptions)options {
    [UIView animateWithDuration:duration delay:delay options:options animations:^{
        [self move:x withY:y];
    } completion:^(BOOL finished) {
        if(block != nil) {
            block();
        }
    }];
}




-(void)movingRebound:(float)x withY:(float)y {
    [self movingRebound:x withY:y withDuration:BE_ANIMATION_DURATION];
}


-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration {
    [self movingRebound:x withY:y withDuration:duration withDealy:0];
}


-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay {
    [self movingRebound:x withY:y withDuration:duration withDealy:delay withBlock:nil];
}


-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block {
    [self movingRebound:x withY:y withDuration:duration withDealy:delay withBlock:block withRebound:EpsilonMovingReboundsLight];
}

-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block withRebound:(EpsilonMovingRebounds)rebound {
    CAMediaTimingFunction *timingFunction;
    
    if(rebound == EpsilonMovingReboundsHeavy) {
        timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.17 :0.67 :0.49 :1.42];
    } else {
        timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.43 :0.19 :0.36 :1.25];
    }
    
    [self movingRebound:x withY:y withDuration:duration withDealy:delay withBlock:block withTimingFuncition:timingFunction];
}


-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block withTimingFuncition:(CAMediaTimingFunction*)timingFunction {
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [self move:x withY:y];
        if(block != nil) {
            block();
        }
    }];
    
    //[CATransaction setCompletionBlock:block];
    
    CGPoint startPoint = self.layer.position;
    CGPoint endPoint = CGPointMake(startPoint.x + x, startPoint.y + y);
    
    CABasicAnimation *frameAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    frameAnimation.duration = duration;
    frameAnimation.beginTime = CACurrentMediaTime() + delay;
    frameAnimation.timingFunction = timingFunction;
    
    frameAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
    frameAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
    //frameAnimation.removedOnCompletion = false;
    
    frameAnimation.fillMode = kCAFillModeForwards;
    [frameAnimation setFillMode:@"extended"];
    [frameAnimation setRemovedOnCompletion:NO];
    
    [self.layer addAnimation:frameAnimation forKey:@"position"];
    self.layer.actions = [NSDictionary dictionaryWithObjectsAndKeys:frameAnimation, @"position", nil];
    
    [CATransaction commit];
}






-(void)scale:(float)scale {
    [self scale:scale withX:self.center.x withY:self.center.y];
}


-(void)scale:(float)scale withX:(float)x withY:(float)y {
    float scaleWidth = self.frame.size.width * scale;
    float scaleHeight = self.frame.size.height * scale;
    
    [self setFrame:CGRectMake(x - (scaleWidth / 2), y - (scaleHeight / 2), scaleWidth, scaleHeight)];
}


-(void)scaling:(float)scale {
    [self scaling:scale withX:self.center.x withY:self.center.y];
}


-(void)scaling:(float)scale withDuration:(float)duration {
    [self scaling:scale withX:self.center.x withY:self.center.y withDuration:duration withDealy:BE_ANIMATION_DELAY];
}


-(void)scaling:(float)scale withDuration:(float)duration withDealy:(float)delay {
    [self scaling:scale withX:self.center.x withY:self.center.y withDuration:duration withDealy:delay withBlock:nil];
}

-(void)scaling:(float)scale withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block {
    [self scaling:scale withX:self.center.x withY:self.center.y withDuration:duration withDealy:delay withBlock:block];
}


-(void)scaling:(float)scale withX:(float)x withY:(float)y {
    [self scaling:scale withX:x withY:y withDuration:BE_ANIMATION_DURATION];
}


-(void)scaling:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration {
    [self scaling:scale withX:x withY:y withDuration:duration withDealy:BE_ANIMATION_DELAY];
}


-(void)scaling:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay {
    [self scaling:scale withX:x withY:y withDuration:duration withDealy:delay withBlock:nil];
}


-(void)scaling:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block {
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        [self scale:scale withX:x withY:y];
    } completion:^(BOOL finished) {
        if(block != nil) {
            block();
        }
    }];
}





-(void)scaleReal:(float)scale {
    [self scaleReal:scale withX:0 withY:0];
}


-(void)scaleReal:(float)scale withX:(float)x withY:(float)y {
    float scaleWidth = self.frame.size.width * scale;
    float scaleHeight = self.frame.size.height * scale;
    
    [self setFrame:CGRectMake(x - (scaleWidth / 2), y - (scaleHeight / 2), scaleWidth, scaleHeight)];
}


-(void)scaleReal:(float)scaleX withScaleY:(float)scaleY withX:(float)x withY:(float)y {
    CATransform3D xform = CATransform3DIdentity;
    xform = CATransform3DScale(xform, scaleX, scaleY, 1.0);
    xform = CATransform3DTranslate(xform, x, y, 0);
    self.layer.transform = xform;
}


-(void)scalingReal:(float)scale {
    [self scalingReal:scale withX:0 withY:0];
}


-(void)scalingReal:(float)scale withDuration:(float)duration {
    [self scalingReal:scale withX:0 withY:0 withDuration:duration withDealy:BE_ANIMATION_DURATION];
}


-(void)scalingReal:(float)scale withDuration:(float)duration withDealy:(float)delay {
    [self scalingReal:scale withX:0 withY:0 withDuration:duration withDealy:delay];
}


-(void)scalingReal:(float)scaleX withScaleY:(float)scaleY withDuration:(float)duration withDealy:(float)delay {
    [self scalingReal:scaleX withScaleY:scaleY withX:0 withY:0 withDuration:duration withDealy:delay];
}


-(void)scalingReal:(float)scale withX:(float)x withY:(float)y {
    [self scalingReal:scale withX:x withY:y withDuration:BE_ANIMATION_DURATION];
}


-(void)scalingReal:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration {
    [self scalingReal:scale withX:x withY:y withDuration:duration withDealy:BE_ANIMATION_DURATION];
}


-(void)scalingReal:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay {
    [self scalingReal:scale withScaleY:scale withX:x withY:y withDuration:duration withDealy:(float)delay];
}


-(void)scalingReal:(float)scaleX withScaleY:(float)scaleY withX:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay {
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.duration = duration;
    transformAnimation.beginTime = CACurrentMediaTime() + delay;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transformAnimation.removedOnCompletion = NO;
    transformAnimation.fillMode = kCAFillModeForwards;
    
    CATransform3D xform = CATransform3DIdentity;
    xform = CATransform3DScale(xform, scaleX, scaleY, 1.0);
    xform = CATransform3DTranslate(xform, x, y, 0);
    transformAnimation.toValue = [NSValue valueWithCATransform3D:xform];
    [self.layer addAnimation:transformAnimation forKey:@"transformAnimation"];
}

@end
