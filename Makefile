
PKGS=pixman-1 libdrm hyprland pangocairo libinput libudev wayland-server xkbcommon
CXXFLAGS=-fPIC --no-gnu-unique -g -std=c++2b -O2 `pkg-config --cflags ${PKGS}`

.PHONY: all hyprpm clean
all: hypr-bongocat.so

hypr-bongocat.so: main.o CDotDecoration.o
	${CXX} -shared ${CXXFLAGS} -o $@ $<

hyprpm: all
	install -Dm644 bongo/*.png -t /var/cache/$(USER)/hyprpm/hypr-bongocat/bongo/

clean:
	rm main.o CDotDecoration.o hypr-bongocat.so
