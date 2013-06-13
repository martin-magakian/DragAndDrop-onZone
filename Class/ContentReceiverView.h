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

@interface ContentReceiverView : UIView{
    
}

-(CGPoint) getContentPadding;
-(CGRect)getContentFrame;

@property(retain, nonatomic) UIView<EnableDisable>* bgContent;
@property(retain, nonatomic) UIView* content;

@end
