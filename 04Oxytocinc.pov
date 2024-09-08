// Persistence of Vision Ray Tracer Scene Description File

#version 3.6; // current version is 3.8

/* 
Information on Pov-Ray:
 
My personal introduction into Pov-Ray was the excellent book "3D-Welten, professionelle Animationen und fotorealistische Grafiken mit Raytracing" from 
Toni Lama by Carl Hanser Verlag München Wien, 2004. Apart of that I recommend the Pov-Ray-homepage (http://www.povray.org).

Further information on Pov-Ray can be found at https://sus.ziti.uni-heidelberg.de/Lehre/WS2021_Tools/POVRAY/POVRAY_PeterFischer.pdf,  
https://wiki.povray.org/content/Main_Page, https://de.wikibooks.org/wiki/Raytracing_mit_POV-Ray or, in german language, here: https://www.f-lohmueller.de/pov_tut/pov__ger.htm
 

---------------------------------------------------Modeling approach---------------------------------------------- 

This is a model of oxytocin. Structure of the molecule has been obtained from the RCSB Protein Data Bank (see 2mgo.pdb in this repository). Positions of atoms have been extracted manually from this file
and transformed into Pov-Ray positions. Positions were occupied by spheres of appropriate size and texture. Element information is included in the data, but not the connection of atoms by bonds. 
(In case anyone knows how to extract such information from pdb-files, please tell! It was possible, however to extract connections of main chain atoms.) 
Therefore atoms were numbered and numbers displayed in close vicinity to respective atoms (atoms were given a small radius in this display). From watching the structure at different angles and from looking 
at information in the original file,  
atoms connected to each other were identified and suitable cylinders marking these connections included in the structure. Finally numbers were eliminated from the image and spheres and cylinders fused into a
blob. 

Texture: Throughout my molecules, I am presenting carbon in a dark grey, oxygen in orange, nitrogen in blue and sulfur in yellow colour. Unsaturated bonds are displayed in bright colours and in the colours of 
respective pigments. UV-absorbing conjugated double bonds are given in white colour. 

For some unkown reason Pov-Ray seems to render asymmetric carbon atoms, and chiral structures in general, in the wrong configuration. This also applies to the structure of the molecule 
presented here, which therefore may have a wrong configuration. Any suggestions on this point are welcome.  

*/ 

//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}

#declare Camera_z = camera {/*ultra_wide_angle*/ //angle 90 // right side view
    location  <0 , 2 , -27>
    rotate <0, 0, 0>
    right     x*image_width/image_height
    look_at   <0.0 , 2 , 0>
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

//---------------------Radius of atoms--------------------------------

#declare RadiusFaktor = 0.8; 

#declare RC = 0.76; 
#declare RN = 0.71; 
#declare RO = 0.66; 
#declare RS = 1.0; 

//-------------------Radius of bonds-------------------------------------

#declare BondRadius = 0.25;  

#declare AromatRadius = 0.3;  
#declare DoubleRadius = 0.25;  


//------------------------------------------Positions taken from the database-file----------------------------
/*IN many cases the information provided in the database file was sufficient for finding atoms connected by direct bonds. Therefore bonds (cylinders) have been included 
directly with the position data. */

