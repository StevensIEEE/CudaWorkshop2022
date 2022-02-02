#include <iostream>
using namespace std;

void checkElementsAre(float target, double *vector, int N)
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

int main (){

    int n = 100000000;
    double* a = new double[n];
    double* b = new double[n];
    double* c = new double[n];

    for(int i = 0; i< n; i++){
        a[i] = 3;
    }

    for(int i = 0; i< n; i++){
        b[i] = 4;
    }

    for(int i = 0; i<n; i++){
        c[i] = a[i] + b[i];
    }

    checkElementsAre(7,c,n);
    cout << c[75000];
    return 1;
}