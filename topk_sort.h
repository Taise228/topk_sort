#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef hls::axis<ap_int<32>, 0, 0, 0> StreamPix;

const int k = 100;
const int N = 1000;   // input data size
