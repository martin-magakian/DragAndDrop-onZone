//
//  DragDropVC.m
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//
#import "DragDropManagerVC.h"
#import "ZoneView.h"

@implementation DragDropManagerVC

-(id)initWithDragableStaticControllers:(NSArray *)_dragableStaticControllers withZones:(NSArray *)_zones forZoneView:(UIView *)_zoneView{
    self = [super init];
    if(self){
        dragableStaticControllers = [_dragableStaticControllers retain];
        zones = [_zones retain];
        zoneView = [_zoneView retain];
    }
    return self;
}

-(void)viewDidLoad{
    dList = [[DragableListVC alloc] initWithDragableStaticContainers:dragableStaticControllers withDelegate:self];
    dList.view.frame = CGRectMake(50, 50, 120, 300);
    [dList createScrollWithDragableItems];
    [self.view addSubview:dList.view];
    
    dZone = [[MultiZoneVC alloc] initWithZones:zones withBg:zoneView delegate:self];
    dZone.view.frame = CGRectMake(200, 50, zoneView.frame.size.width, zoneView.frame.size.height);
    [self.view addSubview:dZone.view];
}

-(void) isDragingStart:(DragableView *) dragableView{
    
    if([dList isInList:dragableView]){
        CGRect dragFrom = [dList positionInScrollViewForMotherView:dragableView.staticView];
        dragableView.frame = dragFrom;
        [self.view addSubview:dragableView];
    }
}

-(void)backToOrigin:(DragableView *)dragableView{
    CGRect goTo = [dList positionInScrollViewForMotherView:dragableView.staticView];
    
    
    [UIView animateWithDuration:0.4 animations:^{
        dragableView.frame = goTo;
    } completion:^(BOOL finished){
        dragableView.frame = dragableView.staticView.frame;
        [dList.view addSubview:dragableView];
    }];
}

-(void) replace:(DragableView *)oldDragable by:(DragableView *)newDragble from:(ZoneView *)zone{
    [oldDragable movedOutZone:zone];
    [self backToOrigin:oldDragable];
}

-(void) isDragingEnd:(DragableView *) dragableView{
    
    ZoneView *matchingZone = [dZone inAZone:dragableView];
    if(matchingZone != nil){
        [matchingZone dropIn:dragableView];
        [dragableView dropInZone:matchingZone];
    }else{
        [self backToOrigin:dragableView];
    }
    lastOverZone = nil;
}

-(void) isDragingMoved:(DragableView *) dragableView{
    
    ZoneView *matchingZone = [dZone inAZone:dragableView];
    if(matchingZone != nil){
        [matchingZone movedIn:dragableView];
        [dragableView movedInZone:matchingZone];
        lastOverZone = matchingZone;
    }else if(lastOverZone != nil){
        [lastOverZone movedOut:dragableView];
        [dragableView movedOutZone:lastOverZone];
        lastOverZone = nil;
    }

}

-(void)dealloc{
    [dragableStaticControllers release];
    [dList release];
    [super dealloc];
}


@end
