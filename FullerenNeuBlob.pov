
// Persistence of Vision Ray Tracer Scene Description File
// File: Silicab.pov

#version 3.6; // current version is 3.8    

#include "colors.inc"
#include "textures.inc"
#include "logo.inc" 


object{ Povray_Logo  
 
        texture{ //Polished_Chrome
                 pigment{ color rgb< 1.0, 0.65, 0.0> } //  deep yellow 
                 finish { phong 1 }
               } // end of texture 
        scale 0.8
        rotate<0,0,0>
        translate<7,-2,0>
      } //-------------------------------------------------------------  logo.inc
                          
      

/* 
Information on Pov-Ray:
 
My personal introduction into Pov-Ray was the excellent book "3D-Welten, professionelle Animationen und fotorealistische Grafiken mit Raytracing" from 
Toni Lama by Carl Hanser Verlag München Wien, 2004. Apart of that I recommend the Pov-Ray-homepage (http://www.povray.org).

Further information on Pov-Ray can be found at https://sus.ziti.uni-heidelberg.de/Lehre/WS2021_Tools/POVRAY/POVRAY_PeterFischer.pdf,  
https://wiki.povray.org/content/Main_Page, https://de.wikibooks.org/wiki/Raytracing_mit_POV-Ray or, in german language, here: https://www.f-lohmueller.de/pov_tut/pov__ger.htm
*/ 
 
 
//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}

#declare Ortho = // orthographic projection using parallel camera rays
camera {
  orthographic
  location <0,3,-12>    // position & direction of view
  look_at  <0,3,0>
  right 12.8*x            // horizontal size of view
  up 10.2*y               // vertical size of view
}



#declare Cameray = camera {
    location  <1, 15, -1> 
    look_at   <0, 0,  0>
}

#declare Cameraz = camera {
    location  <-1, 4, -12> 
    look_at   <0, 3.3,  0>
}

camera {
    Cameraz
}

background {
    color rgb <0.015,0.013,0.01>    // lights color
} 
// create a regular point light source
light_source {
    0*x                  // lights position (translated below)
    color rgb <1,1,1>    // lights color
    translate <-0, 40, -120>
} 

// create a regular point light source
light_source {
    0*x                  // lights position (translated below)
    color rgb <1,1,1>    // lights color
    translate <-10, 100, -10>
} 

//-------------------------------------------Coordinate system------------------------------------------

/*
cylinder { 
    <-15, 0, 0>, <15, 0, 0>, 0.01 
    pigment {          
        color rgb <0,0,0>    
    }
}
cylinder { 
    <0, -15, 0>, <0, 15, 0>, 0.01
    pigment {         
        color rgb <0,0,0>    
    }
}
cylinder { 
    <0, 0, -15>, <0, 0, 15>, 0.01
    pigment {          
        color rgb <0,0,0>    
    }
}

*/
// --------------------------Covalent radii (Angstrom)-----------------------

#declare CRadius = 0.76 ;  //The radius of a carbon atom; since we use a blob the full radius will not be displayed

#declare CCBond = 1.42;    //the lenght of a C-C-bond in graphene 

#declare CCBondradius = 0.76 *0.7; //the radius used here for the cylinders representing bonds. (Will be further reduced due to using a blob. 



//----------------------------------Texture of carbon atoms-------------------------------



#declare CTextur =  texture {
    pigment {          // (---surface color---)
        color rgb <0,0,0>    // lights color
    }
    finish {
        specular 0.9
    }
};


//--------------------------------------------------Central sphere--------------------------------------------------

//Spheres can either encompass the centers of hexagons, of pentagons of the corners of hexagons and pentagons. All these spheres have a different radius as detailed by Bernhard Nietrost (). 
//According to him the radius of a sphere encompassing the centers of the hexagons is 2.27 * a, the radius when encompassing the pentagons is 2.33 * a and the radius when encompassing the corners is 2.48 * a. We use 1.42 for a (length of edges). 
//Since we are placing the fullerene with a pentagon at the bottom and the origin in the center of this pentagon, the center of our fullerene is at <0,3.3086 ,0>.
//The radius of a sphere encompassing the corners of the fullerene is slightly larger (3.5216). 

sphere { <0,0,0>, 3.5216
       texture { 
            pigment { 
                color rgbt<1.00, 0.55, 0.00, 0.6>
            }
            finish { 
                phong 1.0 reflection 0.00
            }
       } // end of texture
       scale<1,1,1>  rotate<0,0,0>  translate<0,3.3086 ,0>  
}  // end of sphere ----------------------------------- 

