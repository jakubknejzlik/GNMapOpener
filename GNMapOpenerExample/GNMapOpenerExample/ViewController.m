//
//  ViewController.m
//  GNMapOpenerExample
//
//  Created by Jakub Knejzlik on 09/04/15.
//  Copyright (c) 2015 Jakub Knejzlik. All rights reserved.
//

#import "ViewController.h"

#import "GNMapOpener.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)showLocation:(id)sender {
    CLLocation *location = [[CLLocation alloc] initWithLatitude:49.195589 longitude:16.608912];
    GNMapOpenerItem *item = [[GNMapOpenerItem alloc] initWithLocation:location];
    item.name = @"test destination";
    item.directionsType = GNMapOpenerDirectionsTypeWalk;
    [[GNMapOpener sharedInstance] openItem:item];
}

@end
