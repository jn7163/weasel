all:\
	Release$(ARCH) \
	Release$(ARCH)\WeaselICP.lib \
	Release$(ARCH)\weasel.dll \
	Release$(ARCH)\weasel.ime \
	Release$(ARCH)\RimeWithWeasel.lib \
	Release$(ARCH)\WeaselUI.lib \
	Release$(ARCH)\WeaselIPCServer.lib \
	Release$(ARCH)\WeaselServer.exe \
	Release$(ARCH)\WeaselSetup.exe \
	Release$(ARCH)\WeaselDeployer.exe \

Release$(ARCH):
	mkdir Release$(ARCH)

Release$(ARCH)\WeaselICP.lib:
	cd WeaselIPC && nmake /nologo -f Makefile_MT
	cd WeaselIPC && nmake /nologo

Release$(ARCH)\weasel.dll:
	cd WeaselTSF && nmake /nologo -f Makefile_MT
	cd WeaselTSF && nmake /nologo

Release$(ARCH)\weasel.ime:
	cd WeaselIME && nmake /nologo -f Makefile_MT
	cd WeaselIME && nmake /nologo

Release$(ARCH)\WeaselUI.lib:
	cd WeaselUI && nmake /nologo
	
Release$(ARCH)\WeaselIPCServer.lib:
	cd WeaselIPCServer && nmake /nologo

Release$(ARCH)\RimeWithWeasel.lib:
	cd RimeWithWeasel && nmake /nologo

Release$(ARCH)\WeaselServer.exe:
	cd WeaselServer && nmake /nologo

Release$(ARCH)\WeaselSetup.exe:
	cd WeaselSetup && nmake /nologo

Release$(ARCH)\WeaselDeployer.exe:
	cd WeaselDeployer && nmake /nologo

cleanall:
	cd WeaselIPC && nmake /nologo -f Makefile_MT cleanall
	cd WeaselIPC && nmake /nologo cleanall
	cd WeaselTSF && nmake /nologo -f Makefile_MT cleanall
	cd WeaselTSF && nmake /nologo cleanall
	cd WeaselIME && nmake /nologo -f Makefile_MT cleanall
	cd WeaselIME && nmake /nologo cleanall
	cd WeaselUI && nmake /nologo cleanall
	cd WeaselIPCServer && nmake /nologo cleanall
	cd RimeWithWeasel && nmake /nologo cleanall
	cd WeaselServer && nmake /nologo cleanall
	cd WeaselSetup && nmake /nologo cleanall
	cd WeaselDeployer && nmake /nologo cleanall
	rm -rf Release$(ARCH)
	rm -rf Release$(ARCH)_MT


