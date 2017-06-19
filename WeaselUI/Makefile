TARGET_PATH = ../Release$(ARCH)
OBJS_PATH 	= Release$(ARCH)

CFLAGS	= /nologo \
		  /I ../include \
		  /I "$(SYSLIB_INCLUDE_PATH)" \
		  /D _CRT_SECURE_NO_WARNINGS \
		  /D WIN32 /D NDEBUG /D _LIB \
		  /D _UNICODE /D UNICODE \
		  /fp:precise \
		  /Zc:wchar_t \
		  /Zc:forScope \
		  /EHsc /O2 \
		  /Fo"$(OBJS_PATH)/" \
		  /Fd"$(OBJS_PATH)/vc140.pdb" \
		  /Fp"$(OBJS_PATH)/stdafx.pch" \
		  /MD \
		  /c

# enable intrinsic function
CFLAGS	= $(CFLAGS) /Oi

# enable security checks
CFLAGS	= $(CFLAGS) /GS

# enable separate functions for linker
CFLAGS	= $(CFLAGS) /Gy

# enable warning level3, and warning not treat as error
CFLAGS	= $(CFLAGS) /W3 /WX-

# enable debug information
CFLAGS	= $(CFLAGS) /Zi


OBJS	= $(OBJS_PATH)/stdafx.obj \
		  $(OBJS_PATH)/FullScreenLayout.obj \
		  $(OBJS_PATH)/Layout.obj \
		  $(OBJS_PATH)/VerticalLayout.obj \
		  $(OBJS_PATH)/WeaselTrayIcon.obj \
		  $(OBJS_PATH)/HorizontalLayout.obj \
		  $(OBJS_PATH)/StandardLayout.obj \
		  $(OBJS_PATH)/SystemTraySDK.obj \
		  $(OBJS_PATH)/WeaselPanel.obj \
		  $(OBJS_PATH)/WeaselUI.obj


all:$(TARGET_PATH) $(OBJS_PATH) $(OBJS_PATH)/stdafx.pch $(TARGET_PATH)/WeaselUI.lib

$(TARGET_PATH):
	mkdir $(TARGET_PATH)

$(OBJS_PATH):
	mkdir $(OBJS_PATH)

{.}.cpp{$(OBJS_PATH)}.obj:
	@cl $(CFLAGS) /Yu"StdAfx.h" $<

$(OBJS_PATH)/stdafx.pch:stdafx.h stdafx.cpp
	@echo create PCH
	@cl $(CFLAGS) /Yc"StdAfx.h" stdafx.cpp

$(TARGET_PATH)/WeaselUI.lib:$(OBJS)
	lib /nologo /out:"$(TARGET_PATH)/WeaselUI.lib" $(OBJS)

clean:
	rm -rf $(OBJS_PATH)

cleanall:clean
	rm -rf $(TARGET_PATH)/WeaselUI.lib

