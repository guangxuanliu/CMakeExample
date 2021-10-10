find_path(GREETING_INCLUDE_DIR greeting.h 
    /usr/include/greeting
    /usr/local/include/greeting)

find_library(GREETING_LIBRARY NAMES libgreeting.so PATH
    /usr/lib
    /usr/local/lib)

if(GREETING_INCLUDE_DIR AND GREETING_LIBRARY)
    set(GREETING_FOUND TRUE)
endif(GREETING_INCLUDE_DIR AND GREETING_LIBRARY)

if(GREETING_FOUND)
    message(STATUS "Found greeting: ${GREETING_LIBRARY}")
else(GREETING_FOUND)
    if(GREETING_FIND_REQUIRED)
        message(FATAL_ERROR "Count not find greeting library")
    endif(GREETING_FIND_REQUIRED)
endif(GREETING_FOUND)
