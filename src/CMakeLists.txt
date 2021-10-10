aux_source_directory(. SRC_LIST)

set(PROGRAM_NAME hello)

# 设置可执行程序及库的存放路径
# set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
# set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

include_directories(${PROJECT_SOURCE_DIR}/greeting)
link_directories(${PROJECT_BINARY_DIR}/greeting)

# 查找第三方库
# find_package(GREETING REQUIRED)
# if(GREETING_FOUND)
#     add_executable(hello ${SRC_LIST})
#     include_directories(${GREETING_INCLUDE_DIR})
#     target_link_libraries(hello ${GREETING_LIBRARY})
# else(GREETING_FOUND)
#     message(FATAL_ERROR "greeting library not found")
# endif(GREETING_FOUND)


# 添加项目中的库
add_executable(${PROGRAM_NAME} ${SRC_LIST})
target_link_libraries(${PROGRAM_NAME} libgreeting.a)

# 确保在链接之前，先编译库
# 但是好像不添加也没问题
# add_dependencies(hello greeting)

# 安装
install(TARGETS ${PROGRAM_NAME} DESTINATION bin)
