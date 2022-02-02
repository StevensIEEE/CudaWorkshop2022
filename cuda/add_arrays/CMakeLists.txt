cmake_minimum_required(VERSION 3.21)
project(add_arrays CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(add_arrays main.cu)

set_target_properties(add_arrays PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)