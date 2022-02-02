#include <iostream>
using namespace std;

__global__ void forloop(){
    printf("%i\n",threadIdx.x) ;
}

int main() {
    //calls for loop with 100 blocks and 1024 threads
    forloop<<<100,1024>>>();
    cudaDeviceSynchronize();
    return 0;
}