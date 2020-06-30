#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

pushd ${DIR}/..

  dotnet publish

  cf push formation-springcloud-service -f ci/manifest.yml -p bin/Debug/netcoreapp3.1/publish --random-route

popd