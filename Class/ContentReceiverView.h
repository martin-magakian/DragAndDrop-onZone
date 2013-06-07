//
//  ContentReceiverView.h
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentReceiverView : UIView{
    
}

-(CGPoint) getContentPadding;
-(CGRect)getContentFrame;

@property(retain, nonatomic) UIView* content;

@end
