cmake_minimum_required(VERSION 3.30)
project(MyProject)
set(TARGET_NAME MyProject)

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

# 빌드할 소스코드 목록 생성
file(GLOB_RECURSE SOURCES *.cpp *.c)
foreach(SOURCE IN LISTS SOURCES)
    message(STATUS "SOURCE _ ${SOURCE}")
endforeach(SOURCE)

# include 및 link 디렉토리 설정
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../../cpp_template/Inc)
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../../cpp_template/Build/${CMAKE_SYSTEM_NAME}Release)

# 실행파일 추가
add_executable(${TARGET_NAME} ${SOURCES})

# 라이브러리 링크
target_link_libraries(${TARGET_NAME} MyLib MyDll)

# 플랫폼 별 추가 라이브러리 링크
if(UNIX)
    target_link_libraries(${TARGET_NAME} dl pthread)
elseif(WIN32)
    # Windows에서 필요한 라이브러리를 추가합니다.
    # 필요에 따라 추가 라이브러리를 여기에 명시
endif()

# 컴파일 옵션
target_compile_options(${TARGET_NAME} PUBLIC -fPIC)