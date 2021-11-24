set_convexity = 3;//[1:1:10]
vcore_arm_back_location="Rear_arm_integrated_leadscrew_nut.stl";
vcore_arm_left_location="LF_Arm_integrated_lead_screw_nut.stl";
vcore_arm_right_location="RF_Arm_integrated_lead_screw_nut.stl";
venterMech_receptical_location="VenterMech receptacle.stl";
leadscrew_clearance_hole_radius=5.5;

$fn=125; //how many facets make up a cylinder?

module vcore_arm_back(){
    difference(){
        rotate([180,0,90])
        union(){
            adjust_arm_back();
            venterMech_receptical();
        }
        cart_negative();
    }
}

module adjust_arm_back(){
    difference(){ //subtract the internal threads from the arm
        translate([-33,-17,4])
        import(vcore_arm_back_location,convexity=set_convexity);
        arm_negative();
    }
}

module cart_negative(){
    //color("red")
    translate([-19.085,-33,-46])
    cube([2.085,29,46]);
}

module vcore_arm_left(){
    rotate([180,0,180])
    translate([0,55,0])
    union(){
        adjust_arm_left();
        translate([0,0,1])
        venterMech_receptical();
    }
}

module adjust_arm_left(){
    difference(){
        x_origin=13.5;
        y_origin=-15.5;
        translate([x_origin-50,y_origin-21,38])
        import(vcore_arm_left_location,convexity=set_convexity);
        arm_negative();
    }
}

module vcore_arm_right(){
    rotate([180,0,0])
    translate([0,70,0])
    union(){
        adjust_arm_right();
        translate([0,0,1])
        venterMech_receptical();
    }
}

module adjust_arm_right(){
    difference(){
        x_origin=-213.5;
        y_origin=-15.5;
        translate([x_origin+50,y_origin-21,38])
        import(vcore_arm_right_location,convexity=set_convexity);
        arm_negative();
    }
}

module venterMech_receptical(){
    difference(){
        translate([0,0,20])
        import(venterMech_receptical_location,convexity=set_convexity);
        threadedRodClearance();
    }
}

module threadedRodClearance(){
    cylinder(h=47,r=leadscrew_clearance_hole_radius); //cylinder where the threads used to be
}

module arm_negative(){
    threadedRodClearance();
    cylinder(h=21,r=19.5); //cylinder where the venterMech receptical goes
}

module venterMech_star_drive(){
    color("green")
    translate([0,0,20])
    import(venterMech_star_drive_location,convexity=set_convexity);
}

//INSTRUCTIONS:
//To generate - remove the // in front of one of the lines below
//then click the "Render" button or press the F6 key (this will take a while)
//then click "Export as STL" button or press the F7 key
//It is important to only do one line at a time, otherwise you will have to separate the bed arms in the generated STL
//Repeat for each line so that you have all 3 bed arms

vcore_arm_back();
//vcore_arm_left();
//vcore_arm_right();
