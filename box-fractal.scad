_bigBox=false;
_smallBox=false;
_allHoles=false;
_cs=30;

module bigBox(cs=10 ) {
  indent= cs * (1/15);
  difference() {
    difference() {
      cube(cs, center=true);

      union() {
        for (i = [0,90,180,270]){ rotate(i) translate( [ ((cs/2) + (cs/2)/2) -indent , 0,0] ) cube(cs/2, center=true); }
        for (i = [90,270]){ rotate(i, [0,1,0]) translate( [ ((cs/2) + (cs/2)/2) -indent , 0,0] ) cube(cs/2, center=true); }
      }
    }

    union() {
      for (i = [0,90,180,270]){ rotate(i, [0,1,0]) cylinder(100, cs/4, center=true); }
      for (i = [90,270]){ rotate(i, [1,0,0]) cylinder(100, cs/4, center=true); }
    } 
  }
}

module smallBox(cs=5) {
  difference() {
    cube(cs, center=true);

    union() {

      if (_allHoles) {
        for (i = [0,90,180,270]){ rotate(i, [0,1,0]) cylinder(cs*2, cs/4,center=true); }
      }

      for (i = [90,270]){ rotate(i, [1,0,0]) cylinder(cs*2, cs/4, center=true); }
    } 
  }

}

if (_bigBox) { bigBox(cs=_cs);  }
if (_smallBox) { smallBox(cs=_cs); }
