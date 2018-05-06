This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

# testrunnerswitcher

testrunnerswitcher is a simple library to switch test runners between azure-ctest (available at https://github.com/Azure/azure-ctest.git) and CppUnitTest.

## Build

```
git clone https://github.com/Azure/azure-c-testrunnerswitcher.git
cd azure-c-testrunnerswitcher
mkdir build
cd build
cmake ..
cmake --build .
```

### Install and Use
To take a dependency on testrunnerswitcher in your project, install it in your developer environment:

```
cmake --build . --target install
```

If your project uses CMake, refer to ctest in your CMakeLists.txt file as follows:

```
find_package(testrunnerswitcher REQUIRED CONFIG)
# ...
target_link_library(yourlib testrunnerswitcher)
```
