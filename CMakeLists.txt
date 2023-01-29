# set CMAKE_MINIMUM_REQUIRED
CMAKE_MINIMUM_REQUIRED(VERSION 3.15)

# set CMAKE_PROJECT_NAME
SET(H_TARGET "HALIDE_PT")

# set CMAKE_PROJECT_VERSION
SET(CMAKE_PROJECT_VERSION "1.0.0")

# set CMAKE_PROJECT_DESCRIPTION
SET(CMAKE_PROJECT_DESCRIPTION "Naive Path Tracer using Halide")

# set VCPKG root in ./external/vcpkg
SET(VCPKG_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/external/vcpkg")
MESSAGE(STATUS "VCPKG_ROOT: ${VCPKG_ROOT}")

# set CMAKE_TOOLCHAIN_FILE
SET(CMAKE_TOOLCHAIN_FILE "${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")

# set CMAKE_BUILD_TYPE
SET(CMAKE_BUILD_TYPE "Release")

# set CMAKE_CXX_STANDARD
SET(CMAKE_CXX_STANDARD 17)

# set CMAKE_CXX_STANDARD_REQUIRED
SET(CMAKE_CXX_STANDARD_REQUIRED ON)

# set CMAKE_CXX_EXTENSIONS
SET(CMAKE_CXX_EXTENSIONS NO)

PROJECT(${H_TARGET} LANGUAGES CXX)

# add halide
FIND_PACKAGE(Halide CONFIG REQUIRED)

# add halide
ADD_EXECUTABLE(${H_TARGET} "src/main.cpp")

# add halide library
TARGET_LINK_LIBRARIES(${H_TARGET} PRIVATE Halide::Halide)



# JIT mode:
# add_executable(my_halide_app "src/main.cpp")
# target_link_libraries(my_halide_app PRIVATE Halide::Halide)

# AOT mode:
# add_executable(my_generators my_generators.cpp)
# target_link_libraries(my_generators PRIVATE Halide::Generator)
# add_halide_library(my_first_generator FROM my_generators)
# add_halide_library(my_second_generator FROM my_generators
#     PARAMS parallel=false scale=3.0 rotation=ccw output.type=uint16)
# add_halide_library(my_second_generator_2 FROM my_generators
#     GENERATOR my_second_generator
#     PARAMS scale=9.0 rotation=ccw output.type=float32)
# add_halide_library(my_second_generator_3 FROM my_generators
#     GENERATOR my_second_generator
#     PARAMS parallel=false output.type=float64)