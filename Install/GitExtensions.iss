[Setup]
AppName=Git Extensions
AppVerName=Git Extensions 1.92 (preview)
AppVersion=1.92
AppID={132609D0-4C45-4DE0-B8E8-54DB8517F900}

DefaultDirName={pf}\GitExtensions
DefaultGroupName=Git Extensions

OutputBaseFilename=GitExtensionsSetup
SetupIconFile=..\cow-head.ico
UninstallDisplayIcon={app}\cow-head.ico
WizardImageFile=wizard.bmp
WizardSmallImageFile=wizard-small.bmp
AppUpdatesURL=http://code.google.com/p/gitextensions
AppSupportURL=http://github.com/spdr870/gitextensions/issues

Compression=lzma/ultra64
InternalCompressLevel=ultra64
PrivilegesRequired=none
ShowLanguageDialog=no

[Files]
Source: ..\cow-head.ico; DestDir: {app}
Source: ..\Bin\gitex.cmd; DestDir: {app}
Source: ..\Bin\GitExtensionsUserManual.pdf; DestDir: {app}

Source: ..\Bin\plink.exe; DestDir: {app}\PuTTY
Source: ..\Bin\pageant.exe; DestDir: {app}\PuTTY
Source: ..\Bin\puttygen.exe; DestDir: {app}\PuTTY

Source: ..\Bin\KDiff3Setup_0.9.95.exe; DestDir: {app}\Installer
Source: ..\Bin\Git-1.6.5.1-preview20091022.exe; DestDir: {app}\Installer

Source: ..\Bin\Dictionaries\en-AU.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\en-CA.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\en-GB.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\en-US.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\es-ES.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\es-MX.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\fr-FR.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\it-IT.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\nl-NL.dic; DestDir: {app}\Dictionaries
Source: ..\Bin\Dictionaries\de-DE.dic; DestDir: {app}\Dictionaries

Source: ..\GitCommands\GitExtensions\bin\Release\GitExtensions.exe; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\GitCommands.dll; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\GitUI.dll; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\ICSharpCode.TextEditor.dll; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\SpellChecker.dll; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\GitUIPluginInterfaces.dll; DestDir: {app}
Source: ..\Plugins\AutoCheckForUpdates\bin\Release\AutoCheckForUpdates.dll; DestDir: {app}\Plugins
Source: ..\Plugins\AutoCompileSubmodules\AutoCompileSubmodules\bin\Release\AutoCompileSubmodules.dll; DestDir: {app}\Plugins
Source: ..\Plugins\Statistics\GitStatistics\bin\Release\GitStatistics.dll; DestDir: {app}\Plugins

Source: ..\SimpleExt\ReleaseMinDependency\GitExtensionsShellEx.dll; DestDir: {app}; DestName: GitExtensionsShellEx32.dll
Source: ..\SimpleExt\ReleaseMinDependency64\GitExtensionsShellEx.dll; DestDir: {app}; DestName: GitExtensionsShellEx64.dll

Source: ..\GitPlugin\GitPlugin.AddIn; DestDir: {userdocs}\Visual Studio 2008\Addins
Source: ..\GitPlugin\obj\Release\GitPlugin.dll; DestDir: {userdocs}\Visual Studio 2008\Addins
Source: ..\GitPlugin\bin\en-US\GitPlugin.resources.dll; DestDir: {userdocs}\Visual Studio 2008\Addins\en-US

[Icons]
Name: {group}\User Manual; Filename: {app}\GitExtensionsUserManual.pdf
Name: {group}\Git Extensions; Filename: {app}\GitExtensions.exe; WorkingDir: {app}; IconFilename: {app}\cow-head.ico; IconIndex: 0

[Registry]
Root: HKCU; Subkey: Software\GitExtensions\GitExtensions\1.0.0.0; ValueType: string; ValueName: checksettings; ValueData: true
Root: HKCU; Subkey: Software\GitExtensions\GitExtensions\1.0.0.0; ValueType: string; ValueName: InstallDir; ValueData: {app}
Root: HKCU; Subkey: Software\GitExtensions\GitExtensions\1.0.0.0; ValueType: string; ValueName: gitssh; ValueData: {app}\PuTTY\plink.exe

Root: HKCU; Subkey: Software\GitExtensions\GitExtensions\1.0.0.0; ValueType: string; ValueName: plink; ValueData: {app}\PuTTY\plink.exe
Root: HKCU; Subkey: Software\GitExtensions\GitExtensions\1.0.0.0; ValueType: string; ValueName: pageant; ValueData: {app}\PuTTY\pageant.exe
Root: HKCU; Subkey: Software\GitExtensions\GitExtensions\1.0.0.0; ValueType: string; ValueName: puttygen; ValueData: {app}\PuTTY\puttygen.exe
