#include <iostream>
using namespace std;

__global__ void forloop(int N){
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for(int x = idx; x<N; x+=stride){
        printf("%d\n",x);
    }
}

int main() {
    //calls for loop with 100 blocks and 1024 threads
    forloop<<<32,1024>>>(1000000);
    cudaDeviceSynchronize();
    return 0;
}