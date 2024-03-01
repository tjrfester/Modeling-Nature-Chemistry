// Persistence of Vision Ray Tracer Scene Description File
// File: 2POrbital.pov

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
The 2s-Orbital is modeled using two different loops, one for the inner part, which is very similar to the 1s-Orbital except for a slightly smaller radius and a second for the outer part. 
In the case of the outer part, the distribution along the x-axis is shaped using a third power function. Points defined this way are then spherically distributed as for the 1s-Orbital. 
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




#declare chance1 = seed (8); 



//Points are first distributed on a cylinder circumsribed to the sphere. (Cylinder along the x-axis). Angles (rotation around z-axis) are calculated for points projected onto the sphere (perpendicular to the x-axis.) 



//Points are first distributed on a cylinder circumsribed to the sphere. (Cylinder along the x-axis). Angles (rotation around z-axis) are calculated for points projected onto the sphere (perpendicular to the x-axis.) 


//p-Orbitale                                  
  

#declare chance1 = seed(9); 

//Py

#declare ticker = 0; 
#while (ticker < 15000) 

    #declare Var1 = rand(chance1); 
    #declare Anglez = 85*pow(Var1, 0.5); 
    #declare Var1 = rand(chance1); 
    #declare P1 = <0, 1.4*pow(Var1, 1.1), 0>;                           //Positions are distributed along the y-axis from 0 to 1.4 with a very small bias towards 0
    #declare P1 = vrotate (P1, <0, 0, Anglez>);                         //Positions are rotated around the z-axis by an angle between 0 and 85 degrees with a bias for 85 degrees
    #declare P1 = P1 + <0, 0.1, 0>;                                     //Positions are shifted by +0.1 along the y-axis. 
    #declare P1 = vrotate (P1, <0, 360*rand(chance1), 0>);              //Finally positions are rotated randomly between 0 and 360 degrees around the y-axis resulting in rotational symmetry with respect to this axis. 


    #if (inside (Section, P1)>0)                                            //Only a section through the xy-plane is shown

        sphere { <0, 0, 0>, 0.005                                           //The upper part of the orbital. 
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
                                   
        sphere { <0, 0, 0>, 0.005
            translate P1 
            rotate <180, 0, 0>                                               //All positions are rotate by 180 degrees around the x-axis - this gives the lower part of the orbital
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


//Rotated versions of the orbital defined above; refer to p-Orbitals around x- and z-axis. 
/*
//Pz

#declare ticker = 0; 
#while (ticker < 30000) 

    #declare Var1 = rand(chance1); 

    #declare Anglez = 85*pow(Var1, 0.5); 
 
    #declare Var1 = rand(chance1); 

    #declare P1 = <0, 1.2*pow(Var1, 1.1), 0>; 
    #declare P1 = vrotate (P1, <0, 0, Anglez>); 
    #declare P1 = P1 + <0, 0.2, 0>; 
    #declare P1 = vrotate (P1, <0, 360*rand(chance1), 0>); 

//#if (inside (Section, P1)>0)


    sphere { <0, 0, 0>, 0.005
        translate P1
        rotate <90, 0, 0> 
        texture{ 
            pigment {
                color rgb <1,0,0>
            }
            finish {
            ambient 8 
            }
        }
    } 
                                   
    sphere { <0, 0, 0>, 0.005
        translate P1 
        rotate <180, 0, 0>
        rotate <90, 0, 0> 
        texture{ 
            pigment {
                color rgb <1,0,0>
            }
            finish {
                ambient 8 
            }
        }
    } 
                                   
//#else
//#end 

#declare ticker = ticker + 1; 
#end 



//Px

#declare ticker = 0; 
#while (ticker < 30000) 

    #declare Var1 = rand(chance1); 

    #declare Anglez = 85*pow(Var1, 0.5); 
 
    #declare Var1 = rand(chance1); 

    #declare P1 = <0, 1.2*pow(Var1, 1.1), 0>; 
    #declare P1 = vrotate (P1, <0, 0, Anglez>); 
    #declare P1 = P1 + <0, 0.2, 0>; 
    #declare P1 = vrotate (P1, <0, 360*rand(chance1), 0>); 

//#if (inside (Section, P1)>0)


    sphere { <0, 0, 0>, 0.005
        translate P1
        rotate <0, 0, 90> 
        texture{ 
            pigment {
                color rgb <0,0,1>
            }
            finish {
            ambient 8 
            }
        }
    } 
                                   
    sphere { <0, 0, 0>, 0.005
        translate P1 
        rotate <180, 0, 0>
        rotate <0, 0, 90> 
        texture{ 
            pigment {
                color rgb <0,0,1>
            }
            finish {
                ambient 8 
            }
        }
    } 
                                   
//#else
//#end 

#declare ticker = ticker + 1; 
#end 


 */