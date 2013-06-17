//
//  ContentReceiverView.h
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EnableDisable <NSObject>

-(void)selected:(BOOL)isSelected;
-(void)toDisplay:(BOOL)isDisplay;

@end

@protocol ScalableView <NSObject>

-(void)resizeScale:(CGFloat)scale;

@end

@interface ContentReceiverView : UIView<ScalableView>{
    
}

-(CGPoint) getContentPadding;
-(CGRect) getContentFrame;

@property(retain, nonatomic) UIView<EnableDisable,ScalableView>* bgContent;
@property(retain, nonatomic) UIView<ScalableView>* content;

@end