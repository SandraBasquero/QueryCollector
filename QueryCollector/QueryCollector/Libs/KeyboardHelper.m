//
//  KeyboardHelper.m
//  Epsilon
//
//  Created by Juan Benavides Romero on 30/09/14.
//  Copyright (c) 2014 Letshealth. All rights reserved.
//

#import "KeyboardHelper.h"

@implementation KeyboardHelper

+(void)showKeyboardWithAnimation:(float)position {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [KeyboardHelper showKeyboardWithAnimation:window.rootViewController.view withPosition:position];
}


+(void)showKeyboardWithAnimation:(UIView*)view withPosition:(float)position {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if(orientation == UIInterfaceOrientationLandscapeLeft) {
        if (systemVersion >= 8) {
            [view.layer setFrame:CGRectMake(0,-position, view.layer.frame.size.width, view.layer.frame.size.height)];
        } else {
            [view.layer setFrame:CGRectMake(-position,0, view.layer.frame.size.width, view.layer.frame.size.height)];
        }
    } else if(orientation == UIInterfaceOrientationLandscapeRight) {
        if (systemVersion >= 8) {
            [view.layer setFrame:CGRectMake(0,-position, view.layer.frame.size.width, view.layer.frame.size.height)];
        } else {
            [view.layer setFrame:CGRectMake(position,0, view.layer.frame.size.width, view.layer.frame.size.height)];
        }
    }
    
    [UIView commitAnimations];
}


+(void)hideKeyboardWithAnimation {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [KeyboardHelper hideKeyboardWithAnimation:window.rootViewController.view];
}


+(void)hideKeyboardWithAnimation:(UIView*)view {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(orientation == UIInterfaceOrientationLandscapeLeft) {
        [view.layer setFrame:CGRectMake(0,0, view.layer.frame.size.width, view.layer.frame.size.height)];
    } else if(orientation == UIInterfaceOrientationLandscapeRight) {
        [view.layer setFrame:CGRectMake(0,0, view.layer.frame.size.width, view.layer.frame.size.height)];
    }
    
    [UIView commitAnimations];
}


@end
