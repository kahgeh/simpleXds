#!/usr/bin/env pwsh
param(
    $srcPath = './data-plane-api',
    $outPath = './src/Contracts/Protobufs',
    $baseNameSpace = 'Contracts.Envoy'
)
$srcFolder = Get-Item $srcPath 
$outFolder = Get-Item $outPath
$protoFiles = Get-ChildItem -Recurse $srcPath -Include "*.proto"

$protoFiles | ForEach-Object {
    $protoFile = $_
    $fileOutputFolderFullName = $protoFile.Directory.FullName.Replace($srcFolder.FullName, $outFolder.FullName)
    if (-not (Test-Path $fileOutputFolderFullName)) {
        New-Item $fileOutputFolderFullName -Type Directory | Out-Null
    }
    protoc --csharp_out=$fileOutputFolderFullName --csharp_opt="file_extension=.g.cs" --proto_path="$($protoFile.Directory.FullName)" -I"./protoc-gen-validate" -I"./googleapis" -I"$srcPath" $protoFile.Name
}