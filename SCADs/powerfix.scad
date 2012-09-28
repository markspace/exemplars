
use <MCAD/polyholes.scad>
E=0.01;

hpx=97.6;
hpy=150.2;

hp1x=7.2;
hp1y=hpy-23;
hp2x=4.2;
hp2y=9.6;
hp3x=hpx-5.4;
hp3y=hpy-23;
hp4x=hpx-5.6;
hp4y=9.6;


novx=86.3;
novy=150.2;

nov1x=hpx-novx + 15.8;
nov1y=novy-6.4;
nov2x=hpx-novx + 6.2;
nov2y=30.1;
nov3x=hpx-6.2;
nov3y=hpy-6.4;
nov4x=hpx-6.2;
nov4y=6.1;

depth=6;
width=12;



difference () {
// hp power size
cube(size=[hpx,hpy,depth]);


// cutout nova powersize - width
translate(v=[hpx-novx,0,-1])
    difference() {
        // nova power size
        cube(size=[novx, novy, depth + 2]);
        // add width all round
        cube(size=[width,hpy,depth + 2]);
        cube(size=[hpx,width,depth + 2]);
        translate(v=[0,novy-width,0])
            cube(size=[hpx,width,depth + 2]);
        translate(v=[novx-width,hp3y-width,0])
            cube(size=[width,novy - hp3y + width,depth + 2]);
    }

    // HP Holes
    translate(v=[hp1x,hp1y,-1])
        polyhole(h=depth+2, d=3);
    translate(v=[hp2x,hp2y,-1])
        polyhole(h=depth+2, d=3);
    translate(v=[hp3x,hp3y,-1])
        polyhole(h=depth+2, d=3);
// Too close to nov4
//    translate(v=[hp4x,hp4y,-1])
//        polyhole(h=depth+2, d=3);

    // Nova Holes
    translate(v=[nov1x,nov1y,-1])
        polyhole(h=depth+2, d=3.8);
    translate(v=[nov2x,nov2y,-1])
        polyhole(h=depth+2, d=3.8);
    translate(v=[nov3x,nov3y,-1])
        polyhole(h=depth+2, d=3.8);
    translate(v=[nov4x,nov4y,-1])
        polyhole(h=depth+2, d=3.8);

    // Sink Heads Nova Holes
    translate(v=[nov1x,nov1y,depth-3])
        polyhole(h=4, d=7);
    translate(v=[nov2x,nov2y,depth-3])
        polyhole(h=4, d=7);
    translate(v=[nov3x,nov3y,depth-3])
        polyhole(h=4, d=7);
    translate(v=[nov4x,nov4y,depth-3])
        polyhole(h=4, d=7);
}
