//
//  UIView+Animations.h
//  Epsilon
//
//  Created by Juan Benavides Romero on 05/06/14.
//  Copyright (c) 2014 Letshealth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animations)


-(void)fadeIn;
-(void)fadeIn:(float)duration;
-(void)fadeIn:(float)duration withDelay:(float)delay;
-(void)fadeIn:(float)duration withDelay:(float)delay withBlock:(void (^)(void))block;


-(void)fadeOut;
-(void)fadeOut:(float)duration;
-(void)fadeOut:(float)duration withDelay:(float)delay;
-(void)fadeOut:(float)duration withDelay:(float)delay withBlock:(void (^)(void))block;


-(void)move:(float)x withY:(float)y;
-(void)moving:(float)x withY:(float)y;
-(void)moving:(float)x withY:(float)y withDuration:(float)duration;
-(void)moving:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay;
-(void)moving:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block;
-(void)moving:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block withOptions:(UIViewAnimationOptions)options;


typedef NS_ENUM(NSInteger, EpsilonMovingRebounds) {
    EpsilonMovingReboundsLight = (1 << 0),
    EpsilonMovingReboundsHeavy = (1 << 1)
};

-(void)movingRebound:(float)x withY:(float)y;
-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration;
-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay;
-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block;
-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block withRebound:(EpsilonMovingRebounds)rebound;
-(void)movingRebound:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block withTimingFuncition:(CAMediaTimingFunction*)timingFunction;


-(void)scale:(float)scale;
-(void)scale:(float)scale withX:(float)x withY:(float)y;
-(void)scaling:(float)scale;
-(void)scaling:(float)scale withDuration:(float)duration;
-(void)scaling:(float)scale withDuration:(float)duration withDealy:(float)delay;
-(void)scaling:(float)scale withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block;


-(void)scaleReal:(float)scale;
-(void)scaleReal:(float)scale withX:(float)x withY:(float)y;
-(void)scaleReal:(float)scaleX withScaleY:(float)scaleY withX:(float)x withY:(float)y;
-(void)scalingReal:(float)scale;
-(void)scalingReal:(float)scale withDuration:(float)duration;
-(void)scalingReal:(float)scale withDuration:(float)duration withDealy:(float)delay;
-(void)scalingReal:(float)scaleX withScaleY:(float)scaleY withDuration:(float)duration withDealy:(float)delay;
-(void)scalingReal:(float)scale withX:(float)x withY:(float)y;
-(void)scalingReal:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration;
-(void)scalingReal:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay;
-(void)scalingReal:(float)scaleX withScaleY:(float)scaleY withX:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay;


-(void)scaling:(float)scale withX:(float)x withY:(float)y;
-(void)scaling:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration;
-(void)scaling:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay;
-(void)scaling:(float)scale withX:(float)x withY:(float)y withDuration:(float)duration withDealy:(float)delay withBlock:(void (^)(void))block;

@end
