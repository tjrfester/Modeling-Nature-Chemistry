// Persistence of Vision Ray Tracer Scene Description File

#version 3.6; // current version is 3.8

/* 
Information on Pov-Ray:
 
My personal introduction into Pov-Ray was the excellent book "3D-Welten, professionelle Animationen und fotorealistische Grafiken mit Raytracing" from 
Toni Lama by Carl Hanser Verlag München Wien, 2004. Apart of that I recommend the Pov-Ray-homepage (http://www.povray.org).

Further information on Pov-Ray can be found at https://sus.ziti.uni-heidelberg.de/Lehre/WS2021_Tools/POVRAY/POVRAY_PeterFischer.pdf,  
https://wiki.povray.org/content/Main_Page, https://de.wikibooks.org/wiki/Raytracing_mit_POV-Ray or, in german language, here: https://www.f-lohmueller.de/pov_tut/pov__ger.htm
 

---------------------------------------------------Modeling approach---------------------------------------------- 

This is a model of benzylpenicillin (Penicillin G). The molecule has been built by the program Avogadro and exported in xyz-format. XYZ-Data have been copied into Pov-Ray and transformed into
position data manually. Positions were occupied by spheres of appropriate size and texture. Element information is includedin the xyz-data, but not the precise position of the atom. 
Therefore atoms were numbered and numbers displayed in close vicinity to respective atoms (atoms were given a small radius in this display). From watching the structure at different angles 
atoms connected to each other were identified and suitable cylinders marking these connections included in the structure. Finally numbers were eliminated from the image and spheres and cylinders fused into a
blob. 

Texture: Throughout my molecules, I am presenting carbon in a dark grey, oxygen in orange, nitrogen in blue and sulfur in yellow colour. Unsaturated bonds are displayed in bright colours and in the colours of 
respective pigments. UV-absorbing conjugated double bonds are given in white colour. 

For some unkown reason Pov-Ray seems to render asymmetric carbon atoms, and chiral structures in general, in the wrong configuration. This also applies to the structure of the molecule 
presented here, which may have a wrong configuration. Any suggestions on this point are welcome.  

*/ 

//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}


#declare Camera_z = camera {/*ultra_wide_angle*/ //angle 90 // right side view
    location  <0 , 1 , -14>
    rotate <0, 0, 0>
    right     x*image_width/image_height
    look_at   <0.0 , 0 , 0>
}

camera{
    Camera_z
}

light_source{
    <20,0,-100> color rgb <1,1,1>
}


background { 
    color rgb<0.0, 0., 0.015> 
}

//-------------------------------------------------various textures__________________________________________________________________

#declare Text_Cb =         texture { 
    pigment{ 
        color rgb<0.05, 0.15, 1>
    }
    finish { 
        ambient 1.2     
        diffuse 1.1          // amount [0.6]
        brilliance 1.0       // tightness of diffuse illumination [1.0]
        specular 0.6 
    }
} ; 


#declare Text_C = texture { 
    pigment{ 
        color rgb<0.1, 0.1, 0.1>
    }
    finish { 
        specular 0.7
    }
} ; 


#declare Text_N = texture {
    pigment{ 
        color rgb <0,208/255,1>
    }   
    finish {
        specular 0.7 
    }
}  ;

#declare Text_O = texture { 
    pigment{ 
        color rgb <1,102/255,0>
    }  
    finish { 
        specular 0.7 
    }
}  ;

#declare Text_S = texture { 
    pigment{ 
        color rgb<1, 1, 0>
    }  
    finish {
        specular 0.7 
    }
}  ;

#declare Text_Text = texture { 
    pigment{ 
        color rgb<1, 1, 0>
    }  
    finish {
        specular 0.7 
    }
}  ;

#declare Text_Bond = texture { 
    pigment{ 
        color rgb<0.3, 0.3, 0.3>
    }  
    finish {
        specular 0.5 
    }
}  ;

#declare Text_Aromat = texture { 
    pigment{ 
        color rgb<1, 1, 1>
    }  
    finish {
        //specular 0.7
        ambient 1.8 
    }
}  ;

#declare Text_Double = texture { 
    pigment{ 
        color rgb<1, 1, 1>
    }  
    finish {
        //specular 0.7
        ambient 1.0 
    }
}  ;

//------------------------------------------Positions taken from the xyz-file

#declare P1 = <     -4.30975,        0.27028   ,    -0.13424   > ;
#declare P2 = <     -3.09332,       -0.61298   ,    -0.34108    > ;
#declare P3 = <      -4.17267 ,       1.74580  ,     -1.27762   > ;
#declare P4 = <     -4.32575 ,       0.79548   ,     1.27777    > ;
#declare P5 = <      -5.58133,       -0.50392  ,     -0.42241   > ;
#declare P6 = <      -4.30209 ,       2.18481  ,      1.25944   > ;
#declare P7 = <     -4.29423  ,     -0.00717   ,     2.51596    > ;
#declare P8 = <      -4.29788 ,       2.88954  ,      0.10172   > ;
#declare P9 = <    -3.48144   ,     3.08398    ,    1.78695      > ;
#declare P10 = <     -3.38284 ,       4.01907  ,      0.57765    > ;
#declare P11 = <       -4.28118  ,     -1.22604 ,       2.46061  > ;
#declare P12 = <      -4.29382  ,      0.60183  ,      3.71664   > ;
#declare P13 = <       -2.70188 ,       2.90515 ,       2.71034   > ;
#declare P14 = <      -2.09276 ,       3.90257  ,     -0.05910    > ;
#declare P15 = <      -1.12877 ,       4.84480  ,      0.06578    > ;
#declare P16 = <      -1.34793 ,       6.08381  ,      0.88868    > ;
#declare P17 = <      -0.06082 ,       4.68443 ,      -0.50279    > ;
#declare P18 = <     -0.41083  ,      6.14275  ,      2.05067     > ;
#declare P19 = <     -0.46336  ,      5.17113  ,      3.05898     > ;
#declare P20 = <       0.51560 ,       7.18695 ,       2.14061    > ;
#declare P21 = <       0.41167 ,       5.24015 ,       4.14681    > ;
#declare P22 = <       1.39091 ,       7.25604 ,       3.22914    > ;
#declare P23 = <       1.33936 ,       6.28250 ,       4.23156    > ;



