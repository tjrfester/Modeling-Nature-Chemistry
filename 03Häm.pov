// Persistence of Vision Ray Tracer Scene Description File

#version 3.6; // current version is 3.8

/* 
Information on Pov-Ray:
 
My personal introduction into Pov-Ray was the excellent book "3D-Welten, professionelle Animationen und fotorealistische Grafiken mit Raytracing" from 
Toni Lama by Carl Hanser Verlag München Wien, 2004. Apart of that I recommend the Pov-Ray-homepage (http://www.povray.org).

Further information on Pov-Ray can be found at https://sus.ziti.uni-heidelberg.de/Lehre/WS2021_Tools/POVRAY/POVRAY_PeterFischer.pdf,  
https://wiki.povray.org/content/Main_Page, https://de.wikibooks.org/wiki/Raytracing_mit_POV-Ray or, in german language, here: https://www.f-lohmueller.de/pov_tut/pov__ger.htm
 

---------------------------------------------------Modeling approach---------------------------------------------- 

This is a model of heme. The molecule has been built by the program Avogadro and exported in xyz-format. XYZ-Data have been copied into Pov-Ray and transformed into
position data manually. Positions were occupied by spheres of appropriate size and texture. Element information is included in the xyz-data, but not the precise position of the atom. 
Therefore atoms were numbered and numbers displayed in close vicinity to respective atoms (atoms were given a small radius in this display). From watching the structure at different angles 
atoms connected to each other were identified and suitable cylinders marking these connections included in the structure. Finally numbers were eliminated from the image and spheres and cylinders fused into a
blob. 

Texture: Throughout my molecules, I am presenting carbon in a dark grey, oxygen in orange, nitrogen in blue and sulfur in yellow colour. Unsaturated bonds are displayed in bright colours and in the colours of 
respective pigments. UV-absorbing conjugated double bonds are given in white colour. 

For some unkown reason Pov-Ray seems to render asymmetric carbon atoms, and chiral structures in general, in the wrong configuration. This is not relevant in this case. Nevertheless, 
any suggestions regarding this point are welcome.  

*/ 

//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}

#declare Camera_z = camera {/*ultra_wide_angle*/ //angle 90 // right side view
    location  <0 , 1 , -25>
    rotate <0, 0, 0>
    right     x*image_width/image_height
    look_at   <0.0 , 0 , 0>
}  
                            
                            
camera{
    Camera_z
} 

light_source{
    <20,0,-100> color rgb <1, 1, 1>
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

#declare Text_Fe = texture { 
    pigment{ 
        color rgb<1, 0, 0>
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
        color rgb<0.1, 0.1, 0.1>
    }  
    finish {
        specular 0.5 
    }
}  ;

