#!/usr/bin/env bash

./dotnet_install_sdks.sh

# dotnet configurations
dotnet tool update -g linux-dev-certs
dotnet linux-dev-certs install
