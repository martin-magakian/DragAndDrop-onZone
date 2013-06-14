//
//  LabelScalableView.h
//  DragAndDrop
//
//  Created by martin on 14/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentReceiverView.h"

@interface LabelScalableView : UILabel<ScalableView>


-(void)fitCurrentFrame;

@end
