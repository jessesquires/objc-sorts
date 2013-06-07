//
//  quick_sort.h
//  objc-sorts
//
//  Created by Jesse Squires on 6/6/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import "sort_utils.h"

#ifndef objc_sorts_quicksort_h
#define objc_sorts_quicksort_h

NSUInteger partition(NSMutableArray *arr, NSUInteger left, NSUInteger right)
{
    NSUInteger i = left;
    NSUInteger j = right;
    NSInteger pivot = [[arr objectAtIndex:(left + right) / 2] integerValue];
    
    while(i <= j) {
        while([[arr objectAtIndex:i] integerValue] < pivot)
            i++;
        
        while(j > 0 && [[arr objectAtIndex:j] integerValue] > pivot)
            j--;
        
        if(i <= j) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
            
            if(j > 0)
                j--;
        }
    }
    return i;
}

void quick_sort(NSMutableArray *arr, NSUInteger left, NSUInteger right)
{
    NSUInteger index = partition(arr, left, right);
    
    if(left < index - 1)
        quick_sort(arr, left, index - 1);
    
    if(index < right)
        quick_sort(arr, index, right);
}

void test_quick_sort(NSMutableArray *arr)
{
    NSLog(@"\n\nRunning quick sort...");
    NSDate *start = [NSDate date];
    quick_sort(arr, 0, arr.count - 1);
    NSTimeInterval end = [start timeIntervalSinceNow] * -1;
    verfiySorted(arr);
    NSLog(@"Quick sort DONE: %lf", end);
}

#endif
