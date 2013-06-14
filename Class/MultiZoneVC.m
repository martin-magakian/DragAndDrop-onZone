//
//  DragableZoneVC.m
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "MultiZoneVC.h"


@implementation MultiZoneVC

-(id)initWithZones:(NSArray *)_zoneViews withBg:(UIView *)_bgView delegate:(id<ZoneEvent>)_delegate{
    self = [super init];
    if(self){        
        bgView = [_bgView retain];
        zoneViews = [_zoneViews retain];
        delegate = [_delegate retain];
        [self assignDependancyToZones];
    }
    return self;
}

-(void)assignDependancyToZones{
    for(ZoneView *zv in zoneViews){
        zv.delegate = delegate;
        zv.motherView = self.view;
    }
}

-(void) viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    passView = [[PassthroughView alloc] initWithFrame:CGRectMake(0, 0, 0, 00)];
    passView.backgroundColor = [UIColor brownColor];
    self.view = passView;
}

-(void)setup{
    [self.view addSubview:bgView];
    [self addZonesView];
    [self addTapGesture];
}

-(void) addZonesView{
    for(UIView *zone in zoneViews){
        [self.view addSubview:zone];
    }
}


-(ZoneView *) inAZone:(DragableView *) dragableView{
    
    CGRect content = [dragableView getContentFrame];
    
    for(ZoneView *zoneView in zoneViews){
        CGRect posInMother = [zoneView positionInMother];
        
        if(CGRectIntersectsRect(posInMother,content)){
            return zoneView;
        }
    }
    return nil;
}

-(void) addTapGesture{
    UITapGestureRecognizer *touchOnView = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIsUnselect)] autorelease];
    
    [touchOnView setNumberOfTapsRequired:1];
    [touchOnView setNumberOfTouchesRequired:1];
    
    [passView addGestureRecognizer:touchOnView];
}

-(void)tapIsUnselect{
    [delegate tapIsUnselect];
}

@end
