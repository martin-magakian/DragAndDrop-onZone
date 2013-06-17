//
//  DragableVC.m
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "DragableView.h"
#import "ZoneView.h"

@implementation DragableView

@synthesize delegate,staticView,isHome, currentZone;

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addTapGesture];
        self.isHome = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    touchStart = [[touches anyObject] locationInView:self];
    [delegate isDragingStart:self];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [delegate isDragingEnd:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    self.center = CGPointMake(self.center.x + point.x - touchStart.x, self.center.y + point.y - touchStart.y);
    [delegate isDragingMoved:self];
}

-(void)movedOutZone:(ZoneView *)matchingZone{
    [self.bgContent toDisplay:YES];
}

-(void)movedInZone:(ZoneView *) matchingZone{
    [self.bgContent toDisplay:NO];
}


-(void)setUnSelected{
    [self.bgContent selected:NO];
}

-(void)setSelected{
    [self.bgContent selected:YES];
}

- (void)dropInZone:(ZoneView *)zone{
    self.currentZone = zone;
    CGRect zonePos = [zone positionInMother];
    CGPoint contentPadding = [self getContentPadding];
    CGRect newPositionTopLeft = CGRectMake(zonePos.origin.x - contentPadding.x,
                                     zonePos.origin.y - contentPadding.y,
                                     self.frame.size.width,
                                     self.frame.size.height);
    
    CGRect newPositionCenter = CGRectMake(newPositionTopLeft.origin.x + zone.frame.size.width/2 - self.content.frame.size.width/2,
                                          newPositionTopLeft.origin.y + zone.frame.size.height/2 - self.content.frame.size.height/2,
                                          newPositionTopLeft.size.width,
                                          newPositionTopLeft.size.height);
    
    [UIView animateWithDuration:0.4 animations:^{
                         self.frame = newPositionCenter;
                     } completion:nil];
}

-(void) addTapGesture{
    UITapGestureRecognizer *touchOnView = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapUpInside)] autorelease];
    
    [touchOnView setNumberOfTapsRequired:1];
    [touchOnView setNumberOfTouchesRequired:1];
    
    [self addGestureRecognizer:touchOnView];
}

-(void)tapUpInside{
    [delegate isTap:self];
}

-(void)dealloc{
    [delegate release];
    [staticView release];
    [currentZone release];
    [super dealloc];
}

@end
