//
//  DragDropVC.m
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//
#import "DragDropManagerVC.h"
#import "ZoneView.h"
#import "StaticView.h"


@implementation DragDropManagerVC

#define DRAGABLE_ZONE_HEIGHT 420
#define DRAGABLE_ZONE_WIDTH 480

@synthesize currentSelectedDragableView;

-(id)initWithDragableStaticControllers:(NSArray *)_dragableStaticControllers withZones:(NSArray *)_zones forZoneView:(UIView *)_zoneView{
    self = [super init];
    if(self){
        dragableStaticControllers = [_dragableStaticControllers retain];
        zones = [_zones retain];
        zoneView = [_zoneView retain];
        [self addTapGesture];
    }
    return self;
}


-(CGFloat)resizedScale:(UIView *)bgView{
    CGSize iHave = CGSizeMake(DRAGABLE_ZONE_WIDTH, DRAGABLE_ZONE_HEIGHT);
    CGSize iNeed = bgView.frame.size;
    
    CGFloat diffWidth = iHave.width - iNeed.width;
    CGFloat diffHeight = iHave.height - iNeed.height;
    
    CGFloat scaleW = 1;
    CGFloat scaleH = 1;
    
    if(diffWidth < 0){
        //miss space on width
        scaleW = iHave.width / iNeed.width ;
    }
    
    if(diffHeight < 0){
        //miss space on height
        scaleH = iHave.height / iNeed.height;
    }
    
    return fminf(scaleW, scaleH);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    CGFloat scale = [self resizedScale:zoneView];
    
    dList = [[DragableListVC alloc] initWithDragableStaticContainers:dragableStaticControllers withDelegate:self];
    [dList resizeScale:scale];
    dList.view.frame = CGRectMake(50, 50, 120, 300);
    [dList createScrollWithDragableItems];
    [self.view addSubview:dList.view];
    
    dZone = [[MultiZoneVC alloc] initWithZones:zones withBg:zoneView delegate:self];
    dZone.view.frame = CGRectMake(200, 50, DRAGABLE_ZONE_WIDTH, DRAGABLE_ZONE_HEIGHT);
    [dZone resizeScale:scale];
    [self.view addSubview:dZone.view];
}

-(void)invisiblePopOutDragableList:(DragableView *) dragableView{
    //the dragableView will exit the DragableListVC and go on top view
    CGRect dragFrom = [dList positionInScrollViewForMotherView:dragableView.staticView];
    dragableView.frame = dragFrom;
    dragableView.isHome = NO;
    [self.view addSubview:dragableView];
}

-(void) correction{
    return [dZone correction];
}

-(BOOL) isGoodAwnser{
    return [dZone isGoodAwnser];
}

-(void) isDragingStart:(DragableView *) dragableView{
    
    if([dList isInList:dragableView]){
        [self invisiblePopOutDragableList:dragableView];

    }
}

-(void)backToOrigin:(DragableView *)dragableView{
    
    [dList enableScrool:YES]; //bug correction when drop dragableView in UIScroll view we get an tap event and note a drop event.
    [self tapIsUnselect]; //if back to home we can't have anything selected anymore
    
    if(dragableView.currentZone != nil){
        [dragableView.currentZone movedOut:dragableView];
        [dragableView movedOutZone:dragableView.currentZone];
    }
    
    CGRect goTo = [dList positionInScrollViewForMotherView:dragableView.staticView];
    
    
    [UIView animateWithDuration:0.4 animations:^{
        dragableView.frame = goTo;
    } completion:^(BOOL finished){
        dragableView.frame = dragableView.staticView.frame;
        [dList.view addSubview:dragableView];
        dragableView.isHome = YES;
    }];
}

-(void) replace:(DragableView *)oldDragable by:(DragableView *)newDragble{
    [oldDragable movedOutZone:oldDragable.currentZone];
    [oldDragable.currentZone movedOut:oldDragable];
    [self backToOrigin:oldDragable];
}

-(void) isTap:(DragableView *) dragableView{
    [self backToOrigin:dragableView];
}

-(void)requestHome:(DragableView *)dragableView{
    [self backToOrigin:dragableView];
}

-(void) selected:(DragableView *) dragableView{
    self.currentSelectedDragableView = dragableView;
}

-(void) isZoneTouched:(ZoneView *)touchedZone{
    if(self.currentSelectedDragableView != nil){
        [self invisiblePopOutDragableList:self.currentSelectedDragableView];
        [self movedIn:self.currentSelectedDragableView matchingZone:touchedZone];
        [self dropIn:self.currentSelectedDragableView intoMatchingZone:touchedZone];
    }
}

- (void)dropIn:(DragableView *)dragableView intoMatchingZone:(ZoneView *)matchingZone {
    [matchingZone dropIn:dragableView];
    [dragableView dropInZone:matchingZone];
    dragableView.isHome = NO;
}

-(void) isDragingEnd:(DragableView *) dragableView{
    
    ZoneView *matchingZone = [dZone inAZone:dragableView];
    if(matchingZone != nil){
        [self dropIn:dragableView intoMatchingZone:matchingZone];
    }else{
        [self backToOrigin:dragableView];
    }
    lastOverZone = nil;
}

- (void)movedIn:(DragableView *)dragableView matchingZone:(ZoneView *)matchingZone {
    [matchingZone movedIn:dragableView];
    [dragableView movedInZone:matchingZone];
}

-(void) isDragingMoved:(DragableView *) dragableView{
    
    ZoneView *matchingZone = [dZone inAZone:dragableView];
    
    if(matchingZone != lastOverZone && lastOverZone != nil){
        [lastOverZone movedOut:dragableView];
        [dragableView movedOutZone:lastOverZone];
    }
    
    if(matchingZone != nil){
        if(lastOverZone != matchingZone){
            [self movedIn:dragableView matchingZone:matchingZone];
        }
    }
    
    lastOverZone = matchingZone;
}

-(void) addTapGesture{
    UITapGestureRecognizer *touchOnView = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIsUnselect)] autorelease];
    
    [touchOnView setNumberOfTapsRequired:5];
    [touchOnView setNumberOfTouchesRequired:1];
    
    [self.view addGestureRecognizer:touchOnView];
}

-(void)tapIsUnselect{
    [currentSelectedDragableView setUnSelected];
    self.currentSelectedDragableView = nil;
}

-(void)dealloc{
    [dragableStaticControllers release];
    [currentSelectedDragableView release];
    [dList release];
    [dZone release];
    [zones release];
    [zoneView release];
    [super dealloc];
}


@end
