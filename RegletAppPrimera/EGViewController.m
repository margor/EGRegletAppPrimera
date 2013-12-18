//
//  EGViewController.m
//  RegletAppPrimera
//
//  Created by Esther Gordo Ramos on 17/12/13.
//  Copyright (c) 2013 RegletApp. All rights reserved.
//

#import "EGViewController.h"

@interface EGViewController ()

@end

@implementation EGViewController{
    CALayer *regleta;
    UIPanGestureRecognizer *panMoverRegleta;
    UITapGestureRecognizer *tapMoverRegleta;
    NSArray *botonesArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    botonesArray = [[NSArray alloc]initWithObjects:_unoButtonOutlet, _dosButtonOutlet, _tresButtonOutlet,_cuatroButtonOutlet,_cincoButtonOutlet,_seisButtonOutlet,_sieteButtonOutlet,_ochoButtonOutlet,_nueveButtonOutlet,_diezButtonOutlet, nil];
    for (UIButton *boton in botonesArray) {
        boton.tintColor = [UIColor whiteColor];
    }

    
    self.view.backgroundColor = [UIColor colorWithRed:0.774 green:0.772 blue:0.730 alpha:1.000];
	// Do any additional setup after loading the view, typically from a nib.
    _unoButtonOutlet.backgroundColor = [UIColor whiteColor];
    _dosButtonOutlet.backgroundColor = [UIColor colorWithRed:1 green:0.2 blue:0.3 alpha:1];
    _tresButtonOutlet.backgroundColor = [UIColor colorWithRed:0.287 green:0.661 blue:0.136 alpha:1.000];
    _cuatroButtonOutlet.backgroundColor = [UIColor colorWithRed:0.4 green:0.2 blue:0.3 alpha:1];
    _cincoButtonOutlet.backgroundColor = [UIColor yellowColor];
    _seisButtonOutlet.backgroundColor = [UIColor colorWithRed:0 green:0.4 blue:0.3 alpha:1];
    _sieteButtonOutlet.backgroundColor = [UIColor blackColor];
    _ochoButtonOutlet.backgroundColor = [UIColor colorWithRed:0.55 green:0.4 blue:0.35 alpha:1.000];
    _nueveButtonOutlet.backgroundColor = [UIColor colorWithRed:0.000 green:0.334 blue:0.654 alpha:1.000];
    _diezButtonOutlet.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.000 alpha:1.000];

    regleta = [CALayer layer];
    panMoverRegleta = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moverRegleta:)];
    tapMoverRegleta = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moverRegleta:)];
    [self.view addGestureRecognizer:panMoverRegleta];
    [self.view addGestureRecognizer:tapMoverRegleta];
    
//    panMoverRegleta = [[UIPanGestureRecognizer alloc] init];
//    [self.view addGestureRecognizer:panMoverRegleta];
//
//    tapMoverRegleta = [[UITapGestureRecognizer alloc] init];
//    [self.view addGestureRecognizer:tapMoverRegleta];
    
    
    int maxXPantallaInt = [NSNumber numberWithFloat:CGRectGetMaxX(self.view.bounds)].floatValue;
    int maxYPantallaInt = [NSNumber numberWithFloat:CGRectGetMaxY(self.view.bounds)].floatValue;
    for (int i = 0; i<maxXPantallaInt; i=i+30) {
        for (int j = 0; j<maxYPantallaInt; j=j+30){
            CALayer *mark = [CALayer layer];
            float radio = 4;
            float coordXAleatoriaFloat = i;
            float coordYAleatoriaFloat = j;
            
            mark.bounds = CGRectMake(0, 0, radio/2, radio/2);
            mark.position = CGPointMake(coordXAleatoriaFloat,coordYAleatoriaFloat);
            //mark.anchorPoint = CGPointMake(0.5,0.5);
            mark.backgroundColor = [UIColor whiteColor].CGColor;
            mark.cornerRadius = radio;
            [self.view.layer addSublayer:mark];
            
        }
    }
    
//    for (int i = 1; i<150; i++) {
//        CALayer *estrellasLayer = [CALayer layer];
//        
//        float coordXAleatoriaFloat = (arc4random()%(maxXPantallaInt));
//        float coordYAleatoriaFloat = (arc4random()%(maxYPantallaInt));
//        //variable = limite_inferior + rand() % (limite_superior +1 - limite_inferior) ;
//        float maxDiamEstrellaFloat = (1+arc4random()%5);
//        
//        estrellasLayer.bounds = CGRectMake(0, 0, maxDiamEstrellaFloat, maxDiamEstrellaFloat);
//        estrellasLayer.position = CGPointMake(coordXAleatoriaFloat, coordYAleatoriaFloat);
//        
//        estrellasLayer.cornerRadius = maxDiamEstrellaFloat/2;
//        estrellasLayer.backgroundColor = [UIColor whiteColor].CGColor;
//        [self.view.layer addSublayer:estrellasLayer];
//        
//    }

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moverRegleta: (UIGestureRecognizer *)recognizer //withRegleta:(CALayer*)localRegleta
{
    regleta.position = [recognizer locationInView:self.view];
    int recognizerX = [recognizer locationInView:self.view].x;
    int posicionX = recognizerX - recognizerX%28;
    int recognizerY = [recognizer locationInView:self.view].y;
    int posicionY = recognizerY - recognizerY%28;
    NSLog(@"recognizer x: %f recognizer Y: %f",[recognizer locationInView:self.view].x, [recognizer locationInView:self.view].y );
    NSLog(@"posicion x: %i posicion Y: %i",posicionX,posicionY);
    if (recognizer.state == UIGestureRecognizerStateEnded)
            {
                regleta.position = CGPointMake(posicionX, posicionY);
            }
}


-(void)crearRegleta: (UIButton *)button
{
    //CALayer *regleta = [CALayer layer];
    regleta.bounds = CGRectMake(button.center.x,button.center.y, button.frame.size.width, button.frame.size.height);
    regleta.position = CGPointMake(button.center.x,button.center.y);
    regleta.anchorPoint = CGPointMake(0.5,0.5);
    regleta.backgroundColor = button.backgroundColor.CGColor;
    
    //tapMoverRegleta = [[UITapGestureRecognizer alloc] init];
    //[self moverRegleta:tapMoverRegleta withRegleta:regleta];
    //[self.view addGestureRecognizer:tapMoverRegleta];
    
    //[self moverRegleta:panMoverRegleta withRegleta:regleta];
    

    [self.view.layer addSublayer:regleta];
    
}

- (IBAction)unoAction:(id)sender
{
    [self crearRegleta:sender];
    }
- (IBAction)dosAction:(id)sender
{
    [self crearRegleta:sender];
}
- (IBAction)tresAction:(id)sender
{
    [self crearRegleta:sender];
}
- (IBAction)cuatroAction:(id)sender
{
    [self crearRegleta:sender];
}
- (IBAction)cincoAction:(id)sender
{
    [self crearRegleta:sender];
}
- (IBAction)seisAction:(id)sender
{
    [self crearRegleta:sender];
}
- (IBAction)sieteAction:(id)sender
{
    [self crearRegleta:sender];
}
- (IBAction)ochoAction:(id)sender
{
    [self crearRegleta:sender];
}
- (IBAction)nueveAction:(id)sender
{
    [self crearRegleta:sender];
}
- (IBAction)diezAction:(id)sender
{
    [self crearRegleta:sender];
}
@end
