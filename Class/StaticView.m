//
//  StaticView.m
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "StaticView.h"

@implementation StaticView

@synthesize delegate, dragableView;

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addTapGesture];
    }
    return self;
}

-(void) addTapGesture{
    UITapGestureRecognizer *touchOnView = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapUpInside)] autorelease];
    
    [touchOnView setNumberOfTapsRequired:1];
    [touchOnView setNumberOfTouchesRequired:1];
    
    [self addGestureRecognizer:touchOnView];
}

-(void)tapUpInside{
    [delegate isStaticTap:self];
}

@end
