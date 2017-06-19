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
		  /Fp"Release$(ARCH)/stdafx.pch" \
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


LDFLAGS	= /NOLOGO \
		  /LIBPATH:$(SYSLIB_LIBRARY_PATH) \
		  /LIBPATH:$(TARGET_PATH) \
		  /MACHINE:$(ARCH) \
		  /INCREMENTAL:NO \
		  /DLL \
		  /DEF:"weasel.def" \
		  /DEBUG /PDB:"$(TARGET_PATH)\WeaselIME.pdb"

LIBS	= WeaselIPC.lib \
		  kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib \
		  advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib \
		  imm32.lib


OBJS	= $(OBJS_PATH)/stdafx.obj \
		  $(OBJS_PATH)/WeaselIME.res \
		  $(OBJS_PATH)/dllmain.obj \
		  $(OBJS_PATH)/ime.obj \
		  $(OBJS_PATH)/KeyEvent.obj \
		  $(OBJS_PATH)/WeaselIME.obj

all:$(TARGET_PATH) $(OBJS_PATH) $(OBJS_PATH)/stdafx.pch $(TARGET_PATH)/weasel.ime

$(TARGET_PATH):
	mkdir $(TARGET_PATH)

$(OBJS_PATH):
	mkdir $(OBJS_PATH)

{.}.cpp{$(OBJS_PATH)}.obj:
	@cl $(CFLAGS) /Yu"StdAfx.h" $<

$(OBJS_PATH)/stdafx.pch:stdafx.h stdafx.cpp
	@echo create PCH
	@cl $(CFLAGS) /Yc"StdAfx.h" stdafx.cpp

$(OBJS_PATH)/WeaselIME.res:WeaselIME.rc
	rc /nologo /I ../include /D _UNICODE /D UNICODE /l"0x0409" /fo"$(OBJS_PATH)\WeaselIME.res" WeaselIME.rc 

$(TARGET_PATH)/weasel.ime:$(OBJS)
	link $(LDFLAGS) /OUT:"$(TARGET_PATH)/weasel.ime" \
		/IMPLIB:$(OBJS_PATH)/weasel.lib \
		$(OBJS) $(LIBS)

clean:
	rm -rf $(OBJS_PATH)

cleanall:clean
	rm -rf $(TARGET_PATH)/weasel.ime

