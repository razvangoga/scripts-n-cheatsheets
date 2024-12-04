wget https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh -v 6.0.425
./dotnet-install.sh -v 8.0.404
./dotnet-install.sh -v 9.0.101

dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g GitVersion.Tool
dotnet tool install -g nbgv
dotnet tool install -g tye2 --version 0.11.10

sudo dotnet workload update
dotnet --info

rm dotnet-install.sh

