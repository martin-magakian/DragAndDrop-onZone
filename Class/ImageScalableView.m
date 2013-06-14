//
//  ImageScalableView.m
//  DragAndDrop
//
//  Created by martin on 14/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "ImageScalableView.h"

@implementation ImageScalableView

-(void)resizeScale:(CGFloat)scale{
    self.frame = CGRectMake(0,
                            0,
                            self.frame.size.width * scale,
                            self.frame.size.height * scale);
}


@end
