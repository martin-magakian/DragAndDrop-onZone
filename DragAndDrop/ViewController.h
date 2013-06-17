//
//  ViewController.h
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragDropManagerVC.h"

@interface ViewController : UIViewController{
    DragDropManagerVC *dd;
    
    IBOutlet UILabel *resultCorrectLabel;
}



@end
