TARGET := iphone:clang:latest:7.0
ARCHS := arm64

include $(THEOS)/makefiles/common.mk

TOOL_NAME = proxytool

proxytool_FILES = main.mm WiFiProxy.m
crane-cli_CFLAGS = -fobjc-arc
proxytool_FRAMEWORKS = Foundation SystemConfiguration
proxytool_CODESIGN_FLAGS = -Sentitlements.plist
proxytool_LDFLAGS = -undefined dynamic_lookup
proxytool_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
