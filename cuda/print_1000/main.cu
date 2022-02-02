#include <iostream>
using namespace std;

__global__ void print(){
    printf("%d\n", threadIdx.x);

}

int main(){
    print<<<1, 500>>>();
    cudaDeviceSynchronize();
    return 1;
}

nvcc nameOfFile.cu -o build -run