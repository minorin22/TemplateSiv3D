# Choose your favorite compiler.
CXX = c++ -std=c++17 -framework AudioToolbox -framework OpenAL
# Application Name(Require same name as the main cpp file)
NAME = Main
# Path to siv3d_v0.4.3_macOS
SIV3D = ../siv3d_v0.4.3_macOS

define PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>BuildMachineOSBuild</key>
	<string>19H2</string>
	<key>CFBundleDevelopmentRegion</key>
	<string>en</string>
	<key>CFBundleExecutable</key>
	<string>$@</string>
	<key>CFBundleIconFile</key>
	<string>$@.icns</string>
	<key>CFBundleIdentifier</key>
	<string>siv3d.empty</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>$@</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleSupportedPlatforms</key>
	<array>
		<string>MacOSX</string>
	</array>
	<key>CFBundleVersion</key>
	<string>1</string>
	<key>DTCompiler</key>
	<string>com.apple.compilers.llvm.clang.1_0</string>
	<key>DTPlatformBuild</key>
	<string>12C33</string>
	<key>DTPlatformName</key>
	<string>macosx</string>
	<key>DTPlatformVersion</key>
	<string>11.1</string>
	<key>DTSDKBuild</key>
	<string>20C63</string>
	<key>DTSDKName</key>
	<string>macosx11.1</string>
	<key>DTXcode</key>
	<string>1230</string>
	<key>DTXcodeBuild</key>
	<string>12C33</string>
	<key>LSMinimumSystemVersion</key>
	<string>10.14</string>
	<key>NSCameraUsageDescription</key>
	<string>This app requires camera access to function properly.</string>
	<key>NSMainNibFile</key>
	<string>MainMenu</string>
	<key>NSMicrophoneUsageDescription</key>
	<string>This app requires microphone access to record sounds.</string>
	<key>NSPrincipalClass</key>
	<string>NSApplication</string>
</dict>
</plist>
endef
export PLIST

SRCS       = $(wildcard ./*.cpp)
HEADERS    = $(wildcard ./*.hpp)

OBJS       = $(SRCS:./.cpp=obj/.o)

SIV3D_DEPS = -I$(SIV3D)/include\
             -I$(SIV3D)/include/Siv3D\
             -I$(SIV3D)/include/ThirdParty\
             -I$(SIV3D)/include/HamFramework\
             -L$(SIV3D)/lib/macOS\
             -L$(SIV3D)/lib/macOS/boost\
             -L$(SIV3D)/lib/macOS/freetype\
             -L$(SIV3D)/lib/macOS/glew\
             -L$(SIV3D)/lib/macOS/harfbuzz\
             -L$(SIV3D)/lib/macOS/libgif\
             -L$(SIV3D)/lib/macOS/libjpeg-turbo\
             -L$(SIV3D)/lib/macOS/libogg\
             -L$(SIV3D)/lib/macOS/libpng\
             -L$(SIV3D)/lib/macOS/libvorbis\
             -L$(SIV3D)/lib/macOS/libwebp\
             -L$(SIV3D)/lib/macOS/opencv\
             -L$(SIV3D)/lib/macOS/zlib\
             -lboost_filesystem\
             -lfreetype\
             -lGLEW\
             -lharfbuzz\
             -lSiv3D\
             -lgif\
             -lutil\
             -lturbojpeg\
             -logg\
             -lpng\
             -lvorbis\
             -lvorbisenc\
             -lvorbisfile\
             -lwebp\
             -lopencv_core\
             -lopencv_imgcodecs\
             -lopencv_imgproc\
             -lopencv_objdetect\
             -lopencv_photo\
             -lopencv_videoio\
             -lz

$(NAME): $(OBJS)
	$(CXX) $(SIV3D_DEPS) $^ -o $@
	mkdir -p $@.app/Contents/MacOS/
	mkdir -p $@.app/Contents/Resources/
	cp $@ $@.app/Contents/MacOS/
	cp -r $(SIV3D)/examples/empty/App/engine $@.app/Contents/Resources/
	touch $@.app/Contents/info.plist
	echo "$$PLIST" > $@.app/Contents/info.plist
ifeq (,$(wildcard ./$@.icns))
else
		cp $@.icns $@.app/Contents/Resources/
endif

$(OBJS): $(HEADERS)

install : $(NAME).app
	cp -r $< /Applications

run : $(NAME).app
	open $<

clean:
	rm -rf $(NAME)
	rm -rf $(NAME).app

.PHONY: clean install