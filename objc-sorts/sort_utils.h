//
//  sort_utils.h
//  objc-sorts
//
//  Created by Jesse Squires on 6/7/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#ifndef objc_sorts_sort_utils_h
#define objc_sorts_sort_utils_h

#define MAX_COUNT 10000

NSMutableArray* randomNumbersArray()
{
    NSMutableArray *list = [[NSMutableArray alloc] init];
    
    for(NSUInteger i = 0; i < MAX_COUNT; i++) {
        int num = arc4random() % INT16_MAX;
        BOOL sign = ((arc4random() % 2) + 1) % 2 == 0;
        num *= (sign ? -1 : 1);
        [list addObject:[NSNumber numberWithInteger:num]];
    }
    return list;
}

BOOL verfiySorted(NSMutableArray *arr)
{
    NSLog(@"Verifying sorted list...");
    for(NSUInteger i = 0; i < arr.count-1; i++) {
        NSInteger a = [[arr objectAtIndex:i] integerValue];
        NSInteger b = [[arr objectAtIndex:i+1] integerValue];
        if(a > b) {
            NSLog(@"** List is NOT sorted! **");
            return NO;
        }
    }
    NSLog(@"List is sorted!");
    return YES;
}

#endif
