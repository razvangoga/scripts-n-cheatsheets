
for sdk in dotnet-sdk7-0-300 dotnet-sdk7-0-400 dotnet-sdk8-0-100 dotnet-sdk8-0-200
do
    echo "==> reinstalling $sdk"
    brew uninstall --zap --cask $sdk
    brew install --cask $sdk
    echo "==> done reinstalling $sdk"
done

dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g GitVersion.Tool
dotnet tool install -g Microsoft.Tye --version "0.11.0-alpha.22111.1"
dotnet tool install -g nbgv
dotnet tool install -g tye2 --version 0.11.10

dotnet --info

