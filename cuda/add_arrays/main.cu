#include <stdio.h>

__global__ void initWith(float num, float *a, int N){
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for(int i = idx; i< N; i+=stride){
        a[i] = num;
    }
}

__global__ void addVectorsInto(float *result, float *a, float *b, int N)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    for(int i = index; i < N; i += stride){
        result[i] = a[i] + b[i];
    }
}

void checkElementsAre(float target, float *vector, int N)
{
    for(int i = 0; i < N; i++)
    {
        if(vector[i] != target)
        {
            printf("FAIL: vector[%d] - %0.0f does not equal %0.0f\n", i, vector[i], target);
            exit(1);
        }
    }
    printf("Success! All values calculated correctly.\n");
}

int main(){
    float *a;
    float *b;
    float *c;

    int N = 100000000;
    size_t size = N * sizeof(float);

    int deviceId;
    cudaGetDevice(&deviceId);

    cudaDeviceProp props;
    cudaGetDeviceProperties(&props, deviceId);

    cudaMallocManaged(&a, size);
    cudaMallocManaged(&b, size);
    cudaMallocManaged(&c, size);

    size_t threadsPerBlock = 256;
    size_t numberOfBlocks = props.multiProcessorCount *32;

    initWith<<<numberOfBlocks, threadsPerBlock>>>(3,a,N);
    initWith<<<numberOfBlocks, threadsPerBlock>>>(4,b,N);
    initWith<<<numberOfBlocks, threadsPerBlock>>>(0,c,N);
    addVectorsInto<<<numberOfBlocks, threadsPerBlock>>>(c, a, b, N);
    cudaDeviceSynchronize();
    checkElementsAre(7, c, N);

    cudaFree(a);
    cudaFree(b);
    cudaFree(c);
}