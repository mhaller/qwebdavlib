cmake_minimum_required(VERSION 2.8.12)

project(QWebdav)

set(VERSION 1.0)

include(FeatureSummary)
find_package(ECM 5.28.0  NO_MODULE)
set_package_properties(ECM PROPERTIES TYPE REQUIRED DESCRIPTION "Extra CMake Modules." URL "https://projects.kde.org/projects/kdesupport/extra-cmake-modules")
feature_summary(WHAT REQUIRED_PACKAGES_NOT_FOUND FATAL_ON_MISSING_REQUIRED_PACKAGES)

set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)

include(GenerateExportHeader)

set(REQUIRED_QT_VERSION 5.5.0)
find_package(Qt5 ${REQUIRED_QT_VERSION} CONFIG REQUIRED COMPONENTS Core Network Xml)

include(ECMSetupVersion)
include(ECMGenerateHeaders)

ecm_setup_version(${VERSION}
    VARIABLE_PREFIX QWEBDAV
    VERSION_HEADER "${CMAKE_CURRENT_BINARY_DIR}/qwebdav_version.h"
    PACKAGE_VERSION_FILE "${CMAKE_CURRENT_BINARY_DIR}/QWebdavConfigVersion.cmake"
    SOVERSION 1)

add_subdirectory(qwebdavlib)

# create a Config.cmake and a ConfigVersion.cmake file and install them
set(CMAKECONFIG_INSTALL_DIR "${KDE_INSTALL_CMAKEPACKAGEDIR}/QWebdav")

include(ECMPackageConfigHelpers)

ecm_configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/QWebdavConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/QWebdavConfig.cmake"
    INSTALL_DESTINATION ${CMAKECONFIG_INSTALL_DIR}
)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/qwebdav_version.h
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        COMPONENT Devel)

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/QWebdavConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/QWebdavConfigVersion.cmake"
        DESTINATION "${CMAKECONFIG_INSTALL_DIR}"
        COMPONENT Devel)

install(EXPORT QWebdavTargets
        DESTINATION "${CMAKECONFIG_INSTALL_DIR}"
        FILE QWebdavTargets.cmake)

feature_summary(WHAT ALL   FATAL_ON_MISSING_REQUIRED_PACKAGES)
