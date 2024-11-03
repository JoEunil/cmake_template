@echo off
setlocal

:: 현재 작업 디렉터리를 저장
set CUR_DIR=%cd%

:: Output 디렉터리 이름
set OUTPUT_DIR=Output

:: Output 디렉터리가 있으면 삭제
if exist %OUTPUT_DIR% (
    echo Deleting existing %OUTPUT_DIR% directory...
    rmdir /s /q %OUTPUT_DIR%
)

:: Output 디렉터리 생성
echo Creating %OUTPUT_DIR% directory...
mkdir %OUTPUT_DIR%

:: Output 디렉터리로 이동
cd %OUTPUT_DIR%

:: CMake 빌드 수행
echo Running CMake build...
cmake ../Src && cmake --build . 

:: 원래 디렉터리로 돌아오기
cd %CUR_DIR%
echo Returned to %CUR_DIR%

endlocal
pause