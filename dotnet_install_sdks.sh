#!/usr/bin/env bash

INSTALL_ARGS=("$@")

wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh
wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sig
gpg --verify dotnet-install.sig dotnet-install.sh

chmod +x dotnet-install.sh

./dotnet-install.sh -v 8.0.425 "${INSTALL_ARGS[@]}"
./dotnet-install.sh -v 9.0.318 "${INSTALL_ARGS[@]}"
./dotnet-install.sh -v 10.0.401 "${INSTALL_ARGS[@]}"

dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g dotnet-purge
dotnet tool install -g GitVersion.Tool
dotnet tool install -g nbgv
dotnet tool install -g swashbuckle.aspnetcore.cli
dotnet tool install -g tye2 --version 0.11.10

rm dotnet-install.sh
rm dotnet-install.sig

dotnet --info