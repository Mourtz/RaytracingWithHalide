echo off
setlocal

git submodule update --init --recursive
cd external/vcpkg
.\bootstrap-vcpkg.bat
.\vcpkg.exe install halide[target-all]:x64-windows
.\vcpkg.exe install libpng:x64-windows libjpeg-turbo:x64-windows