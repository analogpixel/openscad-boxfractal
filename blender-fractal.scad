bs=1000;

module frac_cube(x=0,y=0,z=0, bs=10, cs=2) {
  translate([x,y,z]) cube( bs, center=true);

  if (cs != 0) {
    b2=bs/2;
    union() {
    frac_cube(x,y+b2,z,b2,cs-1);
    frac_cube(x+b2,y,z,b2,cs-1);
    frac_cube(x,y,z+b2,b2,cs-1);

    frac_cube(x,y-b2,z,b2,cs-1);
    frac_cube(x-b2,y,z,b2,cs-1);
    frac_cube(x,y,z-b2,b2,cs-1);
    }
  }

}


union() { frac_cube(0,0,0,bs, 6); }
// mirror
