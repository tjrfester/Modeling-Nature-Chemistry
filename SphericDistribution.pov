// Persistence of Vision Ray Tracer Scene Description File
// File: SphericDistribution.pov

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


#declare Camerax = camera {
    location  <-5, 0.25, 0.5> 
    look_at   <0, 0,  0>
}
 
 
camera {
    Camerax
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
For obtaining an even spherical distribution of points it is not sufficient to randomly distribute points along latitudes and longitudes, since this will result in accumulation of 
points near the poles. One approach for an even distribution is to distribute points randomly on a cylinder where the sphere in question is inscribed. By projecting these points onto 
the sphere using an angle of 90 degrees with respect to the axis of the cylinder, an even distribution on the sphere may be obtained. This approach is modified below for a sphere with 
radius R, by first placing a position onto the x-axis (axis of the cylinder) in the distance R from the origin. This position is then rotated around the z-axis by the angle a = arccos(H/R)
with H being randomly selected with values between -R and R. This rotation corresponds to the projection of a point on the cylinder onto the sphere. Finally the positions obtained are rotated 
around the x-axis by a randomly selected angle between 0 and 360 degrees.
 
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


#declare chance1 = seed (8); 

#declare ticker = 0; 
#while (ticker < 10000) 

    #declare R = 1.5;                                               //The radius of the sphere; the sphere has the origin as its center
    #declare P1 = <R, 0, 0>;                                        //A position on the x-axis, on the surface of the sphere
    #declare H = R*(2*rand(chance1) - 1);                           //H is any random position on the x-axis within the sphere
    #declare Angle = degrees(acos(H/R));                            //The angle of rotation is defined as the arcus cosine of the ratio between H and R.
    #declare P1 = vrotate (P1, <0, 0, Angle>);                      //The position is rotated around the z-axis by the angle just defined. 
    #declare P1 = vrotate (P1, <360*rand(chance1), 0, 0>);          //The position is rotated around the x-axis by a random angle between 0 and 360 degrees. 
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

#declare ticker = ticker + 1; 
#end 

