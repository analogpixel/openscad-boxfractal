bin=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
fn=box-fractal.scad

define create-part
	$(bin) -o $(@).stl -D "_$(@)=true" $(fn)
endef

bigBox:
	$(create-part)

smallBox:
	$(create-part)

all: bigBox smallBox

clean:
	rm *.stl
