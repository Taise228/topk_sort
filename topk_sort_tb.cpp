#include <iostream>
#include <stdlib.h>
#include "topk_sort.h"


void topk_sort(hls::stream<StreamPix> &istrm, hls::stream<StreamPix> &ostrm);

int main() {
    // input data
    int arr[N];
    for (int i = 0; i < N; i++) {
        arr[i] = rand() % 1000;
    }

    int sorted[N];
    for (int i = 0; i < N; i++) {
        sorted[i] = arr[i];
    }
    int expected[k];
    // bubble sort in descending order
    for (int i = 0; i < N - 1; i++) {
        for (int j = N - 1; j > i; j--) {
            if (sorted[j] > sorted[j - 1]) {
                int tmp = sorted[j];
                sorted[j] = sorted[j - 1];
                sorted[j - 1] = tmp;
            }
        }
    }
    for (int i = 0; i < k; i++) {
        expected[i] = sorted[i];
    }

    // HLS simulation
    hls::stream<StreamPix> instrm("instrm");
    hls::stream<StreamPix> ostrm("ostrm");
    StreamPix pix;
    // to stream
    for (int i = 0; i < N; i++) {
        pix.data = arr[i];
        instrm << pix;
    }
    topk_sort(instrm, ostrm);

    // compare
    StreamPix output;
    for (int i = 0; i < k; i++) {
        output = ostrm.read();
        // check last
        if (i == k - 1 && output.last != 1) {
            std::cout << "FAIL: last mismatch" << std::endl;
            return 1;
        }
        // check data
        if (output.data != expected[i]) {
            std::cout << "FAIL: data mismatch: expected[" << i << "] = " << expected[i]
            << ", but output[" << i << "] = " << output.data << std::endl; 
            return 1;
        }
    }

    std::cout << "PASS" << std::endl;
    return 0;
}
