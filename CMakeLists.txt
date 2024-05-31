cmake_minimum_required(VERSION 3.24 FATAL_ERROR)

project(TestCPPCpm)

add_executable(TestCPPCpm main.cpp)
target_compile_features(TestCPPCpm PRIVATE cxx_std_17)

include(cmake/app_utils.cmake)

include(FetchContent)
FetchContent_Declare(
  Boost
  URL https://github.com/boostorg/boost/releases/download/boost-1.84.0/boost-1.84.0.tar.xz
  URL_MD5 893b5203b862eb9bbd08553e24ff146a
  DOWNLOAD_EXTRACT_TIMESTAMP ON
)
FetchContent_MakeAvailable(Boost)

target_link_libraries(TestCPPCpm PRIVATE )

diag_final_prop_dump()