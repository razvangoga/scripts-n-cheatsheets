#!/usr/bin/env bash

./dotnet_install_sdks.sh --architecture x64 --os linux

# dotnet configurations
dotnet tool update -g linux-dev-certs
dotnet linux-dev-certs install
