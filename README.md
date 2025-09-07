# win-zed

A built Windows version of [Zed](https://github.com/zed-industries/zed) version: 0.202.0. Here offer the installer executable file. Or you can using the script to build your own `installer`.

> [!WARNING]
> If you want to uninstall it, you can run **uninstall000.exe**. Before you run it, you must kill your `zed.exe` process. Or zed.exe will still here, although you can delete it by yourself.

## Registry
This part list all the installer do in Registry. It will benifit you if you want to know what the `installer` do.
| Root  | SubKey                          | ValueType | ValueName | ValueData                     |
|-------|---------------------------------|-----------|-----------|-------------------------------|
| HKCR  | `*\shell\Zed`| string    |           | `Using Zed to open`           |
| HKCR  | `*\shell\Zed`                   | string    | Icon      | `{app}\zed.exe`               |
| HKCR  | `*\shell\Zed\command`           | string    |           | `"{app}\zed.exe" "%V"`        |
| HKCR  | `Directory\shell\Zed`           | string    |           | `Using Zed to open`           |
| HKCR  | `Directory\shell\Zed`           | string    | Icon      | `{app}\zed.exe`               |
| HKCR  | `Directory\shell\Zed\command`   | string    |           | `"{app}\zed.exe" "%V"`        |
| HKCR  | `Directory\Background\shell\Zed`| string    |           | `Using Zed to open`           |
| HKCR  | `Directory\Background\shell\Zed`| string    | Icon      | `{app}\zed.exe`               |
| HKCR  | `Directory\Background\shell\Zed\command` | string |         | `"{app}\zed.exe" "%V"`    |


In it `HKCR` stands for 'HKEY_CLASSES_ROOT', `{app}` stands for the directory you select.