/*

//Number of atoms for defining connecting cylinders. Upon display atomic spheres have to be reduced in radius. 

text { 
    ttf "arial.ttf", "1", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P1
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "2", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P2
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "3", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P3
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "4", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P4
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "5", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P5
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "6", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P6
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "7", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P7
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "8", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P8
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "9", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P9
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "10", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P10
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "11", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P11
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "12", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P12
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "13", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P13
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "14", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P14
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "15", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P15
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "16", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P16
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "17", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P17
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "18", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P18
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "19", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P19
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "20", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P20
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "21", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P21
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "22", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P22
} // end of text object ---------------------------------------------
text { 
    ttf "arial.ttf", "23", 0.02, 0.0 // thickness, offset
    texture{ 
        Text_Text              
    } // end of texture
        scale 0.5
        translate P23
} // end of text object ---------------------------------------------

*/

//Radius of various atoms

#declare RadiusFaktor = 0.7; 

#declare RC = 0.76; 
#declare RN = 0.71; 
#declare RO = 0.66; 
#declare RS = 1.0; 

//Radius of various bonds

#declare BondRadius = 0.2;  

#declare AromatRadius = 0.3;  
#declare DoubleRadius = 0.25;  


blob {                                //The blob; first with spheres at the poitions of atoms
                                        //and then with cylinders indicating the places of bonds  

    threshold 0.6      

    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   translate P1
    }
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }       
    translate P2
}
sphere{
    <0,0,0>, RS*RadiusFaktor, 1 
    texture{
        Text_S
    }  
    translate P3
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }  
    translate P10
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }  
    translate P4
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }  
    translate P5
}
sphere{
    <0,0,0>, RN*RadiusFaktor, 1 
    texture{
        Text_N
    }  
    translate P6
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }   
    translate P20
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }   
    translate P7
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }   
    translate P8
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }   
    translate P9
}
sphere{
    <0,0,0>,RO*RadiusFaktor, 1 
    texture {
        Text_O
    }  
    translate P11
}
sphere{
    <0,0,0>,RO*RadiusFaktor, 1 
    texture{
        Text_O
    }  
    translate P12
}
sphere{
    <0,0,0>,RO*RadiusFaktor, 1 
    texture{
        Text_O
    } 
    translate P13
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }   
    translate P18
}
sphere {
     <0,0,0>, RC*RadiusFaktor, 1 
     texture { 
        Text_C
     }   
     translate P22
}
sphere{
    <0,0,0>,RN*RadiusFaktor, 1 
    texture{
        Text_N
    } 
    translate P14
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture {   
        Text_C
    }   
    translate P19
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }   
    translate P15
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }   
    translate P16
}
sphere{
    <0,0,0>, RO*RadiusFaktor, 1 
    texture{
        Text_O
    }  
    translate P17
}
sphere {
     <0,0,0>, RC*RadiusFaktor, 1 
     texture { 
        Text_C
     }   
     translate P21
}
sphere { 
    <0,0,0>, RC*RadiusFaktor, 1 
    texture { 
        Text_C
    }   
    translate P23
}



//Bonds represented by cylinders

cylinder { 
    P18, P19, AromatRadius, 1 
    texture { 
        Text_Aromat      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P18, P20, AromatRadius, 1 
    texture { 
        Text_Aromat      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P22, P20, AromatRadius, 1 
    texture { 
        Text_Aromat      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P22, P23, AromatRadius, 1 
    texture { 
        Text_Aromat      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P21, P23, AromatRadius, 1 
    texture { 
        Text_Aromat      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P21, P19, AromatRadius, 1 
    texture { 
        Text_Aromat      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------


//Verbindung des Aromaten

cylinder { 
    P18, P16, BondRadius, 1 
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P16, P15, BondRadius, 1 
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

 cylinder { 
    P15, P17, DoubleRadius, 1 
    texture { 
        Text_Double      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

 cylinder { 
    P15, P14, DoubleRadius, 1 
    texture { 
        Text_Double      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P14, P10, BondRadius, 1 
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------


//Der 4-Ring

cylinder { 
    P10, P8, BondRadius, 1 
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P8, P6, BondRadius, 1 
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P6, P9, DoubleRadius, 1 
    texture { 
        Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P9, P10, BondRadius, 1 
    texture { 
        Text_Bond       
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P9, P13, DoubleRadius, 1 
    texture { 
        Text_Double      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

// Der 5-Ring

cylinder { 
    P8, P3, BondRadius , 1
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P3, P1, BondRadius , 1
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P1, P4, BondRadius , 1
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P4, P6, BondRadius , 1
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

// Reste am 5-Ring

cylinder { 
    P1, P5, BondRadius , 1
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P1, P2, BondRadius, 1 
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P4, P7, BondRadius , 1
    texture { 
        Text_Bond      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P7, P11, DoubleRadius, 1 
    texture { 
        Text_Double      
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

cylinder { 
    P7, P12, DoubleRadius , 1
    texture { 
        Text_Double   
   } // end of texture
   scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

rotate <0, 0, 40>
rotate <-10, 0, 0>
translate <4, -1.5, -1> 
rotate <0, 90, 0>
//rotate <0, -360 * clock, 0>
}



