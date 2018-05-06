#!/bin/bash
#set -o pipefail
#

set -e

script_dir=$(cd "$(dirname "$0")" && pwd)
build_root=$(cd "${script_dir}/.." && pwd)
log_dir=$build_root
make_install=
build_folder=$build_root"/build"

rm -r -f $build_folder
mkdir -p $build_folder
pushd $build_folder
cmake ..
cmake --build . -- --jobs=$(nproc)
if [[ $make_install == 1 ]] ;
then
    echo "Installing packaging" 
    cmake --build . --target install -- --jobs=$(nproc)
fi

popd
