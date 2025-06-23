#!/usr/bin/env bash

./dotnet_install_sdks.sh

# dotnet configurations
dotnet dev-certs https --trust
dotnet --info
