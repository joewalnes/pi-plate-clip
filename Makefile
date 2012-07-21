all: pi-plate-clip.dxf

%.dxf: %.scad
	openscad -x $@ $<

clean:
	rm $(wildcard *.dxf)

.PHONY: all clean
