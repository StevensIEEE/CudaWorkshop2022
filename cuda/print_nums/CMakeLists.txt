cmake_minimum_required(VERSION 3.21)
project(print_nums CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(print_nums main.cu)

set_target_properties(print_nums PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)