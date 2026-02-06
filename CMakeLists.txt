cmake_minimum_required(VERSION 3.16)

project(ION_Test_Caculator VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Sql)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appION_Test_Caculator
    main.cpp
)

qt_add_qml_module(appION_Test_Caculator
    URI ION_Test_Caculator
    QML_FILES
        Main.qml

    RESOURCES
        assets/icons/logo_caculator.png
        assets/icons/bin.png
        assets/icons/history.png
        assets/icons/window.png
        assets/icons/menu.png

    SOURCES TinhToan.h TinhToan.cpp
    SOURCES LichSu.h LichSu.cpp
    QML_FILES CaculatorButton.qml
    QML_FILES HistoryPanel.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appION_Test_Caculator PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appION_Test_Caculator
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appION_Test_Caculator
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appION_Test_Caculator
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
