// Reservoir (Water Tank)
thickness_lid = 3; //thickness of lid (may play a role on gas diffusion
diam_pipe = 100; // internal diameter of PVC pipe
tol_diam = 1; // tolerance for the internal diameter (takes into account 3D printing)
diam_adapt = diam_pipe - tol_diam *2; // diameter of the adapter

height_inside = 40; // overlap between adapter and tube
thickness_inside = 3; // thickness of wall of adapter inside tube

trunk_diameter = 40; // diameter of trunk. This should be corrected to account for bark, etc.

difference(){
    union(){
        // lid of adapter
        difference(){
            translate([0, 0, thickness_lid/2]){
                color("blue")
                cylinder(h=thickness_lid, d=diam_adapt+10, center=true);
            };
            cylinder(h=thickness_lid*2.5, d=trunk_diameter, center=true,$fn=300);
        };
        // body of adapter
        translate([0, 0, -height_inside]){
            difference(){
            cylinder(h = height_inside, d=diam_adapt ,$fn=300);
            cylinder(h = height_inside+10, d=diam_adapt-thickness_inside*2);
            };
        };
    };
    // use of cube to make two halfs
    translate([1000/2,0,0]){
        cube([1000, 1000, 1000], center=true);
    };
};


