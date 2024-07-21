# Accelerated Topk-sort Algorithm with Vitis HSL

## files
- [topk_sort.h](/topk_sort.h), [topk_sort.cpp](/topk_sort.cpp): Vitis HLS implementation
- [topk_sort_tb.cpp](/topk_sort_tb.cpp): Testbench to run simulation on Vitis HLS

## report
- you can see report of C synthesis at [csynth.rpt](/solution1/syn/report/csynth.rpt)
    - it says that this algorithm needs 1212 cycles for sorting (with array size N = 1000, and k = 100), which means that time complexity is O(N), while usual sorting algorithms requires time complexity O(NlogN).
- it can be confirmed that LOOPS are correctly pipelined