blob {

    threshold 0.6      

    #declare P1 = < 4.874,   2.855 ,  0.366 >;//     1.00  0.00           N    N   CYS A 
    #declare P2 = <    3.791,   1.923,   0.075   >;//1.00  0.00           C    CA  CYS A  
    #declare P3 = <      4.157,   0.518,   0.500   >;//1.00  0.00           C    C   CYS A 
    #declare P4 = <     5.232,   0.286,   1.045   >;//1.00  0.00           O    O   CYS A 
    #declare P5 = <    3.435,   1.946,  -1.418   >;//1.00  0.00           C    CB  CYS A  
    #declare P6 = <      2.665,   3.502,  -1.990   >;//1.00  0.00           S   SG  CYS A  

    cylinder { #
        P1, P2, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P3, P2, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P3, P4, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P2, P5, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P5, P6, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------






    #declare P7 = <      3.252,  -0.399,   0.268  >;// 1.00  0.00           N    N   TYR A 
    #declare P8 = <     3.387,  -1.760 ,  0.550  >;// 1.00  0.00           C   CA  TYR A  
    #declare P9 = <       2.361 , -2.413 , -0.333  >;// 1.00  0.00           C C   TYR A   
    #declare P10 = <       1.436,  -1.723,  -0.788   >;//1.00  0.00           O   O   TYR A 
    #declare P11 = <      3.100,  -2.041 ,  2.041  >;// 1.00  0.00           C  CB  TYR A  
    #declare P12 = <       3.274,  -3.486,   2.457  >;// 1.00  0.00           C  CG  TYR A 
    #declare P13 = <    4.530 , -4.073  , 2.473  >;// 1.00  0.00           C  CD1 TYR A  
    #declare P14 = <       2.185,  -4.258 ,  2.838  >;// 1.00  0.00           C   CD2 TYR A  
    #declare P15 = <      4.697,  -5.383,   2.850  >;// 1.00  0.00           C   CE1 TYR A  
    #declare P16 = <      2.348,  -5.571,   3.218  >;// 1.00  0.00           C   CE2 TYR A  
    #declare P17 = <     3.607,  -6.128  , 3.221  >;// 1.00  0.00           C   CZ  TYR A 
    #declare P18 = <     3.773,  -7.431 ,  3.601  >;// 1.00  0.00           O   OH  TYR A 

 
    cylinder { 
        P3, P7, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P7, P8, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P8, P9, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P9, P10, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P8, P11, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P11, P12, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------


    cylinder { 
        P12, P13, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P12, P14, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P13, P15, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P14, P16, DoubleRadius, 1 
        texture { 
            Text_Double      
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
        P16, P17, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P17, P18, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------






    #declare P19 = <     2.531,  -3.680 , -0.581   >;//1.00  0.00           N  N   ILE A 
    #declare P20 = <       1.677 , -4.511,  -1.466   >;//1.00  0.00           C   CA  ILE A 
    #declare P21 = <     0.199 , -4.221 , -1.291  >;// 1.00  0.00           CC   ILE A   
    #declare P22 = <     -0.519 , -3.905,  -2.240  >;// 1.00  0.00           O   O   ILE A 
    #declare P23 = <      1.928,  -6.029,  -1.237   >;//1.00  0.00           C CB  ILE A  
    #declare P24 = <      3.427 , -6.341,  -1.317   >;//1.00  0.00           C CG1 ILE A    
    #declare P25 = <       1.161,  -6.856,  -2.271  >;// 1.00  0.00           C  CG2 ILE A 
    #declare P26 = <     3.786 , -7.783,  -1.018   >;//1.00  0.00           C    CD1 ILE A  

    cylinder { 
        P9, P19, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P19, P20, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P20, P21, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P21, P22, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder ------------------------------------- 
         

    cylinder { 
        P20, P23, BondRadius, 1 
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
        P24, P25, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P24, P26, BondRadius, 1 
        texture { Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------


         





    #declare P27 = <     -0.204,  -4.279,  -0.093   >;//1.00  0.00           N    N   GLN A  
    #declare P28 = <    -1.601,  -4.078 ,  0.283   >;//1.00  0.00           C      CA  GLN A  
    #declare P29 = <      -1.790,  -2.792,   1.112   >;//1.00  0.00           C  C   GLN A 
    #declare P30 = <     -2.726,  -2.685,   1.911   >;//1.00  0.00           O  O   GLN A 
    #declare P31 = <      -2.146 , -5.314,   1.032   >;//1.00  0.00           C  CB  GLN A
    #declare P32 = <    -1.441 , -5.647,   2.338   >;//1.00  0.00           C  CG  GLN A  
    #declare P33 = <     -2.010,  -6.885,   3.023   >;//1.00  0.00           C  CD  GLN A 
    #declare P34 = <    -2.494,  -7.820 ,  2.381   >;//1.00  0.00           O  OE1 GLN A 
    #declare P35 = <    -1.983,  -6.890 ,  4.320   >;//1.00  0.00           N  NE2 GLN A 

    cylinder { 
        P21, P27, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P27, P28, BondRadius, 1 
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
        P29, P30, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P28, P31, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P31, P32, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P32, P33, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P33, P34, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P33, P35, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------


 


    #declare P36 = <       -0.942,  -1.802 ,  0.876   >;//1.00  0.00           N   N   ASN A
    #declare P37 = <      -1.010 , -0.533 ,  1.594   >;//1.00  0.00           C  CA  ASN A 
    #declare P38 = <      -0.214 ,  0.526 ,  0.877   >;//1.00  0.00           C  C   ASN A 
    #declare P39 = <       0.937 ,  0.794,   1.192   >;//1.00  0.00           O   O   ASN A 
    #declare P40 = <     -0.572,  -0.650 ,  3.081   >;//1.00  0.00           C  CB  ASN A  
    #declare P41 = <    -0.616,   0.690,   3.831   >;//1.00  0.00           C  CG  ASN A  
    #declare P42 = <       0.387 ,  1.404,   3.922   >;//1.00  0.00           O OD1 ASN A  
    #declare P43 = <    -1.765 ,  1.049 ,  4.341   >;//1.00  0.00           N ND2 ASN A 

    cylinder { 
        P29, P36, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P36, P37, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P37, P38, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P38, P39, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder ------------------------------------- 
         
         
    cylinder { 
        P37, P40, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P40, P41, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P41, P42, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P41, P43, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

  


    #declare P44 = <      -0.764,   1.026,  -0.158   >;//1.00  0.00           N  N   CYS A 
    #declare P45 = <      -0.140,   2.101,  -0.873   >;//1.00  0.00           C    CA  CYS A 
    #declare P46 = <      -1.051,   3.316,  -0.861   >;//1.00  0.00           C  C   CYS A 
    #declare P47 = <     -2.141 ,  3.274,  -1.434   >;//1.00  0.00           O  O   CYS A  
    #declare P48 = <       0.193 ,  1.681,  -2.308   >;//1.00  0.00           C CB  CYS A  
    #declare P49 = <      1.185 ,  2.902 , -3.264   >;//1.00  0.00           S  SG  CYS A  

    cylinder { 
        P37, P44, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P44, P45, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P45, P46, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P46, P47, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------


    cylinder { 
        P45, P48, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------

    cylinder { 
        P48, P49, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------


    cylinder {  
        P6, P49, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------




    #declare P50 = <      -0.660,   4.386 , -0.143   >;//1.00  0.00           N N   PRO A  
    #declare P51 = <     -1.424,   5.635 , -0.117   >;//1.00  0.00           C CA  PRO A   
    #declare P52 = <    -1.574,   6.192 , -1.529  >;// 1.00  0.00           C   C   PRO A  
    #declare P53 = <     -0.590 ,  6.580 , -2.165   >;//1.00  0.00           O  O   PRO A  
    #declare P54 = <      -0.555,   6.569,   0.729   >;//1.00  0.00           C CB  PRO A  
    #declare P55 = <     0.282 ,  5.665 ,  1.553   >;//1.00  0.00           C  CG  PRO A 
    #declare P56 = <       0.537,   4.459 ,  0.710   >;//1.00  0.00           C CD  PRO A 

    cylinder { 
        P46, P50, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P50, P51, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P51, P52, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P52, P53, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------   
    cylinder { 
        P51, P54, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P54, P55, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P55, P56, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P56, P50, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
  


    #declare P57 = <      -2.786,   6.199,  -2.024   >;//1.00  0.00           N  N   LEU A  
    #declare P58 = <     -3.044,   6.624,  -3.392  >;// 1.00  0.00           C   CA  LEU A  
    #declare P59 = <     -3.389,   8.088 , -3.457   >;//1.00  0.00           C C   LEU A   
    #declare P60 = <     -3.608 ,  8.661 , -4.523  >;// 1.00  0.00           O  O   LEU A   
    #declare P61 = <      -4.136,   5.783,  -4.023   >;//1.00  0.00           C CB  LEU A   
    #declare P62 = <     -3.848,   4.280,  -4.173  >;// 1.00  0.00           C CG  LEU A  
    #declare P63 = <     -5.036,   3.567,  -4.795   >;//1.00  0.00           C  CD1 LEU A 
    #declare P64 = <      -2.590 ,  4.042,  -5.000  >;// 1.00  0.00           C CD2 LEU A 

    cylinder { 
        P52, P57, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P57, P58, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P58, P59, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P59, P60, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P58, P61, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P61, P62, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P62, P63, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P62, P64, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
  


    #declare P65 = <      -3.406 ,  8.654,  -2.333  >;// 1.00  0.00           N  N   GLY A  
    #declare P66 = <     -3.689,  10.034 , -2.161  >;// 1.00  0.00           C   CA  GLY A 
    #declare P67 = <      -3.647,  10.353 , -0.712  >;// 1.00  0.00           C    C   GLY A  
    #declare P68 = <     -3.337 , 11.487 , -0.337   >;//1.00  0.00           O     O   GLY A 
    #declare P69 = <     -3.916,   9.443,   0.096   >;//1.00  0.00           O   OXT GLY A   

    cylinder { 
        P59, P65, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P65, P66, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P66, P67, BondRadius, 1 
        texture { 
            Text_Bond      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P67, P68, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------
    cylinder { 
        P67, P69, DoubleRadius, 1 
        texture { 
            Text_Double      
        } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
    } // end of cylinder -------------------------------------




 //-----------------------------------------sphere representing the various atoms----------------------------------------------



    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <    4.874,   2.855,   0.366 >
    }  
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <3.791,   1.923,   0.075   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <4.157,   0.518,   0.500   >
    }  
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <    5.232,   0.286,   1.045   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <3.435,   1.946,  -1.418   >
    }  
    sphere{
        <0,0,0>, RS*RadiusFaktor, 1 
        texture{
            Text_S
        }  
        translate <  2.665,   3.502,  -1.990   >
    }  
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <   3.252 , -0.399,   0.268   >
    }  
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   3.387,  -1.760,   0.550   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   2.361,  -2.413,  -0.333   >
    } 
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   1.436,  -1.723,  -0.788  >}
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  3.100,  -2.041,   2.041   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   3.274,  -3.486,   2.457   >
    }  
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   4.530 , -4.073,   2.473  >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   2.185 , -4.258 ,  2.838   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   4.697,  -5.383 ,  2.850   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <    2.348,  -5.571,   3.218   >
    }  
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  3.607,  -6.128 ,  3.221   >
    }  
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   3.773,  -7.431,   3.601 >
    }  
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <    2.531,  -3.680,  -0.581 >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <    1.677,  -4.511,  -1.466   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   0.199,  -4.221,  -1.291   >
    } 
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <    -0.519,  -3.905,  -2.240   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <    1.928,  -6.029,  -1.237   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  3.427,  -6.341,  -1.317   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture {
             Text_C
        }   
        translate <   1.161,  -6.856,  -2.271   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <    3.786,  -7.783,  -1.018   >
    } 
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <  -0.204,  -4.279,  -0.093   >
    }
    sphere {
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  -1.601,  -4.078   0.283   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -1.790,  -2.792   1.112   >
    }
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   -2.726,  -2.685,   1.911   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture {
            Text_C
        }   
        translate <  -2.146,  -5.314,   1.032   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture {
            Text_C
        }   
        translate < -1.441,  -5.647,   2.338   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -2.010,  -6.885,   3.023   >
    } 
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   -2.494,  -7.820,   2.381   
    >}
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <   -1.983,  -6.890 ,  4.320   >
    }
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <   -0.942,  -1.802,   0.876   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  -1.010,  -0.533,   1.594   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  -0.214,   0.526,   0.877   >
    }
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <    0.937,   0.794,   1.192   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }  
        translate < -0.572,  -0.650,   3.081   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -0.616,   0.690,   3.831   >
    } 
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   0.387,   1.404,   3.922   >
    }
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <  -1.765,   1.049,   4.341   >
    }
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <  -0.764 ,  1.026,  -0.158   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  -0.140 ,  2.101,  -0.873   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -1.051,   3.31,  -0.861   >
    }
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <    -2.141,   3.274,  -1.434  >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   0.193,   1.68,1  -2.308   >
    }
    sphere{
        <0,0,0>, RS*RadiusFaktor, 1 
        texture{
            Text_S
        }  
        translate <    1.185,   2.902,  -3.264  >
    }
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <   -0.660 ,  4.386,  -0.143  >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -1.424,   5.635,  -0.117   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -1.574,   6.192,  -1.529   >
    }
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   -0.590,   6.580,  -2.165  >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  -0.555,   6.569,   0.729   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <    0.282 ,  5.665,   1.553   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <     0.537,   4.459,   0.710  >
    }
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <   -2.786,   6.199,  -2.024   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -3.044,   6.624,  -3.392   >
    } 
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  -3.389,   8.088,  -3.457   >
    }
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   -3.608,   8.661,  -4.523   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture {
            Text_C
        }   
        translate <  -4.136,   5.783,  -4.023   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture {
            Text_C
        }   
        translate <    -3.848,   4.280,  -4.173   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  -5.036,   3.567,  -4.795   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -2.590 ,  4.042,  -5.000   >
    }
    sphere{
        <0,0,0>, RN*RadiusFaktor, 1 
        texture{
            Text_N
        }  
        translate <   -3.406 ,  8.654,  -2.333   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <   -3.689,  10.034,  -2.161   >
    }
    sphere { 
        <0,0,0>, RC*RadiusFaktor, 1 
        texture { 
            Text_C
        }   
        translate <  -3.647,  10.353,  -0.712   >
    }
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   -3.337,  11.487,  -0.337   >
    }
    sphere{
        <0,0,0>,RO*RadiusFaktor, 1 
        texture{
            Text_O
        }  
        translate <   -3.916,   9.443,   0.096   >
    }

    rotate <0, 0, -10>
    //rotate <0, -360 * clock, 0>
}







