# CMake Template

Windows, macOS, Linux에서 C/C++ 프로젝트를 빌드하기 위한 CMake 템플릿입니다.
dynamic library sample은 작업 중

## 디렉터리 구조  
```
cpp_template/  
├── Src/  
│   ├── MyApp/  
│   │   ├── main.cpp  
│   │   ├── pch.h  
│   │   ├── pch.cpp
│   │   └── CMakeLists.txt  
│   ├──MyDynamicLibrary/  
│   │   ├── MyDanamicLib.h  
│   │   ├── MyDynamicLib.cpp  
│   │   └── CMakeLists.txt  
│   ├──MyStaticLibrary/  
│   │   ├── MyLib.h  
│   │   ├── MyLib.cpp  
│   │   └── CMakeLists.txt  
│   └── CMakeLists.txt  
├── Build/  
└── Output/  
```

## Unix계열 OS에서 빌드하기
```
chmod +x build.sh # 실행 권한 추가
./build.sh 
```  

## Window에서 빌드하기
``` 
build.bat 
```
## cmake 수행 결과
빌드 산출물은 각 OS(Linux, MacOS, Windows)별로 다르게 나오며  
Build/<플랫폼이름>Rlease 디렉터리에 실행파일이 생성됩니다.  

라이브러리는 MyApp/CMakseLists.txt 파일의
target_link_libraries 함수에서 링크를 정의합니다. 

