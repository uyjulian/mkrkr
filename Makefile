
##### OPTIONS #####
TVP_IMAGE_ENABLE_WEBP ?= 1
TVP_IMAGE_ENABLE_BPG ?= 
TVP_IMAGE_ENABLE_BMP ?= 1
TVP_IMAGE_ENABLE_TLG ?= 1
TVP_IMAGE_ENABLE_PNG ?= 1
TVP_IMAGE_ENABLE_JPEG ?= 1
TVP_IMAGE_ENABLE_JXR ?= 1
TVP_AUDIO_ENABLE_WAVE ?= 1
TVP_AUDIO_ENABLE_OPUS ?= 1
TVP_AUDIO_ENABLE_VORBIS ?= 1
TVP_AUDIO_ENABLE_FFMPEG ?= 1
TVP_ARCHIVE_ENABLE_ZIP ?= 1
TVP_ARCHIVE_ENABLE_7Z ?= 1 
TVP_ARCHIVE_ENABLE_TAR ?= 1
TVP_ARCHIVE_ENABLE_XP3 ?= 1
TVP_RENDERER_ENABLE_ADDITIONAL_COMPRESSION ?=
TVP_RENDERER_ENABLE_OPENGL ?=
CC = clang
CXX = clang++
AR = 
ASM = 
CFLAGS += -Ofast -march=native -g
CXXFLAGS += -std=c++0x
# CFLAGS += -O0 -g
# GIT_HASH = $(shell git rev-parse --short HEAD)
GIT_HASH = nothing
CUR_TIME = $(shell date +%s)
CFLAGS += -Wall
CFLAGS += -DTVP_LOG_TO_COMMANDLINE_CONSOLE -DTVP_NO_CHECK_WIDE_CHAR_SIZE -DUSE_OBSOLETE_FUNCTIONS -DDEBUG -DTVP_TEXT_READ_ANSI_MBCS 
CFLAGS += -I.
CFLAGS += -Isrc
CFLAGS += -Isrc/objects
CFLAGS += -Isrc/utils
CFLAGS += -Isrc/base
CFLAGS += -Isrc/visual
CFLAGS += -Isrc/visual/sdl
CFLAGS += -Isrc/sound
CFLAGS += -Isrc/environ
CFLAGS += -Isrc/extension
CFLAGS += -Isrc/sdl
CFLAGS += -Isrc/movie
CFLAGS += -Isrc/core
CFLAGS += -Isrc/tjs2
CFLAGS += -Isrc/tjs2/base
CFLAGS += -Isrc/tjs2/msg
CFLAGS += -Isrc/tjs2/utils
CFLAGS += -Isrc/plugins/KAGParser
CFLAGS += -Isrc/objects/tween
CFLAGS += -Isrc/plugins/layerEx
CFLAGS += -Isrc/plugins
CFLAGS += -Isrc/plugins/ncbind
CFLAGS += -Isrc/plugins/layerexsave/LodePNG

LDLIBS += -framework CoreAudio
LDLIBS += -framework OpenGL
LDLIBS += -framework AudioToolbox
LDLIBS += -framework ForceFeedback
LDLIBS += -framework Carbon
LDLIBS += -framework CoreFoundation
LDLIBS += -framework Cocoa
LDLIBS += -framework IOKit
LDLIBS += -framework CoreVideo
LDLIBS += -framework Metal
LDLIBS += -framework AVFoundation
LDLIBS += -framework CoreMedia
LDLIBS += -framework Security
LDLIBS += -framework VideoToolbox

CFLAGS += -I/usr/local/opt/zlib/include
LDFLAGS += -L/usr/local/opt/zlib/lib
LDLIBS += -lz

CFLAGS += -I/usr/local/opt/opencv/include/opencv4
LDFLAGS += -L/usr/local/opt/opencv/lib
LDLIBS += -lopencv_core -lopencv_imgproc

CFLAGS += -I/usr/local/opt/sdl2/include/SDL2
LDFLAGS += -L/usr/local/opt/sdl2/lib
LDLIBS += -lSDL2

