/* [Basic] */
// Reed Name (short text string)
txt_1="Chariklo";
txt_2="v1";
strength="2";
// Brim
isBrim=false;
// Reed Overall Length (mm)
length=80;
// Reed Cylinder Radius (mm)
reed_cyl_rad=16;
// Reed Butt Thickness (mm)
butt_thickness=3.8;
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

/* [Hidden] */
$fs=0.4;
$fa=0.5;
vamp_rise=[reed_vamp_rise0,reed_vamp_rise1,reed_vamp_rise2,reed_vamp_rise3,reed_vamp_rise4,reed_vamp_rise5,reed_vamp_rise6,reed_vamp_rise7,reed_vamp_rise8];
vamp_radius=[reed_vamp_radius0,reed_vamp_radius1,reed_vamp_radius2,reed_vamp_radius3,reed_vamp_radius4,reed_vamp_radius5,reed_vamp_radius6,reed_vamp_radius7,reed_vamp_radius8];
eps=0.03;

module curv_cylinder(side_length)
{
	scale([1,(width-butt_width)*0.5/(side_length+eps),1]) cylinder(r=side_length+eps,h=butt_thickness+2*(1+eps));
}

module side_shape()
{
	side_length=length*(100-butt_const)*0.01-tip_round+0.2;
	difference()
	{
		translate([-0.1,0,-1]) cube([side_length+2*eps,reed_cyl_rad,butt_thickness+2]);
		if (side_curv != 2)
		{
			translate([-eps,-(width-butt_width)*0.5-eps,-2]) rotate([0,0,atan2((width-butt_width)*0.5,side_length)]) cube([length+2,(width-butt_width)*0.5+eps,butt_thickness+4]);
		}
		else
		{
			translate([side_length,0,-1-eps]) curv_cylinder(side_length);
		}
	}
	difference()
	{
		rotate([0,0,atan2((width-butt_width)*0.5,side_length)]) translate([-eps,0,-1]) cube([side_length+eps,(butt_width-width),butt_thickness+2]);
		if (side_curv == 2 && width < butt_width)
		{
			translate([0,(width-butt_width)*0.5,-1-eps]) curv_cylinder(side_length);
		}
	}
	if (side_curv == 1)
	{
		if (width > butt_width)
		{
			translate([0,(width-butt_width)*0.5,0]) difference()
			{
				translate([0,0,-1]) curv_cylinder(side_length);
				translate([-side_length-2*eps,-1-(width-butt_width)*0.5,-1-eps]) cube([side_length+eps,abs(width-butt_width)+2,butt_thickness+2*(1+eps)]);
			}
		}
		else
		{
			translate([side_length-eps,0,-1]) curv_cylinder(side_length);
		}
	}
}

module reed_base()
{
	color([0.8314,0.686,0.215]) difference(){
		const_length=length*butt_const*0.01;
		union(){
			translate([-0.1,0,butt_thickness-reed_cyl_rad]) rotate([0,90,0])
			  cylinder(r=reed_cyl_rad,h=length-tip_round+0.1);
			if (tip_round > 0){
	 			translate([length-tip_round,0,-0.01]) scale([2 * tip_round / width,1,1])
					cylinder(d=width,h=butt_thickness);
			}
		}
		translate([-1,-reed_cyl_rad-1,-reed_cyl_rad*2])
			cube([length+2,reed_cyl_rad*2+2,reed_cyl_rad*2]);
		if (butt_const > 0.1){
			translate([-1,butt_width*0.5,-1]) cube([const_length+1,reed_cyl_rad,butt_thickness+2]);
			translate([-1,-butt_width*0.5-reed_cyl_rad,-1]) cube([const_length+1,reed_cyl_rad,butt_thickness+2]);
		}
		translate([const_length,butt_width*0.5,-1]) side_shape();
		translate([const_length,-butt_width*0.5,-1+butt_thickness]) rotate([180,0,0]) side_shape();
        // Blank rounding.
        rounding_rad = butt_width/4;
        translate([0,-(butt_width+0.2)*0.5,-0.1])
          linear_extrude(butt_thickness+0.2)
            difference(){
                translate([-rounding_rad,-0.35,0])square([rounding_rad*2+0.1, butt_width+1]);
                offset(butt_width/4) offset(-butt_width/4)
                  square([rounding_rad*2+0.1, butt_width+0.2]);
            }
    }
}

module cone_section(rad1,shift1,rad2,shift2,h)
{
	if (abs(rad2-rad1) >= 0.1)
	{
		shift_corr=-rad1+rad1*(shift2-shift1)/(rad2-rad1);
		translate([-rad1+shift1-shift_corr,0,0]) linear_extrude(height=h,convexity=10,scale=rad2/rad1)
			translate([shift_corr,0]) circle(r=rad1);
	}
	else
	{
		hull()
		{
			translate([-rad1+shift1,0,0]) cylinder(r=rad1,h=0.01);
			translate([-rad2+shift2,0,h-0.01]) cylinder(r=rad2,h=0.01);
		}
	}
}

module title(){
    text_size=5;
    color([0,0.2,1]) difference(){
	  translate([1.2,0,butt_thickness/2]) 
        linear_extrude(butt_thickness)
          rotate([0,0,180])
            union(){
              translate([-18.5, 1])
                text(text=txt_1,center = true, size=text_size, valign="bottom",halign="center");
              translate([-18.5, -1])
                text(text=txt_2,center = true, size=text_size, valign="top",halign="center");
              rotate([0,0,90])
                text(text=strength,center = true, size=text_size-1, halign="center");
            }
      translate([-0.1,0,butt_thickness-reed_cyl_rad-0.3]) rotate([0,90,0])
			  cylinder(r=reed_cyl_rad,h=length-tip_round+0.1);
    }
}

module brim(){
    brim_width=8;
    color([0,0.8,0.2])
    translate([-(butt_width+brim_width*2)*0.3,-(butt_width+brim_width*2)/2,0])
      linear_extrude(0.12)
        offset(brim_width)offset(-brim_width)
          square([butt_width+brim_width*2,butt_width+brim_width*2]);
}

module reed(){
    union(){
        intersection(){
            z_interval=butt_thickness-tip_thickness;
            reed_base();
            for_end=len(vamp_rise)-2;
            color([1.0,0.843,0]) union(){
                for(i=[0:1:for_end]){
                    translate([length-0.01*i*length*reed_vamp_cov/(for_end+1),0,tip_thickness]) 
                      rotate([0,-90,0]) 
                        cone_section(vamp_radius[i],vamp_rise[i]*(z_interval*0.01),vamp_radius[i+1],vamp_rise[i+1]*(z_interval*0.01),0.01*length*reed_vamp_cov/(for_end+1));
                }
                translate([length*(100-reed_vamp_cov)*0.01,0,tip_thickness]) 
                  rotate([0,-90,0])
                    cone_section(vamp_radius[for_end+1],vamp_rise[for_end+1]*(z_interval*0.01),vamp_radius[for_end+1]+reed_cyl_rad,butt_thickness*3,length*(100-reed_vamp_cov)*0.01);
            }
        }
        if (isBrim) brim();
    }
}

module reed_with_text()
{
	difference(){
		reed();
		title();
	}
}

reed_with_text();

