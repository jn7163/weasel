# build order
WeaselIPC           WeaselICP.lib

WeaselTSF           weasel.dll, weaselx64.dll
WeaselIME           weasel.ime, weaselx64.ime

RimeWithWeasel      RimeWithWeasel.lib
WeaselUI            WeaselUI.lib
WeaselIPCServer     WeaselIPCServer.lib
WeaselServer        WeaselServer.exe
WeaselDeployer      WeaselDeployer.exe
WeaselSetup         WeaselSetup.exe


using WeaselSetup.exe to install

default configure file will copy to `C:\Users\{username}\AppData\Roaming\Rime` on first startup.
and rime will generate some binary file, it is really slow, just wait.
if `weasel.yaml` not copy to that path, you may copy it yourself.

__Tips__

If you change yaml, must kill `WeaselServer.exe` process by yourself.