CFLAGS += -I/usr/local/opt/oniguruma/include
LDFLAGS += -L/usr/local/opt/oniguruma/lib
LDLIBS += -lonig

CFLAGS += -I/usr/local/opt/freetype/include -I/usr/local/opt/freetype/include/freetype2
LDFLAGS += -L/usr/local/opt/freetype/lib
LDLIBS += -lfreetype

CFLAGS += -I/usr/local/opt/openal-soft/include
LDFLAGS += -L/usr/local/opt/openal-soft/lib
LDLIBS += -lopenal

CFLAGS += -I/usr/local/opt/boost/include
LDFLAGS += -L/usr/local/opt/boost/lib
LDLIBS += -lboost_filesystem -lboost_system

CFLAGS += -I/usr/local/opt/glew/include
LDFLAGS += -L/usr/local/opt/glew/lib
LDLIBS += -lglew

ifdef TVP_IMAGE_ENABLE_WEBP
	CFLAGS += -DTVP_IMAGE_ENABLE_WEBP
	CFLAGS += -I/usr/local/opt/webp/include
	LDFLAGS += -L/usr/local/opt/webp/lib
	LDLIBS += -lwebp
endif

ifdef TVP_IMAGE_ENABLE_BPG
	CFLAGS += -DTVP_IMAGE_ENABLE_BPG
	CFLAGS += -I/usr/local/opt/libbpg/include
	LDFLAGS += -I/usr/local/opt/libbpg/lib
	LDLIBS += -lbpg
endif

ifdef TVP_IMAGE_ENABLE_BMP
	CFLAGS += -DTVP_IMAGE_ENABLE_BMP
endif

ifdef TVP_IMAGE_ENABLE_TLG
	CFLAGS += -DTVP_IMAGE_ENABLE_TLG
endif

ifdef TVP_IMAGE_ENABLE_PNG
	CFLAGS += -DTVP_IMAGE_ENABLE_PNG
	CFLAGS += -I/usr/local/opt/libpng/include
	LDFLAGS += -L/usr/local/opt/libpng/lib
	LDLIBS += -lpng
endif

ifdef TVP_IMAGE_ENABLE_JPEG
	CFLAGS += -DTVP_IMAGE_ENABLE_JPEG
	CFLAGS += -I/usr/local/opt/libjpeg-turbo/include
	LDFLAGS += -L/usr/local/opt/libjpeg-turbo/lib
	LDLIBS += -lturbojpeg
endif

ifdef TVP_IMAGE_ENABLE_JXR
	CFLAGS += -DTVP_IMAGE_ENABLE_JXR -DINITGUID
	CFLAGS += -I/usr/local/opt/jxrlib/include -I/usr/local/opt/jxrlib/include/glue -I/usr/local/opt/jxrlib/include/image/sys -I/usr/local/opt/jxrlib/include/common/include
	LDFLAGS += -L/usr/local/opt/jxrlib/lib
	LDLIBS += -ljpegxr -ljxrglue
endif

ifdef TVP_AUDIO_ENABLE_WAVE
	CFLAGS += -DTVP_AUDIO_ENABLE_WAVE
endif

ifdef TVP_AUDIO_ENABLE_OPUS
	CFLAGS += -DTVP_AUDIO_ENABLE_OPUS
	CFLAGS += -I/usr/local/opt/opus/include/opus -I/usr/local/opt/opusfile/include/opus
	LDFLAGS += -L/usr/local/opt/opus/lib -L/usr/local/opt/opusfile/lib
	LDLIBS += -lopus -lopusfile
endif

ifdef TVP_AUDIO_ENABLE_VORBIS
	CFLAGS += -DTVP_AUDIO_ENABLE_VORBIS
	CFLAGS += -I/usr/local/opt/libvorbis/include/vorbis
	LDFLAGS += -L/usr/local/opt/libvorbis/lib
	LDLIBS += -lvorbis -lvorbisfile
endif

