#ifndef __CUDA_HELPER__
#define __CUDA_HELPER__

#include <cufft.h>
#include <mex.h>

size_t const THREADS_PER_BLOCK = 16;
const size_t NUM_BLOCKS = 65536;
const size_t NUM_THREADS = 256;

void _handle_cuda_error(cudaError_t code, const char *file, int line);
void _handle_cudafft_error(cufftResult code, const char *file, int line);

#define CUDA_HANDLE(code) {_handle_cuda_error((code), __FILE__, __LINE__);}
#define CUDAFFT_HANDLE(code) {_handle_cudafft_error((code), __FILE__, __LINE__);}

#endif
