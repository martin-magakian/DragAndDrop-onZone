//
//  DragableVC.h
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentReceiverView.h"

@class ZoneView;
@class DragableView;
@class StaticView;

@protocol DragableViewEvent <NSObject>

-(void) isDragingStart:(DragableView *) dragableView;
-(void) isDragingEnd:(DragableView *) dragableView;
-(void) isDragingMoved:(DragableView *) dragableView;

@end

@protocol DragableViewAction <NSObject>

-(void) requestHome:(DragableView *) dragableView;
-(void) selected:(DragableView *) dragableView;

@end

@protocol DragableViewList <NSObject>

-(void) isTap:(DragableView *)touched;

@end


@protocol DragableManager <DragableViewAction,DragableViewEvent>
//nothing
@end

@protocol DragableListManager <DragableViewList,DragableViewEvent>
//nothing
@end



@protocol StaticViewEvent <NSObject>

-(void) isStaticTap:(StaticView *) staticView;

@end

@protocol ZoneEvent <NSObject>

-(void) replace:(DragableView *)oldDragable by:(DragableView *)newDragble;
-(void) isZoneTouched:(ZoneView *)touchedZone;

@end

@interface DragableView : ContentReceiverView{
    CGPoint touchStart;
    CGRect originalFrame;
}
@property(assign) CGPoint correction;
@property(retain, nonatomic) id<DragableListManager> delegate;
@property(retain,nonatomic) StaticView *staticView;
@property(retain, nonatomic) ZoneView *currentZone;
@property(assign) BOOL isHome;

-(void)movedOutZone:(ZoneView *)matchingZone;
-(void)movedInZone:(ZoneView *) matchingZone;
-(void)dropInZone:(ZoneView *)zone;

-(void)setUnSelected;
-(void)setSelected;


@end