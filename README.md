# win-zed

A built Windows version of [Zed](https://github.com/zed-industries/zed). Zed version: 0.202.0. Here offer the installer executable file in the [release](https://github.com/gzqccnu/win-zed/releases). What the installer do, you can read [build script](./win-zed-setup.iss).

> [!Caution]
> If you want to uninstall it, you can run **unins000.exe**. Before you run it, you must kill your `zed.exe` process. Or zed.exe will still exist in your folder, although you can delete it by yourself.
> 
## Registry
This part list all the installer do in Registry. It will benifit you if you want to know what the `installer` do.
| Root  | SubKey                          | ValueType | ValueName | ValueData                     |
|-------|---------------------------------|-----------|-----------|-------------------------------|
| HKCR  | `*\shell\Zed`                   | string    |           | `Using Zed to open`           |
| HKCR  | `*\shell\Zed`                   | string    | Icon      | `{app}\zed.exe`               |
| HKCR  | `*\shell\Zed\command`           | string    |           | `"{app}\zed.exe" "%V"`        |
| HKCR  | `Directory\shell\Zed`           | string    |           | `Using Zed to open`           |
| HKCR  | `Directory\shell\Zed`           | string    | Icon      | `{app}\zed.exe`               |
| HKCR  | `Directory\shell\Zed\command`   | string    |           | `"{app}\zed.exe" "%V"`        |
| HKCR  | `Directory\Background\shell\Zed`| string    |           | `Using Zed to open`           |
| HKCR  | `Directory\Background\shell\Zed`| string    | Icon      | `{app}\zed.exe`               |
| HKCR  | `Directory\Background\shell\Zed\command` | string |         | `"{app}\zed.exe" "%V"`    |


In it `HKCR` stands for 'HKEY_CLASSES_ROOT', `{app}` stands for the directory you select.

## CLI
> [!Note]
> The installer doesn't offer CLI option. If you want a **zed-cli**, you can run [Add to PATH](./AddZedPATH.bat)

> [!WARNING]
> In the [release](https://github.com/gzqccnu/win-zed/releases)'s source file doesn't contain [Add to PATH](./AddZedPATH.bat).

## Other
> [!Important]
> The repository is just to want more user can use zed not for other use. If there any thing wrong, let me know or you could add a issue, and I will delete this repository.
