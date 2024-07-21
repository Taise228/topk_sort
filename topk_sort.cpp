#include "topk_sort.h"


// top-level function
void topk_sort(hls::stream<StreamPix> &istrm, hls::stream<StreamPix> &ostrm) {
    // top-k sort in descending order using vitis HLS
    // assume that input data is greater than 0
    // 実装の補助としてGitHub Copilotを用いた
    #pragma HLS INTERFACE s_axilite port=return bundle=CONTROL_BUS
    #pragma HLS INTERFACE axis port=istrm
    #pragma HLS INTERFACE axis port=ostrm

    int arr[k];
    int post[k];
    #pragma HLS ARRAY_PARTITION variable=arr complete dim=0
    #pragma HLS ARRAY_PARTITION variable=post complete dim=0
    // arr, postは各要素が分割され、並列アクセス可能

    // initialize arr
    for (int i = 0; i < k; i++) {
        #pragma HLS PIPELINE II=1
        // PIPELINEを指定することで、ループ内の処理が並列化
        arr[i] = 0;   // 0以上なので0で初期化
        post[i] = 0;
    }

    StreamPix out;   // output
    StreamPix pix;   // input
    // process input
    for (int i = 0; i < N; i++) {
        pix = istrm.read();
        int val = pix.data;
        out.keep = pix.keep;
        out.strb = pix.strb;

        for (int j = 0; j < k; j++) {
            #pragma HLS PIPELINE II=1
            if (j == 0) {
                if (val > arr[0]) {
                    post[0] = arr[0];
                    arr[0] = val;
                } else {
                    post[0] = val;
                }
            } else {
                if (post[j - 1] > arr[j]) {
                    post[j] = arr[j];
                    arr[j] = post[j - 1];
                } else {
                    post[j] = post[j - 1];
                }
            }
        }
    }

    // remaining flow
    for (int i = 0; i < k - 1; i++) {
        for (int j = i + 1; j < k; j++) {
            #pragma HLS PIPELINE II=1
            if (post[j - 1] > arr[j]){
                post[j] = arr[j];
                arr[j] = post[j - 1];
            } else {
                post[j] = post[j - 1];
            }
        }
    }

    // output
    for (int i = 0; i < k; i++) {
        #pragma HLS PIPELINE II=1
        StreamPix pix;
        pix.data = arr[i];
        pix.last = (i == k-1) ? 1 : 0;
        ostrm.write(pix);
    }
}