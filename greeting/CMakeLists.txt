set(LIBGREETING_SRC greeting.cpp)

set(LIBNAME greeting)

add_library(${LIBNAME} SHARED ${LIBGREETING_SRC})
add_library(${LIBNAME}_static STATIC ${LIBGREETING_SRC})

# 重命名静态库的名字
set_target_properties(${LIBNAME}_static PROPERTIES OUTPUT_NAME ${LIBNAME})

# 设置构建库时不清理同名的库
set_target_properties(${LIBNAME} PROPERTIES CLEAN_DIRECT_OUTPUT 1)
set_target_properties(${LIBNAME}_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)

# 设置动态库的版本号
set_target_properties(${LIBNAME} PROPERTIES VERSION 1.2 SOVERSION 1)

# 安装
install(TARGETS ${LIBNAME} ${LIBNAME}_static
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
install(FILES greeting.h 
        DESTINATION include/greeting/)