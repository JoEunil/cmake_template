#!/bin/bash

# 현재 작업 디렉터리를 저장
CUR_DIR=$(pwd)

# Output 디렉터리 이름
OUTPUT_DIR="Output"

# Output 디렉터리가 있으면 삭제
if [ -d "$OUTPUT_DIR" ]; then
    echo "Deleting existing $OUTPUT_DIR directory..."
    rm -rf "$OUTPUT_DIR"
fi

# Output 디렉터리 생성
mkdir "$OUTPUT_DIR"

# Output 디렉터리로 이동
cd "$OUTPUT_DIR"

# CMake 빌드 수행
cmake ../Src && cmake --build .
# 원래 디렉터리로 돌아오기
cd "$CUR_DIR"