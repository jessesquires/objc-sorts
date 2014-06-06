//
//  Jesse Squires
//  http://www.hexedbits.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) Jesse Squires
//

#import <Foundation/Foundation.h>

#import "sort_utils.h"

#import "quick_sort.h"
#import "heap_sort.h"
#import "merge_sort.h"
#import "selection_sort.h"
#import "insertion_sort.h"
#import "bubble_sort.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSMutableArray *unsorted = randomNumbersArray();
        verfiySorted(unsorted);
        
        NSLog(@"-----------------\n\n");
        
        test_quick_sort([unsorted mutableCopy]);
        
        test_heap_sort([unsorted mutableCopy]);
        
        test_merge_sort([unsorted mutableCopy]);
        
        test_insertion_sort([unsorted mutableCopy]);
        
        test_selection_sort([unsorted mutableCopy]);
        
        test_bubble_sort([unsorted mutableCopy]);
    }
    return 0;
}
