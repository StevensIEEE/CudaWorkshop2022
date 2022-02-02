cmake_minimum_required(VERSION 3.21)
project(print_a_million CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(print_a_million main.cu)

set_target_properties(print_a_million PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)