ifdef TVP_AUDIO_ENABLE_FFMPEG
	CFLAGS += -DTVP_AUDIO_ENABLE_FFMPEG
	CFLAGS += -I/usr/local/opt/ffmpeg/include
	LDFLAGS += -L/usr/local/opt/ffmpeg/lib
	LDLIBS += -lavcodec -lavdevice -lavfilter -lavformat -lavresample -lavutil -lpostproc -lswresample -lswscale
endif

ifdef TVP_RENDERER_ENABLE_ADDITIONAL_COMPRESSION
	CFLAGS += -DTVP_RENDERER_ENABLE_ADDITIONAL_COMPRESSION
	CFLAGS += -I/usr/local/opt/xxhash/include -I/usr/local/opt/lz4/include
	LDFLAGS += -L/usr/local/opt/xxhash/lib -L/usr/local/opt/lz4/lib
	LDLIBS += -lxxhash -llz4
endif

ifdef TVP_RENDERER_ENABLE_OPENGL
	CFLAGS += -DTVP_RENDERER_ENABLE_OPENGL -DGL_SILENCE_DEPRECATION
	CFLAGS += -framework OpenGL
	LDLIBS += -framework OpenGL
endif

ifdef TVP_ARCHIVE_ENABLE_ZIP
	CFLAGS += -DTVP_ARCHIVE_ENABLE_ZIP
endif

ifdef TVP_ARCHIVE_ENABLE_7Z
	CFLAGS += -DTVP_ARCHIVE_ENABLE_7Z
endif

ifdef TVP_ARCHIVE_ENABLE_TAR
	CFLAGS += -DTVP_ARCHIVE_ENABLE_TAR
endif

ifdef TVP_ARCHIVE_ENABLE_XP3
	CFLAGS += -DTVP_ARCHIVE_ENABLE_XP3
endif

%.o: %.c
	@echo -e "\tCC  $<"
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.cpp
	@echo -e "\tCXX  $<"
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) -o $@ $<

