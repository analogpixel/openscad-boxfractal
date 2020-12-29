bin=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
fn=box-fractal.scad

define create-part
	$(bin) -o $(@).stl $(fn)
endef

# _bigBox : box that can hold other boxes
# _smallBox : fits into bigBox

box1_60:
	$(create-part) -D "_cs=60" -D "_bigBox=true" 

box2_30:
	$(create-part) -D "_cs=30" -D "_bigBox=true"

box3_15:
	$(create-part) -D "_cs=15" -D "_smallBox=true"

bigBox:
	$(create-part) -D  "_bigBox=true"

smallBox:
	$(create-part) -D "_smallBox=true"

all: box1_60 box2_30 box3_15

clean:
	rm *.stl
