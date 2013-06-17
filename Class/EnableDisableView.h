//
//  EnableDisableView.h
//  DragAndDrop
//
//  Created by martin on 13/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentReceiverView.h"

@interface EnableDisableView : UIView<EnableDisable,ScalableView>{
    BOOL isEnable;
    CGFloat scale;
}

- (id)initWithFrame:(CGRect)frame isEnable:(BOOL)enable;

@property(retain,nonatomic) UIImageView* top;
@property(retain,nonatomic) UIImageView* middle;
@property(retain,nonatomic) UIImageView* bottom;

@end
