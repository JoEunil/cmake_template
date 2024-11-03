cmake_minimum_required(VERSION 3.30)
project(MyLib)

set(TARGET_NAME MyLib)
# 컴파일러 지정
if(MSVC)
    # Windows에서 사용되는 MSVC 컴파일러 옵션
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /std:c++11")
else()
    # Linux와 macOS에서 사용되는 GCC/Clang 컴파일러 옵션
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
endif()

# 빌드 산출물 경로 지정
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../Build/${CMAKE_SYSTEM_NAME}Release)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../Build/${CMAKE_SYSTEM_NAME}Release)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../Build/${CMAKE_SYSTEM_NAME}Release)

# message() 로그
message(STATUS "CMAKE_ARCHIVE_OUTPUT_DIRECTORY: ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}")
message(STATUS "CMAKE_LIBRARY_OUTPUT_DIRECTORY: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
message(STATUS "CMAKE_RUNTIME_OUTPUT_DIRECTORY: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")

#빌드할 소스코드 목록 생성
#file() 현재 경로 기준 파일 검색해서 가져온다
file(GLOB_RECURSE SOURCES *.cpp *.c)
foreach(SOURCE IN LISTS SOURCES)
    message(STATUS "SOURCE _ " ${SOURCE})
endforeach(SOURCE)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../../cpp_template/Inc)
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../../cpp_template/Build/${CMAKE_SYSTEM_NAME}Release)

#정적 라이브러리
add_library(${TARGET_NAME} STATIC ${SOURCES})