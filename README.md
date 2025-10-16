# win-zed
> [!Tip]
> Here! Congrations for the official support for Windows! You can go [there to get the official release](https://github.com/zed-industries/zed/releases/tag/v0.208.4)

![Number of GitHub Downloads badge](https://img.shields.io/github/downloads/gzqccnu/win-zed/total?color=pink&label=GitHub%20Downloads)

A built Windows release of [Zed](https://github.com/zed-industries/zed) (non-official). Zed version: 0.202.0. Here offer the [installer executable file](https://github.com/gzqccnu/win-zed/releases/download/0.1.0/win-zed-setup.exe). Or you can using the [script](./win-zed-setup.iss) to build your own `installer`, but actually it needs the pre-built **zed**. So I recommend you to just run the `installer`, why I offer the building file is to make it clear what the installer did. Also the `installer` will make your use more comfortable, you can find it in [feature](#feature).

> [!Caution]
> If you want to uninstall it, you can run **unins000.exe**. Before you run it, you must kill your `zed.exe` process. Or zed.exe will still here, although you can delete it by yourself.

## Feature
- **CLI:**
You can use **zed** in command.
- **Contextual relevance:**
After you install **win-zed** by installer. When you Right-Click the `file` or `direcory` or the `blank` in**Windows File Explorer**, you will find **zed** in the context menu, that means you can conviently open file or directory or project with **zed**.

## Registry
This part lists all the **installer** do in **Registry**. It will benifit you if you want to know what the `installer` do.
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
> The installer offers CLI option. However, if you found you can't use it in command, you can run [Add to PATH](./AddZedPATH.bat) to add zed directory to system environments.

## Other
> [!Important]
> The repository is just to want more user can use zed not for other use. If there any thing wrong, let me know or you could add a issue, and I will delete this repository.

If you just want a **zed-like** theme, you can go [here](https://github.com/gzqccnu/zed-one-theme-vsc) to get vsc extension providing **zed-like** theme supports **light**, **dark** theme.