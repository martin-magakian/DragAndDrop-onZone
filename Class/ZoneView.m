//
//  ZoneView.m
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "ZoneView.h"


@implementation ZoneView

@synthesize motherView,delegate,currentDragableView;

-(CGRect)positionInMother{
    return CGRectMake(self.frame.origin.x+motherView.frame.origin.x,
                      self.frame.origin.y+motherView.frame.origin.y,
                      self.frame.size.width,
                      self.frame.size.height);
}

-(void) dropIn:(DragableView *) dragableView{
    if(self.currentDragableView != nil){
        [delegate replace:self.currentDragableView by:dragableView from:self];
    }
    self.currentDragableView = dragableView;
}

-(void)movedOut:(DragableView *)dragableView{
    self.currentDragableView = nil;
}
-(void)movedIn:(DragableView *) dragableView{
    
}

@end
