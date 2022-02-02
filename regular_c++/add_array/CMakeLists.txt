cmake_minimum_required(VERSION 3.21)
project(add_array CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(add_array main.cu)

set_target_properties(add_array PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)
