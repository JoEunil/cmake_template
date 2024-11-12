# CMake Template

Windows, macOS, Linux에서 C/C++ 프로젝트를 빌드하기 위한 CMake 템플릿입니다.

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
빌드 중 충돌을 방지하기 위해 Output 디렉터리에서 빌드를 진행합니다. 빌드 중간 산출물은 Output디렉터리에 남고 빌드 최종 산출물은 Build 디렉터리에 저장됩니다.
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

## dynamic Library
``` 
int main()
{
    test_func();
    test_func2();
    return 0;
}
```
main 함수에서 static library 함수(test_func)와 dynamic library 함수(test_func2)를 순서대로 호출합니다.

<img width="117" alt="image" src="https://github.com/user-attachments/assets/399a32a9-7151-42f8-92f4-768b9a73a090">
전체 프로젝트를 빌드 후 실행파일을 실행하면 다음과 같은 결과가 나옵니다.

``` 
int test_func()
{
    std::cout << "Lib-modify" << std::endl;
    return 1;
}
```
``` 
int test_func2()
{
    std::cout << "Dll-modify" << std::endl;
    return 2;
}
```
test_func 함수와 test_func2 함수를 다음과 같이 수정하고 각각의 라이브러리 폴더를 다시 빌드해줍니다.
```
rm -rf Output
mkdir Output
cd Output
cmake ../Src/MyDynamicLibrary && cmake --build .
cd ..
rm -rf Output
mkdir Output
cd Output
cmake ../Src/MyStaticLibrary && cmake --build .
```
<img width="145" alt="image" src="https://github.com/user-attachments/assets/bf72cd16-e51e-444b-917e-fe7eb834155e">
실행 파일을 다시 실행시키면 DynamicLibrary의 함수만 변경사항이 적용된 것을 확인할 수 있습니다.
Static Library는 컴파일 타임에 링크되어 실행 파일에 포함되고, Dynamic Library는 런타임에 로드되기 때문입니다.