//-----------------------------------------------------------Calculation of fullerene positions--------------------------------------------------


//For an explanation of the following calculations have a look at my youtube video

//Layer 1  - the basic pentagon; it is started at negative x- and z-values

#declare P1 = <-0.688 * CCBond, 0, -0.5 * CCBond>; 
#declare P2 = vrotate (P1, <0, 72, 0>); 
#declare P3 = vrotate (P1, <0, 2 * 72, 0>); 
#declare P4 = vrotate (P1, <0, 3 * 72, 0>); 
#declare P5 = vrotate (P1, <0, 4 * 72, 0>); 


//Layer 2 -  the hexagons adjacent to the basic pentagon

#declare P6 = <0, CCBond, 0>; 
#declare P6 = vrotate (P6, <-30, 0, 0>);
#declare P6 = vrotate (P6, <0, 0, 90-37.38>);
#declare P6 = P6 + P1;  

#declare P7 = vrotate (P6, <0, 72, 0>); 
#declare P8 = vrotate (P6, <0, 2 * 72, 0>); 
#declare P9 = vrotate (P6, <0, 3 * 72, 0>); 
#declare P10 = vrotate (P6, <0, 4 * 72, 0>); 


//Layer 3 - the hexagons adjacent to the basic pentagon
 
#declare P11 = <0, 2.46, 0>; 
#declare P11 = vrotate (P11, <0, 0, 90-37.38>);
#declare P11 = P11 + P1; 
#declare P11 = vrotate (P11, <0, 0 * 72, 0>); 


#declare P12 = <0, 2.46, 0>; 
#declare P12 = vrotate (P12, <0, 0, 90-37.38>);
#declare P12 = P12 + P2; 
#declare P12 = vrotate (P12, <0, 0 * 72, 0>); 


#declare P13 = vrotate (P11, <0, 1 * 72, 0>); 
#declare P14 = vrotate (P12, <0, 1 * 72, 0>); 

#declare P15 = vrotate (P11, <0, 2 * 72, 0>); 
#declare P16 = vrotate (P12, <0, 2 * 72, 0>); 

#declare P17 = vrotate (P11, <0, 3 * 72, 0>); 
#declare P18 = vrotate (P12, <0, 3 * 72, 0>); 

#declare P19 = vrotate (P11, <0, 4 * 72, 0>); 
#declare P20 = vrotate (P12, <0, 4 * 72, 0>); 


//Layer 4 - the second layer of hexagons

#declare P21 =  <0, CCBond, 0>; 
#declare P21 = vrotate (P21, <-30, 0, 0>);
#declare P21 = vrotate (P21, <0, 0, 90-41.81-37.38>);
#declare P21 = P21 + P11; 

#declare P22 =  <0, CCBond, 0>; 
#declare P22 = vrotate (P22, <30, 0, 0>);
#declare P22 = vrotate (P22, <0, 0, 90-41.81-37.38>);
#declare P22 = P22 + P12; 

#declare P23 = vrotate (P21, <0, 1*72, 0>); 
#declare P24 = vrotate (P22, <0, 1*72, 0>); 

#declare P25 = vrotate (P21, <0, 2 * 72, 0>); 
#declare P26 = vrotate (P22, <0, 2 * 72, 0>); 

#declare P27 = vrotate (P21, <0, 3 * 72, 0>); 
#declare P28 = vrotate (P22, <0, 3 * 72, 0>); 

#declare P29 = vrotate (P21, <0, 4 * 72, 0>); 
#declare P30 = vrotate (P22, <0, 4 * 72, 0>); 



//Layer5 - is calculated from layer 4 by mirroring positions using the center plane and rotating the positions by 36 degrees around the y-axis.
//Center of the sphere:  <0,3.3086 ,0>

#declare YDistance = 2*(3.3086 - P21.y); 

