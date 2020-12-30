# ����Ŀ��ϵͳ
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# ���ù�����Ŀ¼
set(TOOL_CHAIN_DIR /usr/local/arm/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/)
set(TOOL_CHAIN_INCLUDE 
    ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/include
    )
set(TOOL_CHAIN_LIB 
    ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/lib
    )

# ���ñ�����λ��
set(CMAKE_C_COMPILER "arm-linux-gnueabihf-gcc")
set(CMAKE_CXX_COMPILER "arm-linux-gnueabihf-g++")

# ����Cmake������·��
set(CMAKE_FIND_ROOT_PATH ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# ֻ��ָ��Ŀ¼�²��ҿ��ļ�
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
# ֻ��ָ��Ŀ¼�²���ͷ�ļ�
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# ֻ��ָ��Ŀ¼�²���������
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