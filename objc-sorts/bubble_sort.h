//
//  Jesse Squires
//  http://www.hexedbits.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) Jesse Squires
//

#import "sort_utils.h"

#ifndef objc_sorts_bubble_sort_h
#define objc_sorts_bubble_sort_h

void bubble_sort(NSMutableArray *arr)
{
    BOOL swapped = YES;
    NSInteger k = 0;
    
    while (swapped) {
        swapped = NO;
        
        for (NSInteger i = 0; i < arr.count - 1 - k; i++) {
            if([[arr objectAtIndex:i] integerValue] > [[arr objectAtIndex:i + 1] integerValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
                swapped = YES;
            }
        }
        k++;
    }
}

void test_bubble_sort(NSMutableArray *arr)
{
    NSLog(@"Running bubble sort...");
    NSDate *start = [NSDate date];
    bubble_sort(arr);
    NSTimeInterval end = [start timeIntervalSinceNow] * -1;
    verfiySorted(arr);
    NSLog(@"Bubble sort finished in %lf sec\n\n", end);
}

#endif
