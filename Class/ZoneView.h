//
//  ZoneView.h
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragableView.h"

@interface ZoneView : UIView{
    
}

@property(retain, nonatomic) UIView *motherView;

-(CGRect)positionInMother;

-(void)movedOut:(DragableView *)dragableView;
-(void)movedIn:(DragableView *) dragableView;
-(void) dropIn:(DragableView *) dragableView;

@end