#declare Text_Aromat = texture { 
    pigment{ 
        color rgb<1, 0, 0>
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


//Radius of various atoms

#declare RadiusFaktor = 0.8; 

#declare RC = 0.76; 
#declare RN = 0.71; 
#declare RO = 0.66; 
#declare RS = 1.0; 
#declare RCl = 1.0; 
#declare RFe = 1.3; 


//Radius of various bonds

#declare BondRadius = 0.25;  
#declare WeakRadius = 0.15;  

#declare AromatRadius = 0.25;  
#declare DoubleRadius = 0.25;


//------------------------------------------Positions taken from the xyz-file-----------------------------------------


#declare P1 = <           -6.92800    ,    4.00051    ,    0.15269   >;//C
#declare P2 = <            -6.52940   ,     2.61580   ,     0.07751   >;//C
#declare P3 = <            -7.53907   ,     4.31516   ,    -0.99397   >;//C
#declare P4 = <            -8.09881   ,     5.65556   ,    -1.30823   >;//C
#declare P5 = <            -8.71608   ,     6.02843   ,    -2.42282   >;//C
#declare P6 = <            -7.51958   ,     3.09227   ,    -1.80488   >;//C
#declare P7 = <            -6.94345   ,     2.14012   ,    -1.17350   >;//N
#declare P8 = <            -8.06637   ,     2.94235   ,    -3.15131   >;//C
#declare P9 = <            -6.67645   ,     4.86858   ,     1.32659   >;//C
#declare P10 = <           -5.87934  ,      1.94546   ,     1.05368   >;//C
#declare P11 = <            -8.07310  ,      1.86597  ,     -3.88671   >;//C
#declare P12 = <            -7.55857  ,      0.67143  ,     -3.51852   >;//N
#declare P13 = <           -8.63863   ,     1.85474   ,    -5.17995   >;//C
#declare P14 = <            -8.46308  ,      0.57266  ,     -5.63671   >;//C
#declare P15 = <            -7.80200  ,     -0.11974 ,      -4.59522   >;//C
#declare P16 = <            -9.30318  ,      3.03967 ,      -5.90089   >;//C
#declare P17 = <            -8.87031  ,     -0.01422  ,     -6.96159   >;//C
#declare P18 = <            -7.46443  ,     -1.40301  ,     -4.68261   >;//C
#declare P19 = <            -9.49293  ,      0.56965  ,     -7.99564   >;//C
#declare P20 = <            -6.78451  ,     -2.16734  ,     -3.66353   >;//C
#declare P21 = <            -6.43817  ,     -3.57036  ,     -3.78124   >;//C
#declare P22 = <            -6.70877  ,     -4.46091  ,     -4.94724   >;//C
#declare P23 = <            -5.82730  ,     -3.90052  ,     -2.65097   >;//C
#declare P24 = <            -5.27897  ,     -5.22905 ,      -2.27608   >;//C
#declare P25 = <            -5.79788  ,     -2.70706 ,      -1.82528   >;//C
#declare P26 = <            -6.40708 ,      -1.69135  ,     -2.54925   >;//N
#declare P27 = <            -5.28802 ,      -2.62504  ,     -0.59041   >;//C
#declare P28 = <            -3.76823    ,   -5.18230  ,     -2.08267   >;//C
#declare P29 = <            -3.04842    ,   -5.00844  ,     -3.37925   >;//C
#declare P30 = <            -3.14406    ,   -5.86318  ,     -4.24429   >;//O
#declare P31 = <            -2.28120    ,   -3.92203  ,     -3.59173   >;//O
#declare P32 = <            -5.20675    ,   -1.45917  ,      0.29554   >;//C
#declare P33 = <           -5.46814    ,    0.54929  ,      1.02520   >;//C
#declare P34 = <            -5.70192   ,    -0.26350   ,    -0.01216   >;//N
#declare P35 = <            -4.79539  ,     -0.13862   ,     2.02785   >;//C
#declare P36 = <            -4.62613  ,     -1.41928   ,     1.55363   >;//C
#declare P37 = <            -4.32607  ,      0.36249   ,     3.35594   >;//C
#declare P38 = <            -3.94760  ,     -2.53640   ,     2.26428   >;//C
#declare P39 = <            -2.71118  ,     -2.97691   ,     1.49662   >;//C
#declare P40 = <           -2.06126  ,     -4.13664    ,    2.17190   >;//C
#declare P41 = <            -1.56552 ,      -4.00249   ,     3.41606   >;//O
#declare P42 = <            -1.97150 ,      -5.20783   ,     1.59379   >;//O
#declare P43 = <           -6.61023   ,     0.17362    ,   -1.74007   >;//Fe



//---------------------------------------The final blob - first with sphere representing atoms-------------------------------------------------

union {


    blob {

        threshold 0.6      

        sphere { 
            <0,0,0>, RC*RadiusFaktor, 1 
            texture { 
                Text_C
            }   
            translate P1
        }
        sphere { 
            <0,0,0>, RC*RadiusFaktor, 1 
            texture { 
                Text_C
            }   
            translate P2
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P3
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
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P6
        }
        sphere { 
            <0,0,0>, RN*RadiusFaktor, 1 
            texture { 
                Text_N
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
        sphere { 
            <0,0,0>, RC*RadiusFaktor, 1 
            texture { 
                Text_C
            }  
            translate P10
        }
        sphere{
            <0,0,0>,RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P11
        }
        sphere { 
            <0,0,0>, RN*RadiusFaktor, 1 
            texture { 
                Text_N
            }   
            translate P12
        }
        sphere{
            <0,0,0>,RC*RadiusFaktor, 1 
            texture{
                Text_C
            } 
            translate P13
        }
        sphere{
            <0,0,0>,RC*RadiusFaktor, 1 
            texture{
                Text_C
            } 
            translate P14
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
        sphere { 
            <0,0,0>, RC*RadiusFaktor, 1 
            texture { 
                Text_C
            }   
            translate P17
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P18
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P19
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P20
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P21
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P22
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P23
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P24
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P25
        }
        sphere{
            <0,0,0>, RN*RadiusFaktor, 1 
            texture{
                Text_N
            }  
            translate P26
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P27
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P28
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P29
        }
        sphere{
            <0,0,0>, RO*RadiusFaktor, 1 
            texture{    
                Text_O
            }  
            translate P30
        }
        sphere{
            <0,0,0>, RO*RadiusFaktor, 1 
            texture{
                Text_O
            }  
            translate P31
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P32
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P33
        }
        sphere{
            <0,0,0>, RN*RadiusFaktor, 1 
            texture{
                Text_N
            }  
            translate P34
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P35
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P36
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P37
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P38
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture
                {Text_C
            }  
            translate P39
        }
        sphere{
            <0,0,0>, RC*RadiusFaktor, 1 
            texture{
                Text_C
            }  
            translate P40
        }
        sphere{
            <0,0,0>, RO*RadiusFaktor, 1 
            texture{
                Text_O
            }  
            translate P41
        }
        sphere{
            <0,0,0>, RO*RadiusFaktor, 1 
            texture{
                Text_O
            }  
            translate P42
        }
        sphere{
            <0,0,0>, RFe*RadiusFaktor, 1 
            texture{
                Text_Fe
            }  
            translate P43
        }

//-------------------------------------------------... and now cylinders representing the bonds between individual atoms----------------------------

        cylinder { 
            P1, P2, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P1, P3, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P3, P4, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P4, P5, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P3, P6, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P2, P7, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P7, P6, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------

        cylinder { 
            P10, P2, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P10, P33, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P33, P34, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P33, P35, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P35, P36, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P34, P32, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P36, P32, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------

        cylinder { 
            P6, P8, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder {  
            P8, P11, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P11, P12, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P11, P13, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P13, P14, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P15, P12, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder {  
            P14, P15, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder {  
            P14, P17, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P17, P19, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------


        cylinder { 
            P15, P18, AromatRadius, 1 
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
            P20, P21, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P20, P26, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P25, P26, AromatRadius, 1 
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
            P23, P25, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P25, P27, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P27, P32, AromatRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
 
        cylinder { 
            P43,  P12, WeakRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder {  
            P43, P7, WeakRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P43, P26, WeakRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder {  
            P43, P34, WeakRadius, 1 
            texture { 
                Text_Aromat      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------



 
        cylinder { 
            P13, P16, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P1, P9, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P21, P22, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P35, P37, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------

 
 
        cylinder { 
            P23, P24, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P24, P28, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder {  
            P28, P29, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder {  
            P36, P38, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P38, P39, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P39, P40, BondRadius, 1 
            texture { 
                Text_Bond      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------

        cylinder { 
            P40, P41, DoubleRadius, 1 
            texture { 
                Text_Double      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder {  
            P40, P42, DoubleRadius, 1 
            texture { 
                Text_Double      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------


        cylinder { 
            P29, P30, DoubleRadius, 1 
            texture { 
                Text_Double      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------
        cylinder { 
            P29, P31, DoubleRadius, 1 
            texture { 
                Text_Double      
            } // end of texture
            scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        } // end of cylinder -------------------------------------

 
        //rotate <0, 22, 0>
        //translate <2.3,-0.8, -1.7>
        //rotate <0, 0, 93> 
        //rotate <0, -360 * clock, 0>

    }   

/*                                                                        These are the numbers which can be placed next to the atoms for finding out about positions of bonds.
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
    text { 
        ttf "arial.ttf", "24", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P24
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "25", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P25
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "26", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P26
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "27", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P27
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "28", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P28
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "29", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P29
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "30", 0.02, 0.0 // thickness, offset
       texture{ 
        Text_Text              
       } // end of texture
       scale 0.5
       translate P30
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "31", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P31
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "32", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P32
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "33", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P33
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "34", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P34
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "35", 0.02, 0.0 // thickness, offset
        texture{
             Text_Text              
        } // end of texture
        scale 0.5
        translate P35
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "36", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P36
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "37", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P37
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "38", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P38
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "39", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P39
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "40", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P40
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "41", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P41
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "42", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P42
    } // end of text object ---------------------------------------------
    text { 
        ttf "arial.ttf", "43", 0.02, 0.0 // thickness, offset
        texture{ 
            Text_Text              
        } // end of texture
        scale 0.5
        translate P43
    } // end of text object ---------------------------------------------

*/
    translate <8, 0, 0>

    rotate <0, 0, -40>
    rotate <0, 65, 0>
    rotate <21, 0, 0>
    translate <1, 0, 2.0>
    rotate <0, 0, 168>
    rotate <0, -360 * clock, 0>
}
 

