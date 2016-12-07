
set(qwebdav_SRCS
    qnaturalsort.cpp
    qwebdav.cpp
    qwebdavdirparser.cpp
    qwebdavitem.cpp
)

add_library(QWebDav ${qwebdav_SRCS})
generate_export_header(QWebDav)

target_compile_definitions(QWebDav PRIVATE QWEBDAV_LIBRARY=1)
target_include_directories(QWebDav
    INTERFACE "$<INSTALL_INTERFACE:${KDE_INSTALL_INCLUDEDIR}/QWebDav>")

target_link_libraries(QWebDav
    PUBLIC
        Qt5::Core
        Qt5::Network
        Qt5::Xml
)

set_target_properties(QWebDav PROPERTIES
    VERSION     ${QWEBDAV_VERSION_STRING}
    SOVERSION   ${QWEBDAV_SOVERSION}
    EXPORT_NAME "QWebDav"
)

ecm_generate_headers(QWebDav_HEADERS
    HEADER_NAMES
    QWebDav
    QWebDavItem
    QWebDavDirParser
    QNaturalSort
    QWebDav_global

    REQUIRED_HEADERS QWebDav_HEADERS
)

install(TARGETS QWebDav
    EXPORT QWebDavTargets
    ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/qwebdav_export.h
    ${QWebDav_HEADERS}
    DESTINATION ${KDE_INSTALL_INCLUDEDIR}/QWebDav
    COMPONENT Devel
)
