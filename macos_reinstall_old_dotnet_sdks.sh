
for sdk in dotnet-sdk7-0-300 dotnet-sdk7-0-400 dotnet-sdk8-0-100 dotnet-sdk8-0-200
do
    echo "==> reinstalling $sdk"
    brew uninstall --zap --cask $sdk
    brew install --cask $sdk
    echo "==> done reinstalling $sdk"
done

dotnet --info