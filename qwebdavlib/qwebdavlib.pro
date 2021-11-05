QT       += network xml

# for a qwebdavlib without support for GUI
QT       -= gui

TARGET = qwebdav
TEMPLATE = lib

# SG: remove debugging define
#DEFINES += DEBUG_WEBDAV

# Enable extended WebDAV properties (see QWebDavItem.h/cpp)
#DEFINES += QWEBDAVITEM_EXTENDED_PROPERTIES

# DO NOT REMOVE - REQUIRED BY qwebdav_global.h
DEFINES += QWEBDAV_LIBRARY

SOURCES += qwebdav.cpp \
    qwebdavitem.cpp \
    qwebdavdirparser.cpp \
    qnaturalsort.cpp

HEADERS += qwebdav.h \
    qwebdavitem.h \
    qwebdavdirparser.h \
    qnaturalsort.h \
    qwebdav_global.h

OTHER_FILES += \
    CHANGES \
    LICENSE \
    README

headers.files = $$HEADERS
headers.path = $$WEBDAV_INCLUDE_DIR
target.path = $$WEBDAV_LIB_DIR
INSTALLS += headers target
