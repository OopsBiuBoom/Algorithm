//
//  main.c
//  QuickSort
//
//  Created by Bii on 2019/6/22.
//  Copyright © 2019 Algorithm. All rights reserved.
//

#include <stdio.h>

#define MAXSIZE 17

void show(int arr[]) {
    printf("--------------------\n");
    for (int i = 0;i<MAXSIZE;i++) {
        printf(" - %d",arr[i]);
    }
    printf("\n");
}

void swap(int arr[], int x, int y) {
    int temp = arr[x];
    arr[x] = arr[y];
    arr[y] = temp;
}

void QuickSort(int arr[], int low, int high) {
    
    if (low >= high) return;
    
    int pivot = high;
//    high -= 1;
    
    printf("----- 刚进来的数组 ------\n");
    show(arr);
    
    while (low < high) {
        
        // 先遍历左边
        while (low < high && arr[low] <= arr[pivot]) {
//            printf("arr[low] = [%d] - %d\n",low ,arr[low]);
            low++;
        }
        
        // 遍历右边
        while (high > low && arr[high] > arr[pivot] ) {
//            printf("arr[high] = [%d] - %d\n",high ,arr[high]);
            high--;
        }
        
        // 交换low和high（在low和highd相等时，可以不交换）
        swap(arr, low, high);
        printf("arr[%d] = %d 和 arr[%d] = %d 交换\n", low, arr[low], high, arr[high]);
        show(arr);
    }
    
    // 把pivot交换到中间
    swap(arr, low, pivot);
    // 把小于pivot的部分按照上面的方式排序
    QuickSort(arr, 0, low-1);
    // 把大于pivot的部分按照上面的方式排序
    QuickSort(arr, low+1, high);
}

int main(int argc, const char * argv[]) {
    
    int arr[MAXSIZE] = {5,1,7,3,9,41,879,1,33,2,66,1,2,3,4,5,1};
    QuickSort(arr, 0, MAXSIZE-1);
    show(arr);
    return 0;
}