#declare P31 = <P21.x, P21.y + YDistance, P21.z>; 
#declare P31 = vrotate (P31, <0, 36, 0>); 
#declare P32 = <P22.x, P22.y + YDistance, P22.z>; 
#declare P32 = vrotate (P32, <0, 36, 0>); 
#declare P33 = <P23.x, P23.y + YDistance, P23.z>; 
#declare P33 = vrotate (P33, <0, 36, 0>); 
#declare P34 = <P24.x, P24.y + YDistance, P24.z>; 
#declare P34 = vrotate (P34, <0, 36, 0>); 
#declare P35 = <P25.x, P25.y + YDistance, P25.z>; 
#declare P35 = vrotate (P35, <0, 36, 0>); 
#declare P36 = <P26.x, P26.y + YDistance, P26.z>; 
#declare P36 = vrotate (P36, <0, 36, 0>); 
#declare P37 = <P27.x, P27.y + YDistance, P27.z>; 
#declare P37 = vrotate (P37, <0, 36, 0>); 
#declare P38 = <P28.x, P28.y + YDistance, P28.z>; 
#declare P38 = vrotate (P38, <0, 36, 0>); 
#declare P39 = <P29.x, P29.y + YDistance, P29.z>; 
#declare P39 = vrotate (P39, <0, 36, 0>); 
#declare P40 = <P30.x, P30.y + YDistance, P30.z>; 
#declare P40 = vrotate (P40, <0, 36, 0>); 


//Layer6 - is calculated from layer 3 by mirroring positions using the center plane and rotating the positions by 36 degrees around the y-axis.
 
#declare YDistance = 2*(3.3086 - P11.y); 

#declare P41 = <P11.x, P11.y + YDistance, P11.z>; 
#declare P41 = vrotate (P41, <0, 36, 0>); 
#declare P42 = <P12.x, P12.y + YDistance, P12.z>; 
#declare P42 = vrotate (P42, <0, 36, 0>); 
#declare P43 = <P13.x, P13.y + YDistance, P13.z>; 
#declare P43 = vrotate (P43, <0, 36, 0>); 
#declare P44 = <P14.x, P14.y + YDistance, P14.z>; 
#declare P44 = vrotate (P44, <0, 36, 0>); 
#declare P45 = <P15.x, P15.y + YDistance, P15.z>; 
#declare P45 = vrotate (P45, <0, 36, 0>); 
#declare P46 = <P16.x, P16.y + YDistance, P16.z>; 
#declare P46 = vrotate (P46, <0, 36, 0>); 
#declare P47 = <P17.x, P17.y + YDistance, P17.z>; 
#declare P47 = vrotate (P47, <0, 36, 0>); 
#declare P48 = <P18.x, P18.y + YDistance, P18.z>; 
#declare P48 = vrotate (P48, <0, 36, 0>); 
#declare P49 = <P19.x, P19.y + YDistance, P19.z>; 
#declare P49 = vrotate (P49, <0, 36, 0>); 
#declare P50 = <P20.x, P20.y + YDistance, P20.z>; 
#declare P50 = vrotate (P50, <0, 36, 0>); 

//Layer7 - is calculated from layer 2 by mirroring positions using the center plane and rotating the positions by 36 degrees around the y-axis.

#declare YDistance = 2*(3.3086 - P6.y); 

#declare P51 = <P6.x, P6.y + YDistance, P6.z>; 
#declare P51 = vrotate (P51, <0, 36, 0>); 
#declare P52 = <P7.x, P7.y + YDistance, P7.z>; 
#declare P52 = vrotate (P52, <0, 36, 0>); 
#declare P53 = <P8.x, P8.y + YDistance, P8.z>; 
#declare P53 = vrotate (P53, <0, 36, 0>); 
#declare P54 = <P9.x, P9.y + YDistance, P9.z>; 
#declare P54 = vrotate (P54, <0, 36, 0>); 
#declare P55 = <P10.x, P10.y + YDistance, P10.z>; 
#declare P55 = vrotate (P55, <0, 36, 0>); 


//Layer8 - is calculated from layer 1 by mirroring positions using the center plane and rotating the positions by 36 degrees around the y-axis.

#declare YDistance = 2*(3.3086 - P1.y); 

#declare P56 = <P1.x, P1.y + YDistance, P1.z>; 
#declare P56 = vrotate (P56, <0, 36, 0>); 
#declare P57 = <P2.x, P2.y + YDistance, P2.z>; 
#declare P57 = vrotate (P57, <0, 36, 0>); 
#declare P58 = <P3.x, P3.y + YDistance, P3.z>; 
#declare P58 = vrotate (P58, <0, 36, 0>); 
#declare P59 = <P4.x, P4.y + YDistance, P4.z>; 
#declare P59 = vrotate (P59, <0, 36, 0>); 
#declare P60 = <P5.x, P5.y + YDistance, P5.z>; 
#declare P60 = vrotate (P60, <0, 36, 0>); 


