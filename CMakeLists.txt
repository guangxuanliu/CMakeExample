cmake_minimum_required(VERSION 2.8)

project(hello)

# 版本号
# 如果需要变更版本号，请修改下面两个数值
set(program_version_major 1)
set(program_version_minor 2)

configure_file(
    "${PROJECT_SOURCE_DIR}/include/Config.h.in"
    "${PROJECT_BINARY_DIR}/Config.h"
)

include_directories(${PROJECT_BINARY_DIR})


# cmake模块路径
# 自己编写的cmake模块存放路径
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)


# 支持C++11
# CMAKE_CXX_STANDARD这种写法，仅 cmake3.1及以后版本支持此种写法，如果小于此版本，请使用第二种写法
# set (CMAKE_CXX_STANDARD 11)       
SET(CMAKE_CXX_FLAGS "-std=c++0x")


# 环境变量
# 输出
# message(STATUS "HOME dir $ENV{HOME}")
# 设置，注意此设置仅在编译时有效
# set(ENV{LD_LIBRARY_PATH} "${PROJECT_BINARY_DIR}/lib")

# 系统信息
# message(STATUS "CMAKE_SYSTEM:${CMAKE_SYSTEM}")

# 详细的构建过程，可以使用make VERBOSE=1来查看
# message(STATUS "this is binary dir" ${PROJECT_BINARY_DIR})
# message(STATUS "this is srouce dir" ${PROJECT_SOURCE_DIR})


# 设置默认的编译选项，默认为release，带调试信息
# 可以通过指定 cmake .. -DCMAKE_BUILD_TYPE=Release 来改变
# 使用 make VERBOSE=1 可以查看具体的编译过程
# Release - Adds the -O3 -DNDEBUG flags to the compiler
# Debug - Adds the -g flag
# MinSizeRel - Adds -Os -DNDEBUG
# RelWithDebInfo - Adds -O2 -g -DNDEBUG flags
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message("Setting build type to 'RelWithDebInfo' as none was specified.")
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
    "MinSizeRel" "RelWithDebInfo")
endif()

# 添加子目录
# 每个目录都有一个CMakeLists.txt
add_subdirectory(greeting)
add_subdirectory(src)

# 安装
# 最后一个参数为相对路径，默认前缀为/usr/local/
# 可以通过cmake -DCMAKE_INSTALL_PREFIX=/path/to/install 来指定前缀
install(FILES COPYRIGHT README DESTINATION share/doc)
install(PROGRAMS runhello.sh DESTINATION bin)
install(DIRECTORY doc/ DESTINATION share/doc)