//
//  DragableVC.h
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentReceiverView.h"
#import "StaticView.h"


@class ZoneView;
@class DragableView;

@protocol DragableViewEvent <NSObject>

-(void) isDragingStart:(DragableView *) dragableView;
-(void) isDragingEnd:(DragableView *) dragableView;
-(void) isDragingMoved:(DragableView *) dragableView;

@end

@interface DragableView : ContentReceiverView{
    CGPoint touchStart;
    CGRect originalFrame;
}
@property(assign) CGPoint correction;
@property(retain, nonatomic) id<DragableViewEvent> delegate;
@property(retain,nonatomic) StaticView *staticView;

-(void)movedOutZone:(ZoneView *)matchingZone;
-(void)movedInZone:(ZoneView *) matchingZone;
- (void)dropInZone:(ZoneView *)zone;


@end