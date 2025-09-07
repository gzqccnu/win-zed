[Setup]
AppName=Zed
AppVersion=0.202.0          ; Zed Dev 0.202.0
DefaultDirName={pf}\Zed
DefaultGroupName=Zed
UninstallDisplayIcon={app}\zed.exe
Compression=lzma
SolidCompression=yes
OutputDir=.\InstallerOutput
PrivilegesRequired=admin

[Files]
; Copy zed.exe to the dest dir
Source: "zed.exe"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

[Registry]
; ---- Context menu for file ----
Root: HKCR; SubKey: "*\shell\Zed"; ValueType: string; ValueData: "Using Zed to open"; Flags: uninsdeletekey
Root: HKCR; Subkey: "*\shell\Zed"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\zed.exe"; Flags: uninsdeletekey
Root: HKCR; SubKey: "*\shell\Zed\command"; ValueType: string; ValueData: """{app}\zed.exe"" ""%V"""; Flags: uninsdeletekey

; ---- Context menu for folder ----
Root: HKCR; SubKey: "Directory\shell\Zed"; ValueType: string; ValueData: "Using Zed to open"; Flags: uninsdeletekey
Root: HKCR; SubKey: "Directory\shell\Zed"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\zed.exe"; Flags: uninsdeletekey
Root: HKCR; SubKey: "Directory\shell\Zed\command"; ValueType: string; ValueData: """{app}\zed.exe"" ""%V"""; Flags: uninsdeletekey

; ---- Context menu for folder background ----
Root: HKCR; SubKey: "Directory\Background\shell\Zed"; ValueType: string; ValueData: "Using Zed to open"; Flags: uninsdeletekey
Root: HKCR; SubKey: "Directory\Background\shell\Zed"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\zed.exe"; Flags: uninsdeletekey
Root: HKCR; SubKey: "Directory\Background\shell\Zed\command"; ValueType: string; ValueData: """{app}\zed.exe"" ""%V"""; Flags: uninsdeletekey

[Icons]
Name: "{group}\Zed"; Filename: "{app}\zed.exe"
Name: "{commondesktop}\Zed"; Filename: "{app}\zed.exe"; Tasks: desktopicon

[Tasks]
Name: desktopicon; Description: "Create desktop icon"; GroupDescription: "Additional icons:"; Flags: checkedonce

[Run]
Filename: "{app}\zed.exe"; Description: "Run Zed"; Flags: nowait postinstall skipifsilent


[Code]
; Add install directory to PATH to enable zed-cli
const
  WM_SETTINGCHANGE = $001A;

procedure BroadcastEnvironmentChange();
begin
  SendMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 'Environment');
end;

procedure AddToPath(dir: string);
var
  oldPath, newPath: string;
begin
  if not RegQueryStringValue(HKLM,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', oldPath) then
    oldPath := '';

  if Pos(';' + LowerCase(dir) + ';', ';' + LowerCase(oldPath) + ';') = 0 then
  begin
    if oldPath = '' then
      newPath := dir
    else
      newPath := oldPath + ';' + dir;

    RegWriteStringValue(HKLM,
      'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
      'Path', newPath);

    BroadcastEnvironmentChange();
  end;
end;

function SplitPathString(const S, Delimiter: string): TArrayOfString;
var
  PosDel, i: Integer;
  Current: string;
begin
  SetArrayLength(Result, 0);
  Current := S;
  repeat
    PosDel := Pos(Delimiter, Current);
    if PosDel > 0 then
    begin
      SetArrayLength(Result, GetArrayLength(Result) + 1);
      Result[GetArrayLength(Result) - 1] := Copy(Current, 1, PosDel - 1);
      Current := Copy(Current, PosDel + Length(Delimiter), Length(Current));
    end
    else
    begin
      SetArrayLength(Result, GetArrayLength(Result) + 1);
      Result[GetArrayLength(Result) - 1] := Current;
      Current := '';
    end;
  until Current = '';
end;

procedure RemoveFromPath(dir: string);
var
  oldPath, newPath: string;
  parts: TArrayOfString;
  i: Integer;
begin
  if RegQueryStringValue(HKLM,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', oldPath) then
  begin
    StringChangeEx(oldPath, ';', #13#10, True);
    parts := SplitPathString(oldPath, #13#10);
    newPath := '';

    for i := 0 to GetArrayLength(parts) - 1 do
    begin
      if (Trim(parts[i]) <> '') and (CompareText(Trim(parts[i]), dir) <> 0) then
      begin
        if newPath = '' then
          newPath := Trim(parts[i])
        else
          newPath := newPath + ';' + Trim(parts[i]);
      end;
    end;

    RegWriteStringValue(HKLM,
      'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
      'Path', newPath);

    BroadcastEnvironmentChange();
  end;
end;
