//
//  DragableListVC.h
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragableView.h"

@interface DragableListVC : UIViewController<DragableListManager,StaticViewEvent>{
    NSArray* dragableStaticContainers;
    UIScrollView *scroll;
    id<DragableManager> delegate;
    DragableView *currentSelected;
}

-(id)initWithDragableStaticContainers:(NSArray *)_dragableItems withDelegate:(id<DragableViewEvent>)_delegate;
-(void)createScrollWithDragableItems;
-(BOOL)isInList:(DragableView *) dragableView;
-(CGRect) positionInScrollViewForMotherView:(StaticView *)staticView;
-(void)enableScrool:(BOOL)enable;

@end
