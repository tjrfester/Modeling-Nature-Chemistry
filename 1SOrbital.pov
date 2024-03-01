// Persistence of Vision Ray Tracer Scene Description File
// File: 1SOrbital.pov

#version 3.6; // current version is 3.8

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


#declare Cameraz = camera {
    location  <0.5, 0.3, -5>
    look_at   <0, 0,  0>
}



camera {
    Cameraz
}


// create a regular point light source
light_source {
    0*x                  // light's position (translated below)
    color rgb <1,1,1>    // light's color
    translate <-100, 100, 30>
} 
light_source {
    0*x                  // light's position (translated below)
    color rgb <0.6,0.6,0.6>    // light's color
    translate <0, 100, -10>
}  


//---------------------------------------------------Modeling approach---------------------------------------------- 

/*
The 1s-Orbital is modeled by first randomly distributing elements along the x-axis, with random numbers transformed by a quadratic equation and subsequently 
subjecting each element to a random and even spherical distribution. The basis for this distribution is detailed in the file "SphericDistribution.pov".
*/ 


//-------------------------------------------------------The coordinate system--------------------------------------------------------------

cylinder { 
    <-1000, 0, 0>, <1000, 0, 0>, 0.01 
    pigment {
        color rgb <1,0.5,0>     // solid color pigment
    }
}

cylinder { 
    <0, -1000, 0>, <0, 1000, 0>, 0.01 
    pigment {
        color rgb <0,1,0>     // solid color pigment
    }
}

cylinder { 
    <0, 0, -1000>, <0, 0, 1000>, 0.01 
    pigment {
        color rgb <0,0,1>     // solid color pigment
    }
} 

//---------------------------Objects-----------------------------------------------------------------       

//Box for producing a section in the x-y-plain. 
#declare Section = box { 
    <-8.00, -8.00, -0.200>,< 8.00, 8.00, 0.200>   
    texture { 
        pigment{ 
            color rgb<1.00, 1.00, 1.00>
        }  
        finish { 
            phong 1 reflection{ 
                0.00 metallic 0.00
            } 
        } 
    } // end of texture
    scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
} // end of box --------------------------------------



//1s-Orbital

//Points are first distributed along the x-axis using a quadratic transformation of random numbers. Subsequently points are subjected to an even spherical distribution.
 
#declare chance1 = seed (8); 

#declare ticker = 0; 
#while (ticker < 6000) 

    //Distribution along the x-axis
    #declare Var1 = rand(chance1); 
    #declare R = 1.7 * pow (Var1, 2);                           //Random numbers ranging from 0 to 1.7 accumulating close to the origin. R refers to the radius of the sphere each point will be distributed on in the following step.

    //Spherical distribution of the points defined above
    #declare P1 = <R, 0, 0>; 
    #declare H = R*(2*rand(chance1) - 1); 
    #declare Angle = degrees(acos(H/R));                            //The angle of rotation is defined as the arcus cosine of the ratio between H and R.
    #declare P1 = vrotate (P1, <0, 0, Angle>);                      //The position is rotated around the z-axis by the angle just defined. 
    #declare P1 = vrotate (P1, <360*rand(chance1), 0, 0>);          //The position is rotated around the x-axis by a random angle between 0 and 360 degrees. 

    #if (inside (Section, P1)>0)                                    //Only points within the box "Section" are displayed.

        sphere { 
            <0, 0, 0>, 0.005
            translate P1
            texture{ 
                pigment {
                    color rgb <0,208/255,1>
                }
                finish {
                    ambient 8 
                }
            }
        } 
                                   
    #else
    #end                                   
                                 
#declare ticker = ticker + 1; 
#end 

