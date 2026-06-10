OUTPUT=hypr-bongocat.so

PKGS=pixman-1 libdrm hyprland pangocairo libinput libudev wayland-server xkbcommon
CXXFLAGS=-fPIC --no-gnu-unique -g -std=c++2b -O2 `pkg-config --cflags ${PKGS}`

.PHONY: all hyprpm clean load unload
all: $(OUTPUT)

$(OUTPUT): main.o CDotDecoration.o
	${CXX} -shared ${CXXFLAGS} -o $@ $^

hyprpm: all
	install -Dm644 bongo/*.png -t /var/cache/$(USER)/hyprpm/hypr-bongocat/bongo/

clean:
	rm main.o CDotDecoration.o hypr-bongocat.so

load: all unload
	hyprctl plugin load ${PWD}/$(OUTPUT)

unload:
	hyprctl plugin unload ${PWD}/$(OUTPUT)
