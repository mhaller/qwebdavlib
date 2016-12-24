cmake_minimum_required(VERSION 2.8.12)

project(QWebDavExample)

set(VERSION 1.0)

cmake_minimum_required(VERSION 2.8.12)

project(QWebDav)

set(VERSION 1.0)

include(FeatureSummary)
find_package(ECM 5.28.0  NO_MODULE)
set_package_properties(ECM PROPERTIES TYPE REQUIRED DESCRIPTION "Extra CMake Modules." URL "https://projects.kde.org/projects/kdesupport/extra-cmake-modules")

set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)

set(REQUIRED_QT_VERSION 5.5.0)

find_package(Qt5 ${REQUIRED_QT_VERSION} CONFIG REQUIRED COMPONENTS Core Xml)
find_package(QWebDav REQUIRED)

add_executable(QWebDavExample
    main.cpp
    qexample.cpp
)

target_link_libraries(QWebDavExample
    QWebDav
)

install(TARGETS QWebDavExample
    ${KDE_INSTALL_TARGETS_DEFAULT_ARGS}
)

feature_summary(WHAT ALL   FATAL_ON_MISSING_REQUIRED_PACKAGES)
