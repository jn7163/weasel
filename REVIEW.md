# weasel

## Sources
Fellow this build order,

| directory         | target                    | memo                      |
| ----------------  | ------------------------- | ------------------------- |
| WeaselIPC         | WeaselICP.lib             | boost的IPC库封装          |
| WeaselTSF         | weasel.dll, weaselx64.dll | Windows的TSF接口适配层    |
| WeaselIME         | weasel.ime, weaselx64.ime | Windows的IME接口适配层    |
| RimeWithWeasel    | RimeWithWeasel.lib        | 封装librime的接口         |
| WeaselUI          | WeaselUI.lib              | 输入法界面                |
| WeaselIPCServer   | WeaselIPCServer.lib       | boost的IPC库封装          |
| WeaselServer      | WeaselServer.exe          | 输入法的                  |
| WeaselDeployer    | WeaselDeployer.exe        | 输入法的配置工具          |
| WeaselSetup       | WeaselSetup.exe           | 输入法的安装工具          |


using `WeaselSetup.exe` to install

default configure file will copy to `C:\Users\{username}\AppData\Roaming\Rime` on first startup.
and rime will generate some binary file, it is really slow, just wait.
if `weasel.yaml` not copy to that path, you may copy it yourself.

__Tips__

If you change yaml, must kill `WeaselServer.exe` process by yourself.


## RimeWithWeasel
This is backend of weasel, and wrapped of `librime`

`BOOL RimeWithWeaselHandler::ProcessKeyEvent(weasel::KeyEvent keyEvent, UINT session_id, LPWSTR buffer)`







