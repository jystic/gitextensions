#define Name "Git Extensions"
#define PathName "GitExtensions"
#define Version "1.92"
#define PathVersion "192"
#define AppID "{132609D0-4C45-4DE0-B8E8-54DB8517F900}"

#pragma parseroption -p-

[Setup]
AppID={{#AppID}
AppName={#Name}
AppVerName={#Name} {#Version}
AppVersion={#Version}
AppUpdatesURL=http://code.google.com/p/gitextensions
AppSupportURL=http://github.com/spdr870/gitextensions/issues

DefaultDirName={pf}\{#PathName}
DefaultGroupName={#Name}

OutputBaseFilename={#PathName}{#PathVersion}SetupComplete
VersionInfoVersion={#Version}
VersionInfoProductName={#Name} {#Version}
VersionInfoProductVersion={#Version}

SetupIconFile=..\cow-head.ico
UninstallDisplayIcon={app}\cow-head.ico
WizardImageFile=wizard.bmp
WizardSmallImageFile=wizard-small.bmp

ArchitecturesInstallIn64BitMode=x64
Compression=lzma/ultra64
InternalCompressLevel=ultra64
PrivilegesRequired=none
ShowLanguageDialog=no
DisableReadyPage=true
ShowComponentSizes=false

[Files]
Source: ..\cow-head.ico; DestDir: {app}
Source: ..\Bin\gitex.cmd; DestDir: {app}
Source: ..\Bin\GitExtensionsUserManual.pdf; DestDir: {app}

Source: ..\Bin\plink.exe; DestDir: {app}\PuTTY
Source: ..\Bin\pageant.exe; DestDir: {app}\PuTTY
Source: ..\Bin\puttygen.exe; DestDir: {app}\PuTTY

Source: ..\Bin\KDiff3Setup_0.9.95.exe; DestDir: {app}\Installer; Components: KDiff3
Source: ..\Bin\Git-1.6.5.1-preview20091022.exe; DestDir: {app}\Installer; Components: msysgit
Source: ..\Bin\Dictionaries\*; DestDir: {app}\Dictionaries

Source: ..\GitCommands\GitExtensions\bin\Release\GitExtensions.exe; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\GitCommands.dll; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\GitUI.dll; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\ICSharpCode.TextEditor.dll; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\SpellChecker.dll; DestDir: {app}
Source: ..\GitCommands\GitExtensions\bin\Release\GitUIPluginInterfaces.dll; DestDir: {app}
Source: ..\Plugins\AutoCheckForUpdates\bin\Release\AutoCheckForUpdates.dll; DestDir: {app}\Plugins
Source: ..\Plugins\AutoCompileSubmodules\AutoCompileSubmodules\bin\Release\AutoCompileSubmodules.dll; DestDir: {app}\Plugins
Source: ..\Plugins\Statistics\GitStatistics\bin\Release\GitStatistics.dll; DestDir: {app}\Plugins

Source: ..\SimpleExt\ReleaseMinDependency\GitExtensionsShellEx.dll; DestDir: {app}; Flags: regserver; Components: shellext; Check: not Is64BitInstallMode
Source: ..\SimpleExt\ReleaseMinDependency64\GitExtensionsShellEx.dll; DestDir: {app}; Flags: regserver; Components: shellext; Check: Is64BitInstallMode

#define VsSource(version, path) "Source: ..\\GitPlugIn\\" + path + "; DestDir: {userdocs}\\Visual Studio " + version + "\\Addins; Components: vs" + version + "\n"
#define VsSourceAll(path) VsSource("2005", path) + VsSource("2008", path) + VsSource("2010", path)

#emit VsSourceAll("GitPlugin.AddIn")
#emit VsSourceAll("obj\\Release\\GitPlugin.dll")
#emit VsSourceAll("bin\\en-US\\GitPlugin.resources.dll")

[Icons]
Name: {group}\User Manual; Filename: {app}\GitExtensionsUserManual.pdf
Name: {group}\Git Extensions; Filename: {app}\GitExtensions.exe; WorkingDir: {app}; IconFilename: {app}\cow-head.ico; IconIndex: 0

[Registry]
#define RegKey "Software\\GitExtensions\\GitExtensions\\1.0.0.0"
Root: HKCU; Subkey: {#RegKey}; ValueType: string; ValueName: checksettings; ValueData: true
Root: HKCU; Subkey: {#RegKey}; ValueType: string; ValueName: InstallDir; ValueData: {app}
Root: HKCU; Subkey: {#RegKey}; ValueType: string; ValueName: gitssh; ValueData: {app}\PuTTY\plink.exe
Root: HKCU; Subkey: {#RegKey}; ValueType: string; ValueName: plink; ValueData: {app}\PuTTY\plink.exe
Root: HKCU; Subkey: {#RegKey}; ValueType: string; ValueName: pageant; ValueData: {app}\PuTTY\pageant.exe
Root: HKCU; Subkey: {#RegKey}; ValueType: string; ValueName: puttygen; ValueData: {app}\PuTTY\puttygen.exe

[Types]
Name: standard; Description: Standard install; Flags: iscustom

[Components]
Name: msysgit; Description: msysgit (1.6.5.1); Types: standard
Name: KDiff3; Description: KDiff3 (0.9.95); Types: standard
Name: shellext; Description: Shell extension; Types: standard
Name: vs2005; Description: Visual Studio 2005 integration
Name: vs2008; Description: Visual Studio 2008 integration
Name: vs2010; Description: Visual Studio 2010 integration

[Run]
Filename: {app}\Installer\Git-1.6.5.1-preview20091022.exe; Components: msysgit
Filename: {app}\Installer\KDiff3Setup_0.9.95.exe; Components: KDiff3

[Code]
#define UninstallKey "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + AppID + "_is1"

procedure PreInstall();
var
	uninstaller: String;
	errorCode: Integer;
begin
	if RegKeyExists(HKEY_LOCAL_MACHINE, '{#UninstallKey}') then	begin
		RegQueryStringValue(HKEY_LOCAL_MACHINE, '{#UninstallKey}', 'UninstallString', uninstaller);
		ShellExec('runas', uninstaller, '/silent', '', SW_HIDE, ewWaitUntilTerminated, errorCode);
	end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then begin
    PreInstall();
  end;
end;