//-------------------------------------------------------------Defining a blob showing the fullerene-----------------------------------------------------




blob {
    threshold 0.6

//Atoms

sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P1
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P2
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P3
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P4
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P5
}  // end of sphere -----------------------------------   



sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P6
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P7
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P8
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P9
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P10
}  // end of sphere -----------------------------------   






sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P11
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P12
}  // end of sphere -----------------------------------   


sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P13
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1 
       texture { CTextur
       } // end of texture
       translate P14
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P15
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P16
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P17
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P18
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P19
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P20
}  // end of sphere -----------------------------------   



sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P21
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P22
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P23
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P24
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P25
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P26
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P27
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P28
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P29
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P30
}  // end of sphere -----------------------------------   





sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P31
}  // end of sphere -----------------------------------   

sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P32
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P33
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P34
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P35
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P36
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P37
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P38
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P39
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P40
}  // end of sphere -----------------------------------   

sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P51
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P52
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P53
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P54
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P55
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P56
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1

       texture { CTextur
       } // end of texture
       translate P57
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P58
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P59
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P60
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P41
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P42
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P43
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P44
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P45
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P46
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P47
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P48
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P49
}  // end of sphere -----------------------------------   
sphere { <0,0,0>, CRadius, 1
       texture { CTextur
       } // end of texture
       translate P50
}  // end of sphere -----------------------------------   
   



//CC-bonds   
   
cylinder { P1,P2, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P2,P3, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P3,P4, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P4,P5, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P5,P1, CCBondradius, 1
    texture { 
        CTextur
    }
}

cylinder { P1,P6, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P2,P7, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P3,P8, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P4,P9, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P5,P10, CCBondradius, 1
    texture { 
        CTextur
    }
} 

cylinder { P6,P11, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P7,P12, CCBondradius, 1
    texture { 
        CTextur
    }
} 


cylinder { P7,P13, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P8,P14, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P8,P15, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P9,P16, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P9,P17, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P10,P18, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P10,P19, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P6,P20, CCBondradius, 1
    texture { 
        CTextur
    }
} 


cylinder { P11,P12, CCBondradius, 1
    texture { 
        CTextur
    }
} 
cylinder { P13,P14, CCBondradius, 1
    texture { 
        CTextur
    }
}

cylinder { P15,P16, CCBondradius, 1
    texture { 
        CTextur
    }
}

cylinder { P17,P18, CCBondradius, 1
    texture { 
        CTextur
    }
}

cylinder { P19,P20, CCBondradius, 1
    texture { 
        CTextur
    }
}




cylinder { P11,P21, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P12,P22, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P13,P23, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P14,P24, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P15,P25, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P16,P26, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P17,P27, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P18,P28, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P19,P29, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P20,P30, CCBondradius, 1
    texture { 
        CTextur
    }
}



cylinder { P21,P40, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P22,P31, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P23,P32, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P24,P33, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P25,P34, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P26,P35, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P27,P36, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P28,P37, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P29,P38 CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P30,P39, CCBondradius, 1
    texture { 
        CTextur
    }
} 


cylinder { P22,P23, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P24,P25, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P26,P27, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P28,P29, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P30,P21, CCBondradius, 1
    texture { 
        CTextur
    }
}


cylinder { P32,P33, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P34,P35, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P36,P37, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P38,P39, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P40,P31, CCBondradius, 1
    texture { 
        CTextur
    }
}


cylinder { P31,P41, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P32,P42, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P33,P43, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P34,P44, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P35,P45, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P36,P46, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P37,P47, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P38,P48, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P39,P49, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P40,P50, CCBondradius, 1
    texture { 
        CTextur
    }
}


cylinder { P41,P42, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P43,P44, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P45,P46, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P47,P48, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P49,P50, CCBondradius, 1
    texture { 
        CTextur
    }
}


cylinder { P51,P50, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P51,P41, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P52,P42, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P52,P43, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P53,P44, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P53,P45, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P54,P46, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P54,P47, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P55,P48, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P55,P49, CCBondradius, 1
    texture { 
        CTextur
    }
} 


cylinder { P51,P56, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P52,P57, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P53,P58, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P54,P59, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P55,P60, CCBondradius, 1
    texture { 
        CTextur
    }
}


cylinder { P56,P57, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P57,P58, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P58,P59, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P59,P60, CCBondradius, 1
    texture { 
        CTextur
    }
}
cylinder { P60,P56, CCBondradius, 1
    texture { 
        CTextur
    }
} 

}




