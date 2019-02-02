include <Chariklo_v1.scad>;

/* [Basic] */
// Reed weight
strength="2½";
// Reed Overall Length (mm)
length=80;
// Reed Cylinder Radius (mm)
reed_cyl_rad=16;
// Reed Butt Thickness (mm)
butt_thickness=3.9;
// Reed Butt Width (in mm)
butt_width=15;
// Reed Butt Width Stability (percent)
butt_const=0; // [0:66]
// Reed Side Curvature (Flat,Negative,Positive)
side_curv=0; // [0:Flat,1:Negative,2:Positive]
// Reed Tip Width (mm)
width=17;
// Reed Tip Round (mm)
tip_round=3.5;
// Reed Tip Initial Thickness (mm)
tip_thickness=0.22;
// Reed Vamp Coverage (percent)
reed_vamp_cov=50; // [33:66]
/* [Vamp Element 0] */
// Reed Vamp Crosscut Rise Element 0 (percent)
reed_vamp_rise0=0; // [100]
// Reed Vamp Crosscut Curvature Element 0 (mm)
reed_vamp_radius0=240;
/* [Vamp Element 1] */
// Reed Vamp Crosscut Rise Element 1 (percent)
reed_vamp_rise1=6; // [100]
// Reed Vamp Crosscut Curvature Element 1 (mm)
reed_vamp_radius1=140;
/* [Vamp Element 2] */
// Reed Vamp Crosscut Rise Element 2 (percent)
reed_vamp_rise2=15; // [100]
// Reed Vamp Crosscut Curvature Element 2 (mm)
reed_vamp_radius2=80;
/* [Vamp Element 3] */
// Reed Vamp Crosscut Rise Element 3 (percent)
reed_vamp_rise3=24; // [100]
// Reed Vamp Crosscut Curvature Element 3 (mm)
reed_vamp_radius3=55;
/* [Vamp Element 4] */
// Reed Vamp Crosscut Rise Element 4 (percent)
reed_vamp_rise4=35; // [100]
// Reed Vamp Crosscut Curvature Element 4 (mm)
reed_vamp_radius4=40;
/* [Vamp Element 5] */
// Reed Vamp Crosscut Rise Element 5 (percent)
reed_vamp_rise5=48; // [100]
// Reed Vamp Crosscut Curvature Element 5 (mm)
reed_vamp_radius5=32;
/* [Vamp Element 6] */
// Reed Vamp Crosscut Rise Element 6 (percent)
reed_vamp_rise6=63; // [100]
// Reed Vamp Crosscut Curvature Element 6 (mm)
reed_vamp_radius6=27;
/* [Vamp Element 7] */
// Reed Vamp Crosscut Rise Element 7 (percent)
reed_vamp_rise7=80; // [100]
// Reed Vamp Crosscut Curvature Element 7 (mm)
reed_vamp_radius7=23;
/* [Vamp Element 8] */
// Reed Vamp Crosscut Rise Element 8 (percent)
reed_vamp_rise8=99; // [100]
// Reed Vamp Crosscut Curvature Element 8 (mm)
reed_vamp_radius8=20;


reed_with_text();