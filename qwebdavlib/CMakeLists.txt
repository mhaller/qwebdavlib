
set(qwebdav_SRCS
    qnaturalsort.cpp
    qwebdav.cpp
    qwebdavdirparser.cpp
    qwebdavitem.cpp
)

add_library(QWebdav ${qwebdav_SRCS})
generate_export_header(QWebdav)

target_compile_definitions(QWebdav PRIVATE QWEBDAV_LIBRARY=1)
target_include_directories(QWebdav
    INTERFACE "$<INSTALL_INTERFACE:${KDE_INSTALL_INCLUDEDIR}/QWebdav>")

target_link_libraries(QWebdav
    PUBLIC
        Qt5::Core
        Qt5::Network
        Qt5::Xml
)

set_target_properties(QWebdav PROPERTIES
    VERSION     ${QWEBDAV_VERSION_STRING}
    SOVERSION   ${QWEBDAV_SOVERSION}
    EXPORT_NAME "QWebdav"
)

ecm_generate_headers(QWebdav_HEADERS
    HEADER_NAMES
    QWebdav
    QWebdavItem
    QWebdavDirParser
    QNaturalSort
    QWebdav_global

    REQUIRED_HEADERS QWebdav_HEADERS
)

install(TARGETS QWebdav
    EXPORT QWebdavTargets
    ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/qwebdav_export.h
    ${QWebdav_HEADERS}
    DESTINATION ${KDE_INSTALL_INCLUDEDIR}/QWebdav
    COMPONENT Devel
)
