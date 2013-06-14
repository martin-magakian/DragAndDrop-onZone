//
//  ZoneView.m
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "ZoneView.h"


@implementation ZoneView

@synthesize motherView,delegate,currentDragableView,correctDragableView;

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addTapGesture];
    }
    return self;
}

-(CGRect)positionInMother{
    return CGRectMake(self.frame.origin.x+motherView.frame.origin.x,
                      self.frame.origin.y+motherView.frame.origin.y,
                      self.frame.size.width,
                      self.frame.size.height);
}

-(void) correction{
    if([self isGoodAwnser]){
        self.backgroundColor = [UIColor greenColor];
    }else{
        self.backgroundColor = [UIColor redColor];
    }
}

-(BOOL) isGoodAwnser{
    
    if(correctDragableView != nil && currentDragableView != nil){
        NSLog(@"no good ?");
    }
    
    return currentDragableView == correctDragableView;
}

-(void) dropIn:(DragableView *) dragableView{
    if(self.currentDragableView != nil){
        [delegate replace:self.currentDragableView by:dragableView];
    }
    self.currentDragableView = dragableView;
}

-(void)movedOut:(DragableView *)dragableView{
    //In order to don't loose the reference when an other view is comming by...
    if(self.currentDragableView == dragableView){
        self.currentDragableView = nil;
    }
}

-(void)movedIn:(DragableView *) dragableView{
    
}

-(void) addTapGesture{
    UITapGestureRecognizer *touchOnView = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapUpInside)] autorelease];
    
    [touchOnView setNumberOfTapsRequired:1];
    [touchOnView setNumberOfTouchesRequired:1];
    
    [self addGestureRecognizer:touchOnView];
}

-(void)tapUpInside{
    [delegate isZoneTouched:self];
}

@end
