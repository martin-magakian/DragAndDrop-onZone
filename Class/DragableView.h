//
//  DragableVC.h
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ZoneView;
@class DragableView;

@protocol DragableViewEvent <NSObject>

-(void) isDragingStart:(DragableView *) dragableView;
-(void) isDragingEnd:(DragableView *) dragableView;
-(void) isDragingMoved:(DragableView *) dragableView;

@end

@interface DragableView : UIView{
    CGPoint touchStart;
    CGRect originalFrame;
}
@property(assign) CGPoint correction;
@property(retain, nonatomic) UIView* content;
@property(retain, nonatomic) id<DragableViewEvent> delegate;

-(CGRect)getContentFrame;

-(void)movedOutZone:(ZoneView *)matchingZone;
-(void)movedInZone:(ZoneView *) matchingZone;
- (void)dropInZone:(ZoneView *)zone;


@end