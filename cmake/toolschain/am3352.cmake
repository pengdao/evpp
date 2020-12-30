# 设置目标系统
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# 设置工具链目录
set(TOOL_CHAIN_DIR /usr/local/arm/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/)
set(TOOL_CHAIN_INCLUDE 
    ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/include
    )
set(TOOL_CHAIN_LIB 
    ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/lib
    )

# 设置编译器位置
set(CMAKE_C_COMPILER "arm-linux-gnueabihf-gcc")
set(CMAKE_CXX_COMPILER "arm-linux-gnueabihf-g++")

# 设置Cmake查找主路径
set(CMAKE_FIND_ROOT_PATH ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# 只在指定目录下查找库文件
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
# 只在指定目录下查找头文件
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# 只在指定目录下查找依赖包
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

include_directories(
    ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/include
    )

set(CMAKE_INCLUDE_PATH 
    ${TOOL_CHAIN_INCLUDE}
    )

set(CMAKE_LIBRARY_PATH 
    ${TOOL_CHAIN_LIB}
    )