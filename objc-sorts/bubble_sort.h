//
//  bubble_sort.h
//  objc-sorts
//
//  Created by Jesse Squires on 6/6/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import "sort_utils.h"

#ifndef objc_sorts_bubble_sort_h
#define objc_sorts_bubble_sort_h

void bubble_sort(NSMutableArray *arr)
{
    BOOL swapped = YES;
    
    while(swapped) {
        swapped = NO;
        
        for(int i = 0; i < arr.count - 1; i++) {
            if([[arr objectAtIndex:i] integerValue] > [[arr objectAtIndex:i + 1] integerValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
                swapped = YES;
            }
        }
    }
}

void test_bubble_sort(NSMutableArray *arr)
{
    NSLog(@"\n\nRunning bubble sort...");
    NSDate *start = [NSDate date];
    bubble_sort(arr);
    NSTimeInterval end = [start timeIntervalSinceNow] * -1;
    verfiySorted(arr);
    NSLog(@"Bubble sort DONE: %lf", end);
}

#endif
