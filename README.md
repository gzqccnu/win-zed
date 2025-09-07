# win-zed

A built Windows version of [Zed](https://github.com/zed-industries/zed). Zed version: 0.202.0. Here offer the installer executable file. Or you can using the script to build your own `installer`.

> [!Caution]
> If you want to uninstall it, you can run **uninstall000.exe**. Before you run it, you must kill your `zed.exe` process. Or zed.exe will still here, although you can delete it by yourself.

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
> The installer doesn't offer CLI option. If you want a **zed-cli**, you can add the directory you install it, i.e. {app} to your PATH. Then you could use zed-cli.

## Other
> [!Important]
> The repository is just to want more user can use zed not for other use. If there any thing wrong, let me know or you could add a issue, and I will delete this repository.