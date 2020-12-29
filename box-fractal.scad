_bigBox=false;
_smallBox=false;

module bigBox(cs=10, indent=1) {
  difference() {
    difference() {
      cube(cs, center=true);

      union() {
        for (i = [0,90,180,270]){ rotate(i) translate( [ ((cs/2) + (cs/2)/2) -indent , 0,0] ) cube(cs/2, center=true); }
        for (i = [90,270]){ rotate(i, [0,1,0]) translate( [ ((cs/2) + (cs/2)/2) -indent , 0,0] ) cube(cs/2, center=true); }
      }
    }

    union() {
      for (i = [0,90,180,270]){ rotate(i, [0,1,0]) cylinder(cs*2, center=true); }
      for (i = [90,270]){ rotate(i, [1,0,0]) cylinder(cs*2, center=true); }
    } 
  }
}

module smallBox(cs=5) {
  difference() {
    cube(cs, center=true);

    union() {
      for (i = [0,90,180,270]){ rotate(i, [0,1,0]) cylinder(cs*2, center=true); }
      for (i = [90,270]){ rotate(i, [1,0,0]) cylinder(cs*2, center=true); }
    } 
  }

}

if (_bigBox) { bigBox();  }
if (_smallBox) { smallBox(); }
