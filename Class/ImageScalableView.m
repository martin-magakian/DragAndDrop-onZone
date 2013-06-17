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

    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.frame.size.width * scale,
                            self.frame.size.height * scale);
}


@end
