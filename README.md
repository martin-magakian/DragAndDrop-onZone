Drag And Drop into zones
================

1 - What it does
---------
The purpose of this prototype: 
- Drag and drop UIView from a UIScrollView **with scroll enable**
- Resize **all the component** based on the available space to display the image. Always fit the screen. (See ScalableView protocol)

I try to use [different libraries](https://github.com/search?l=Objective-C&q=drag+and+drop) in order to achive my goal.
As nothing fitted me need properly so I created my own component from scratch.

2 - How it work
---------
The whole componant is a DragDropManagerVC. It requiered some paramater:

- A list of "DragableStaticContainer". It's the View you can drag and drop
- An UIImage. It's the image to display
- A list of "ZoneView". It a zone on the image where you can drop your DragableStaticContainer into


Checkout the code source and read how the DragDropManagerVC in created:

	- (void)viewDidLoad
	{
	    [super viewDidLoad];

	    NSArray *dragableStaticControllers = [self dragableStaticControllers];
	    NSArray *zones = [self createZonesViewAndLinkTo:dragableStaticControllers];
	    
	    dd = [[DragDropManagerVC alloc] initWithDragableStaticControllers:dragableStaticControllers withZones:zones forZoneView:[self createZoneView]];
	    dd.view.frame = CGRectMake(20, 100, 700, 500);
	    dd.view.backgroundColor = [UIColor yellowColor];
	    
	    [self.view addSubview:dd.view];
	} 





Contact
=========
Developed by Martin Magakian

dev.martin.magakian@gmail.com

for [doduck prototype (en)](http://doduck.com/)

pour [doduck prototype (fr)](http://doduck.fr/)


License
=========
MIT License (MIT)

![githalytics.com alpha](https://cruel-carlota.pagodabox.com/945d1240166847ada02b5898f607fd98 "githalytics.com")