SOURCES := 
SOURCES += ./main.cpp
SOURCES += src/Application.cpp
SOURCES += src/base/BinaryStream.cpp
SOURCES += src/base/EventImpl.cpp
SOURCES += src/base/EventIntf.cpp
SOURCES += src/base/FuncStubs.cpp
SOURCES += src/base/NativeEventQueue.cpp
SOURCES += src/base/PluginIntf.cpp
SOURCES += src/base/ScriptMgnIntf.cpp
SOURCES += src/base/StaticPluginImpl.cpp
SOURCES += src/base/StorageImpl.cpp
SOURCES += src/base/StorageIntf.cpp
SOURCES += src/base/SysInitIntf.cpp
SOURCES += src/base/SystemImpl.cpp
SOURCES += src/base/SystemIntf.cpp
SOURCES += src/base/TextStream.cpp
SOURCES += src/base/UtilStreams.cpp
SOURCES += src/base/XP3Archive.cpp
SOURCES += src/core/GLDevice.cpp
SOURCES += src/core/alDevice.cpp
SOURCES += src/core/alObjects.cpp
SOURCES += src/core/baseAudio.cpp
SOURCES += src/core/ffmpegDecode.cpp
SOURCES += src/core/ffvideo.cpp
SOURCES += src/core/gltexture.cpp
SOURCES += src/core/main.c
SOURCES += src/core/updateMgr.cpp
SOURCES += src/environ/TouchPoint.cpp
SOURCES += src/extension/Extension.cpp
SOURCES += src/movie/FFVideoOverlay.cpp
SOURCES += src/movie/TVPVideoOverlay.cpp
SOURCES += src/movie/VideoOvlImpl.cpp
SOURCES += src/movie/VideoOvlIntf.cpp
SOURCES += src/objects/DebugIntf.cpp
SOURCES += src/objects/Tween.cpp
SOURCES += src/objects/TweenImpl.cpp
SOURCES += src/objects/ease.cpp
SOURCES += src/objects/stringutils.cpp
SOURCES += src/plugins/KAGParser/KAGParser.cpp
SOURCES += src/plugins/KAGParser/Main.cpp
SOURCES += src/plugins/fstat/Main.cpp
SOURCES += src/plugins/json/Main.cpp
SOURCES += src/plugins/layerExAreaAverage/main.cpp
SOURCES += src/plugins/layerExImage/LayerExImage.cpp
SOURCES += src/plugins/layerExImage/Main.cpp
SOURCES += src/plugins/layerexsave/LodePNG/lodepng.cpp
SOURCES += src/plugins/layerexsave/Main.cpp
SOURCES += src/plugins/layerexsave/savepng.cpp
SOURCES += src/plugins/layerexsave/savetlg5.cpp
SOURCES += src/plugins/layerexsave/utils.cpp
SOURCES += src/plugins/ncbind/ncbind.cpp
SOURCES += src/plugins/saveStruct/Main.cpp
SOURCES += src/plugins/tp_stub.cpp
SOURCES += src/sdl/SDLWindow.cpp
SOURCES += src/sdl/inputEvent.cpp
# SOURCES += src/sdl/load_bmp.cpp
SOURCES += src/sdl/sdlEvent.cpp
SOURCES += src/sdl/sdlinit.cpp
SOURCES += src/sound/MathAlgorithms.cpp
SOURCES += src/sound/PhaseVocoderDSP.cpp
SOURCES += src/sound/PhaseVocoderFilter.cpp
SOURCES += src/sound/RealFFT.cpp
SOURCES += src/sound/SoundBufferBaseImpl.cpp
SOURCES += src/sound/SoundBufferBaseIntf.cpp
SOURCES += src/sound/WaveFormatConverter.cpp
SOURCES += src/sound/WaveIntf.cpp
SOURCES += src/sound/WaveLoopManager.cpp
SOURCES += src/sound/WaveSegmentQueue.cpp
SOURCES += src/sound/sdlWaveImpl.cpp
SOURCES += src/tjs2/base/CharacterSet.cpp
SOURCES += src/tjs2/base/shift_jis_decode.cpp
SOURCES += src/tjs2/base/shift_jis_tables.cpp
SOURCES += src/tjs2/msg/MsgImpl.cpp
SOURCES += src/tjs2/msg/MsgIntf.cpp
SOURCES += src/tjs2/msg/MsgLoad.cpp
SOURCES += src/tjs2/msg/string_table.cpp
SOURCES += src/tjs2/tjs.cpp
SOURCES += src/tjs2/tjs.tab.cpp
SOURCES += src/tjs2/tjsArray.cpp
SOURCES += src/tjs2/tjsBinarySerializer.cpp
SOURCES += src/tjs2/tjsByteCodeLoader.cpp
SOURCES += src/tjs2/tjsCompileControl.cpp
SOURCES += src/tjs2/tjsConfig.cpp
SOURCES += src/tjs2/tjsConstArrayData.cpp
SOURCES += src/tjs2/tjsDate.cpp
SOURCES += src/tjs2/tjsDateParser.cpp
SOURCES += src/tjs2/tjsDebug.cpp
SOURCES += src/tjs2/tjsDictionary.cpp
SOURCES += src/tjs2/tjsDisassemble.cpp
SOURCES += src/tjs2/tjsError.cpp
SOURCES += src/tjs2/tjsException.cpp
SOURCES += src/tjs2/tjsGlobalStringMap.cpp
SOURCES += src/tjs2/tjsInterCodeExec.cpp
SOURCES += src/tjs2/tjsInterCodeGen.cpp
SOURCES += src/tjs2/tjsInterface.cpp
SOURCES += src/tjs2/tjsLex.cpp
SOURCES += src/tjs2/tjsMT19937ar-cok.cpp
SOURCES += src/tjs2/tjsMath.cpp
SOURCES += src/tjs2/tjsMessage.cpp
SOURCES += src/tjs2/tjsNamespace.cpp
SOURCES += src/tjs2/tjsNative.cpp
SOURCES += src/tjs2/tjsObject.cpp
SOURCES += src/tjs2/tjsObjectExtendable.cpp
SOURCES += src/tjs2/tjsOctPack.cpp
SOURCES += src/tjs2/tjsRandomGenerator.cpp
SOURCES += src/tjs2/tjsRegExp.cpp
SOURCES += src/tjs2/tjsScriptBlock.cpp
SOURCES += src/tjs2/tjsScriptCache.cpp
SOURCES += src/tjs2/tjsString.cpp
SOURCES += src/tjs2/tjsUtils.cpp
SOURCES += src/tjs2/tjsVariant.cpp
SOURCES += src/tjs2/tjsVariantString.cpp
SOURCES += src/tjs2/tjsdate.tab.cpp
SOURCES += src/tjs2/tjspp.tab.cpp
SOURCES += src/tjs2/utils/cp932_uni.cpp
SOURCES += src/tjs2/utils/uni_cp932.cpp
SOURCES += src/utils/MiscUtility.cpp
SOURCES += src/utils/Random.cpp
SOURCES += src/utils/TVPTimer.cpp
SOURCES += src/utils/ThreadImpl.cpp
SOURCES += src/utils/ThreadIntf.cpp
SOURCES += src/utils/TimerImpl.cpp
SOURCES += src/utils/TimerIntf.cpp
SOURCES += src/utils/md5.c
SOURCES += src/utils/utils.cpp
SOURCES += src/visual/BitmapBitsAlloc.cpp
SOURCES += src/visual/BitmapInfomation.cpp
SOURCES += src/visual/BitmapIntf.cpp
SOURCES += src/visual/BitmapLayerTreeOwner.cpp
SOURCES += src/visual/CharacterData.cpp
SOURCES += src/visual/ComplexRect.cpp
SOURCES += src/visual/FontSystem.cpp
SOURCES += src/visual/FreeType.cpp
SOURCES += src/visual/FreeTypeFontRasterizer.cpp
SOURCES += src/visual/GraphicsLoaderImpl.cpp
SOURCES += src/visual/GraphicsLoaderIntf.cpp
SOURCES += src/visual/LayerBitmapImpl.cpp
SOURCES += src/visual/LayerBitmapIntf.cpp
SOURCES += src/visual/LayerImpl.cpp
SOURCES += src/visual/LayerIntf.cpp
SOURCES += src/visual/LayerManager.cpp
SOURCES += src/visual/LayerTreeOwnerImpl.cpp
SOURCES += src/visual/LoadPNG.cpp
SOURCES += src/visual/LoadTLG.cpp
SOURCES += src/visual/PrerenderedFont.cpp
SOURCES += src/visual/RectItf.cpp
SOURCES += src/visual/ResampleImage.cpp
SOURCES += src/visual/SaveTLG5.cpp
SOURCES += src/visual/SaveTLG6.cpp
SOURCES += src/visual/TransIntf.cpp
SOURCES += src/visual/WeightFunctor.cpp
SOURCES += src/visual/WindowImpl.cpp
SOURCES += src/visual/WindowIntf.cpp
SOURCES += src/visual/sdl/BasicDrawDevice.cpp
SOURCES += src/visual/sdl/DrawDevice.cpp
SOURCES += src/visual/sdl/blend_function.cpp
SOURCES += src/visual/tvpgl.c
OBJECTS := $(SOURCES:.c=.o)
OBJECTS := $(OBJECTS:.cpp=.o)
OBJECTS := $(OBJECTS:.asm=.o)
OBJECTS := $(OBJECTS:.rc=.o)

BINARY ?= mkrkr
ARCHIVE ?= mkrkr.$(GIT_HASH).7z

all: $(BINARY)

archive: $(ARCHIVE)

clean:
	rm -f $(OBJECTS) $(BINARY) $(ARCHIVE)

$(ARCHIVE): $(BINARY)
	rm -f $(ARCHIVE)
	7z a $@ $^

$(BINARY): $(OBJECTS) 
	@echo -e "\tLNK $@"
	$(CXX) $(CFLAGS) $(LDFLAGS)  -o $@ $^  $(LDLIBS)
