######################################################################
# Automatically generated by qmake (2.01a) Sat Feb 16 17:37:58 2013
######################################################################

TEMPLATE = lib

DEPENDPATH += .
INCLUDEPATH += . ../../core/src
CONFIG += plugin rtti exceptions
OBJECTS_DIR = obj
MOC_DIR = obj
UI_DIR = obj
include (../../core/QsLog/QsLog.pri)
QT -= gui
INCLUDEPATH += $$PWD/../../lib/core
DEPENDPATH += $$PWD/../../lib/core

#gittouch.commands = touch freeems.pro
#QMAKE_EXTRA_TARGETS += gittouch
#ePOST_TARGETDEPS += gittouch
QT += serialport core

win32-x-g++ { #Linux based crossplatform 32bit build
        TARGET = ../../../core/plugins/libreemsplugin
	win32:QMAKE_LFLAGS += -shared
	message("Building for win32-x-g++")
        INCLUDEPATH += /home/michael/QtWin32/libs/qjson/include
        LIBS += -L/home/michael/QtWin32/libs/qjson/lib -lqjson
	LIBS += -L/home/michael/QtWin32/lib
	DEFINES += GIT_COMMIT=$$system(git describe --dirty=-DEV --always)
	DEFINES += GIT_HASH=$$system(git log -n 1 --pretty=format:%H)
        DEFINES += GIT_DATE=\""$$system(date)"\"
        QMAKE_LFLAGS += -static-libgcc -static-libstdc++
} else:win64-x-g++ { #Linux based crossplatform 64bit build
        TARGET = ../../../core/plugins/libreemsplugin
	win32:QMAKE_LFLAGS += -shared
	message("Building for win64-x-g++")
        INCLUDEPATH += /home/michael/QtWin64/libs/qjson/include
        LIBS += -L/home/michael/QtWin64/libs/qjson/lib -lqjson
	LIBS += -L/home/michael/QtWin64/lib
	DEFINES += GIT_COMMIT=$$system(git describe --dirty=-DEV --always)
	DEFINES += GIT_HASH=$$system(git log -n 1 --pretty=format:%H)
        DEFINES += GIT_DATE=\""$$system(date)"\"
        QMAKE_LFLAGS += -static-libgcc -static-libstdc++
} else:win32 { #Windows based mingw build
        TARGET = ../../../core/plugins/libreemsplugin
	win32:QMAKE_LFLAGS += -shared
	message("Building for win32-g++")
        INCLUDEPATH += C:/libs/qjson/include
        #LIBS += -LC:/libs/qjson/lib -lqjson.dll
	DEFINES += GIT_COMMIT=$$system(\"c:/program files (x86)/git/bin/git.exe\" describe --dirty=-DEV --always)
	DEFINES += GIT_HASH=$$system(\"c:/program files (x86)/git/bin/git.exe\" log -n 1 --pretty=format:%H)
        QMAKE_LFLAGS += -static-libgcc -static-libstdc++
} else:mac {
        TARGET = ../../core/plugins/libreemsplugin
        INCLUDEPATH += /opt/local/include
        LIBS += -L/opt/local/lib -lqjson
        DEFINES += GIT_COMMIT=$$system(git describe --dirty=-DEV --always)
        DEFINES += GIT_HASH=$$system(git log -n 1 --pretty=format:%H)
        DEFINES += GIT_DATE=\""$$system(date)"\"
} else:unix {
	message("Building libreems for *nix");
	isEmpty($$PREFIX) {
		PREFIX = /usr/local
		message("LibreEMS Plugin using default install prefix " $$PREFIX);
	} else {
		message("LibreEMS Plugin using custom install prefix " $$PREFIX);
	}
	DEFINES += INSTALL_PREFIX=$$PREFIX
        TARGET = ../../core/plugins/libreemsplugin
	target.path = $$PREFIX/share/emstudio/plugins
	INSTALLS += target
        DEFINES += GIT_COMMIT=$$system(git describe --dirty=-DEV --always)
        DEFINES += GIT_HASH=$$system(git log -n 1 --pretty=format:%H)
        DEFINES += GIT_DATE=\""$$system(date)"\"
}

# Input
HEADERS += datapacketdecoder.h \
           table2ddata.h \
           table3ddata.h \
            ../../lib/core/configdata.h \
           ../../lib/core/datapacketdecoder.h \
           ../../lib/core/table2ddata.h \
           ../../lib/core/table3ddata.h \
           ../../lib/core/emscomms.h \
           ../../lib/core/rawdata.h \
	   tabledata.h \
           emscomms.h \
           memorymetadata.h \
	   fedatapacketdecoder.h \
           fetable2ddata.h \
           datafield.h \
           fetable3ddata.h \
           freeemscomms.h \
           serialport.h \
           serialrxthread.h \
	   fememorymetadata.h \
	   datafield.h \
    memorylocation.h \
    emsdata.h \
	   rawdata.h \
    ferawdata.h \
    packetdecoder.h \
    packet.h \
    feconfigdata.h \
    protocoldecoder.h \
    protocolencoder.h

SOURCES += fedatapacketdecoder.cpp \
           fetable2ddata.cpp \
           fetable3ddata.cpp \
           freeemscomms.cpp \
           serialport.cpp \
           serialrxthread.cpp \
	   fememorymetadata.cpp \
	   datafield.cpp \
    memorylocation.cpp \
    emsdata.cpp \
    ferawdata.cpp \
    packetdecoder.cpp \
    feconfigdata.cpp \
    protocoldecoder.cpp \
    protocolencoder.cpp