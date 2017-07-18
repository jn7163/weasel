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

## boost IPC message format
The user defined message is look like this:
```
#comment\n
action=A,B,C,D\n
commit=stringaaaa\n
status.ascii_mode=\d+\n
status.composing=\d+\n
status.disabled=\d+\n
ctx.preedit=\s+\n
ctx.preedit.cursor=\d+,\d+\n
.\n
```

`.\n` indicate message end.


## WeaselIME
The IME dll send Windows Message to WeaselIPCServer, expect boost message for reading.

```cpp
bool accepted = m_client.ProcessKeyEvent(ke);

// get commit string from server
wstring commit;
weasel::Status status;
weasel::ResponseParser parser(&commit, NULL, &status);
bool ok = m_client.GetResponseData(boost::ref(parser));
```

this `ProcessKeyEvent` send message, and `GetResponseData` wait for response.
the real `GetResponseData` implement in `WeaselIPC/WeaselIPCImpl.cpp`.



## RimeWithWeasel
This is backend of weasel, and wrapped of `librime`, the fellow interface is the main event entry of every inputs.
WeaselUI show some candidate words.

```cpp
BOOL RimeWithWeaselHandler::ProcessKeyEvent(weasel::KeyEvent keyEvent, UINT session_id, LPWSTR buffer)
```

`ProcessKeyEvent` call `RimeGetCommit` everytime it called.
And commit string is store inside librime, then the WeaselIPCServer will send message to Client.
the message buffer is `boost::interprocess::wbufferstream`.










