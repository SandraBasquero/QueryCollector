//
//  KeyboardHelper.h
//  Epsilon
//
//  Created by Juan Benavides Romero on 30/09/14.
//  Copyright (c) 2014 Letshealth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KeyboardHelper : NSObject

+(void)showKeyboardWithAnimation:(float)position;
+(void)showKeyboardWithAnimation:(UIView*)view withPosition:(float)position;

+(void)hideKeyboardWithAnimation;
+(void)hideKeyboardWithAnimation:(UIView*)view;

@end
