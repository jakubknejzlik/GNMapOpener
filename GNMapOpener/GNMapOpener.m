//
//  GNMapOpener.m
//  GNMapOpenerExample
//
//  Created by Jakub Knejzlik on 09/04/15.
//  Copyright (c) 2015 Jakub Knejzlik. All rights reserved.
//

#import "GNMapOpener.h"

#import <CWLSynthesizeSingleton.h>
#import <UIActionSheet+Blocks.h>

#import "GNAppleMapOpenerService.h"
#import "GNGoogleMapOpenerService.h"

@interface GNMapOpener () /*<UIActionSheetDelegate>*/

@end

@implementation GNMapOpener
CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(GNMapOpener, sharedInstance);

-(void)openItem:(GNMapOpenerItem *)item{
    NSArray *services = [self availableServices];
    if (services.count == 1) {
        [self openItem:item withService:[services firstObject]];
    }else{
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
//        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Open in...", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) destructiveButtonTitle:nil otherButtonTitles:nil];
        
        NSMutableArray *titles = [NSMutableArray array];
        for (GNMapOpenerService *service in services) {
            [titles addObject:service.name];
        }
        
        [UIActionSheet showInView:window withTitle:NSLocalizedString(@"Open in...", nil) cancelButtonTitle:NSLocalizedString(@"Cancel", nil) destructiveButtonTitle:nil otherButtonTitles:titles tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
            if (actionSheet.cancelButtonIndex != buttonIndex) {
                GNMapOpenerService *service = services[buttonIndex];
                [self openItem:item withService:service];
            }
        }];
        
//        [actionSheet showInView:window];
    }
}
-(void)openItem:(GNMapOpenerItem *)item withService:(GNMapOpenerService *)service{
    [service openItem:item];
}

-(NSArray *)availableServices{
    NSMutableArray *array = [NSMutableArray array];
    
    if ([GNAppleMapOpenerService isAvailable]) {
        [array addObject:[[GNAppleMapOpenerService alloc] init]];
    }
    if ([GNGoogleMapOpenerService isAvailable]) {
        [array addObject:[[GNGoogleMapOpenerService alloc] init]];
    }
    
    return array;
}
//
//#pragma mark - Action Sheet Delegate methods
//
//-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    NSLog(@"%i",(int)buttonIndex);
//    if (actionSheet.cancelButtonIndex != buttonIndex) {
//        NSArray *services = [self availableServices];
//        [self openItems:<#(NSArray *)#> withService:<#(GNMapOpenerService *)#>]
//    }
//}

@end
