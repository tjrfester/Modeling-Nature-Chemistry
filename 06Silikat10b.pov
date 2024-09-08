// Persistence of Vision Ray Tracer Scene Description File

#version 3.6; // current version is 3.8

/* 
Information on Pov-Ray:
 
My personal introduction into Pov-Ray was the excellent book "3D-Welten, professionelle Animationen und fotorealistische Grafiken mit Raytracing" from 
Toni Lama by Carl Hanser Verlag München Wien, 2004. Apart of that I recommend the Pov-Ray-homepage (http://www.povray.org).

Further information on Pov-Ray can be found at https://sus.ziti.uni-heidelberg.de/Lehre/WS2021_Tools/POVRAY/POVRAY_PeterFischer.pdf,  
https://wiki.povray.org/content/Main_Page, https://de.wikibooks.org/wiki/Raytracing_mit_POV-Ray or, in german language, here: https://www.f-lohmueller.de/pov_tut/pov__ger.htm
 

---------------------------------------------------Modeling approach---------------------------------------------- 

Model of a clay mineral consisting of repeating layers of sheets formed like sandwiches from silicate and aluminum ions. While bonds holding sandwiches together are strong, forces between these sandwiches are much 
weaker. Due to excess negative charges, sandwich layers can bind cations like potassium on the outside. This way they serve as important buffers for plant nutrients in the soil. 

The model of the structure presented here uses its repetitive nature. The basic unit is one mineral layer ("Silikatschicht") consisting of two layers of silicate sheets and one layer of alumina (blue) bound to oxygen atoms 
in between. Using the makro "Ionen()", cations (yellow) are distributed on the upper and lwoer surface of these layers. Only 10 % of theoretical binding positions are actually occupied on both sides. 

*/ 

//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}

#declare Ykamera = camera {
    location  <42, 150, 35>
    right     x*image_width/image_height
    look_at   <42, 38,  35>
}

#declare Zkamera = camera {
    location  <5, 0, -50>
    right     x*image_width/image_height
    look_at   <0, 0,  0>
}


#declare Hauptkamera = camera {
    location  <155, 38, 155>
    right     x*image_width/image_height
    look_at   <42, 38,  35>
}


camera {
    Hauptkamera
}


// create a regular point light source
light_source {
     0*x                  // lights position (translated below)
    color rgb <1,1,1>    // lights color
    translate <160, 30, 160>
}
light_source {
     0*x                  // lights position (translated below)
    color rgb <1,1,1>    // lights color
    translate <160, 10, 0>
}


//-------------------------------Macros: Loosely bound cations are positioned by the following macro--------------------------------------------------

#macro Ionen()

    #declare ticker = 0;
    #while (ticker<Sizaehler)                        //positions of silicon atoms in the lower layer are taken from the array

        #declare P1 = Silizium [ticker];

        #declare P2 =P1 + <0, 4.9, 5.27/(2*cos(pi/6))>; //here the positions of silicon atoms in the upper layer are calculated
 
        #if (rand (chance1) <0.1)                   //with a probability of 10% an ion will be placed just belwo one silicon atom from the lower layer
 
            sphere { 
                <0, 0, 0>, IonRadius 
                texture {
                    IonTextur
                }
                translate P1
                translate <0, -2.5, 0>
            } 

        #else
            #if (rand (chance1) <0.2)               //with a probability of 10 % an ion will be placed just above an silicon atom from the upper layer

                sphere { 
                    <0, 0, 0>, IonRadius 
                    texture {
                        IonTextur
                    }
                    translate P2
                    translate <0, 2.5, 0>           
               }

           #else
           #end
       #end

    #declare ticker = ticker + 1;
    #end 

#end


  
//-----------------------------Definition of atom texture and radius------------------------------------------------------------

#declare chance1 = seed (9);


#declare SiRadius = 1.17*2;
#declare ORadius = 0.66*1.9;
#declare AlRadius = 0.51*3.7;
#declare IonRadius = 0.66;


#declare SiTextur =  pigment {          // (---surface color---)
    color rgb <255/255,128/255,0/255>    // lights color
};

#declare IonTextur = texture {
    pigment {          // (---surface color---)
        color rgb <255/255,255/255,0/255>    // lights color
    }
    finish {
        ambient 0.5          // ambient surface reflection color [0.1]
        diffuse 0.6          // amount [0.6]
        brilliance 1.0       // tightness of diffuse illumination [1.0]
    } // finish
};

/*
#declare SiTextur2 =  pigment {          // (---surface color---)
    color rgb <0/255,145/255,255/255>    // lights color
}; 
*/
#declare OTextur =  pigment {          // (---surface color---)
    color rgb <255/255,0/255,0/255>    // lights color
};

#declare AlTextur =  pigment {          // (---surface color---)
    color rgb <0/255,145/255,255/255>    // lights color
};


//------------------------------------------------Definition of layers; storing positions of atoms in arrays-------------------------------------------------------- 

//--------------------------------------------------Positions of silicon atoms--------------------------------------------------------------------------------

/* Positions of silicon atoms in one silicate layer: the honeycomb structure is created by three nested loops. Loop 1 (inner loop with ticker1) produces 4 positions defining 
the upper and lower and the two right hand positions of an upright hexagon. Loop 2 (22 elements, NumberX, ticker2) adds this group of 4 positions to a growing chain of hexagons. 
Loop 3 (outer loop, NumberZ, ticker3) finally adds 12 of such rows of hexagons to each other producing a sheet of hexagons. 
*/ 

#declare NumberX = 22;
#declare NumberZ = 12;

#declare Silizium = array[4 * (NumberX+1) * (NumberZ+1)]             //array for positions of Si

#declare Sizaehler = 0;
#declare ticker3 = 0;
#while (ticker3<NumberZ)

    #declare ticker2 = 0;
    #while (ticker2<NumberX)

        #declare ticker1 = 0;
        #while (ticker1<4)

            #declare P1 =  <0, 0, 5.27/(2*cos(pi/6))>;
            #declare P1 = vrotate (P1, <0, 60 * ticker1, 0>);
            #declare P1 =  P1 + <ticker2 *5.27, 0, 0>;   
            #declare P1 =  P1 + <0, 0, ticker3 *9.12>;

            #declare Silizium [Sizaehler] = P1;
            #declare Sizaehler = Sizaehler + 1;
                                                                     //Storing positions in the array
        #declare ticker1 = ticker1 + 1;
        #end

    #declare ticker2 = ticker2 + 1;
    #end

#declare ticker3 = ticker3 + 1;
#end



//--------------------------------------------------------------Positions of oxygen atoms in one silicate layer--------------------------------- 

#declare Sauerstoff = array[3*4 * (NumberX+1) * (NumberZ+1)]

#declare Oxyzaehler = 0;

#declare ticker3 = 0;
#while (ticker3<NumberZ)

    #declare ticker2 = 0;
    #while (ticker2<NumberX)

        #declare ticker1 = 0;
        #while (ticker1<4)

            #declare ticker = 0;                                //Since each silicon atom is surrounded by 4 oxygen atoms, we need an additional loop of 4 elements for defining their positions. 
            #while (ticker<4)

                #if (ticker1 <3) //condition applying to 3 silicon atoms with 3 oxygens each 

                    #if (ticker = 0)  

                        #declare P1 =  <0, 1.17 + 0.66 - 0.25, 0>;

                        #declare P1 =  P1 + <0, 0, 5.27/(2*cos(pi/6))>;

                        #declare P1 = vrotate (P1, <0, 60 * ticker1, 0>);

                        #declare P1 =  P1 + <ticker2 *5.27, 0, 0>;   

                        #declare P1 =  P1 + <0, 0, ticker3 *9.12>;

                        #declare Sauerstoff [Oxyzaehler] = P1;
                         
                        #declare Oxyzaehler = Oxyzaehler + 1;


                    #else

                        #if (ticker = 2)

                        #else

                            #declare P1 =  <0, 1.17 + 0.66 - 0.25, 0>;

                            #declare P1 = vrotate (P1, <109.7, (ticker-1)*120, 0>);

                            #declare P1 =  P1 + <0, 0, 5.27/(2*cos(pi/6))>;

                            #declare P1 = vrotate (P1, <0, 60 * ticker1, 0>);

                            #declare P1 =  P1 + <ticker2 *5.27, 0, 0>;   

                            #declare P1 =  P1 + <0, 0, ticker3 *9.12>;

                            #declare Sauerstoff [Oxyzaehler] = P1; 
                            
                            #declare Oxyzaehler = Oxyzaehler + 1;

                        #end
                    #end
                #else//Condition applying to the last silicon with only two oxygens

                    #if (ticker = 0)  

                        #declare P1 =  <0, 1.17 + 0.66 - 0.25, 0>;

                        #declare P1 =  P1 + <0, 0, 5.27/(2*cos(pi/6))>;

                        #declare P1 = vrotate (P1, <0, 60 * ticker1, 0>);

                        #declare P1 =  P1 + <ticker2 *5.27, 0, 0>;   

                        #declare P1 =  P1 + <0, 0, ticker3 *9.12>;

                        #declare Sauerstoff [Oxyzaehler] = P1;
                         
                        #declare Oxyzaehler = Oxyzaehler + 1;

                    #else

                        #if (ticker = 3)

                            #declare P1 =  <0, 1.17 + 0.66 - 0.25, 0>;

                            #declare P1 = vrotate (P1, <109.7, (ticker-1)*120, 0>);

                            #declare P1 =  P1 + <0, 0, 5.27/(2*cos(pi/6))>;

                            #declare P1 = vrotate (P1, <0, 60 * ticker1, 0>);

                            #declare P1 =  P1 + <ticker2 *5.27, 0, 0>;   

                            #declare P1 =  P1 + <0, 0, ticker3 *9.12>;

                            #declare Sauerstoff [Oxyzaehler] = P1; 

                            #declare Oxyzaehler = Oxyzaehler + 1;

                        #else
                        #end
                    #end
                #end

            #declare ticker = ticker + 1;
            #end

        #declare ticker1 = ticker1 + 1;
        #end

    #declare ticker2 = ticker2 + 1;
    #end

#declare ticker3 = ticker3 + 1;
#end


//---------------------------------------------------Positions of aluminium atoms-------------------------------------------


#declare Aluminium = array[3 * (NumberX) * (2*NumberZ+1)]   //Defining the array for storing positions

#declare Alzaehler = 0;

#declare ticker3 = 0;
#while (ticker3<2*NumberZ)

    #declare ticker2 = 1;
    #while (ticker2<NumberX)

        #declare ticker1 = 0;
        #while (ticker1<3)

            #declare P1 =  <0, 2.5, 0.55 *5.27/(2*cos(pi/6))>;

            #declare P1 = vrotate (P1, <0, 30 + 120 * ticker1, 0>); 

            #if (mod (ticker3,2)>0)                                       //Every second row is shifted

                #declare P1 =  P1 + <ticker2 *5.27-5.27/2, 0, 0>; 

            #else

                #declare P1 =  P1 + <ticker2 *5.27, 0, 0>; 

            #end  

            #declare P1 =  P1 + <0, 0, ticker3 *9.12/2>;

            #declare Aluminium [Alzaehler] = P1; 
            
            #declare Alzaehler = Alzaehler + 1;

        #declare ticker1 = ticker1 + 1;
        #end

    #declare ticker2 = ticker2 + 1;
    #end

#declare ticker3 = ticker3 + 1;
#end




//-------------------------------------------------------Positions of OH-groups from the Al-layer------------------------------------ 


#declare Hydroxy = array[2 * (NumberX) * (2*NumberZ+1)]    //Array for storing positions of OH-groups

#declare OHzaehler = 0;

#declare ticker3 = 0;
#while (ticker3<2*NumberZ)

    #declare ticker2 = 1;
    #while (ticker2<NumberX)

        #if (mod (ticker3,2)>0)

            #declare P2 =  <ticker2 *5.27-5.27/2, 0, 0>; 

        #else

            #declare P2 =  <ticker2 *5.27, 0, 0>; 

        #end  

        #declare P2 =  P2 + <0, 1.6, ticker3 *9.12/2>;

        #declare Hydroxy [OHzaehler] = P2; 
        
        #declare OHzaehler = OHzaehler + 1;

        #declare P3 =  P2 + <0, 4.9-2*1.6, 5.27/(2*cos(pi/6))>;

        #declare Hydroxy [OHzaehler] = P3;
         
        #declare OHzaehler = OHzaehler + 1;

    #declare ticker2 = ticker2 + 1;
    #end

#declare ticker3 = ticker3 + 1;
#end

//-------------------------------------------The positions defined above are now used to define an actual sandwich layer----------------------



// create a silicate layer as a blob

//first the silicon atoms

#declare Silikatschicht = blob {
    // threshold (0.0 < threshold <= StrengthVal) surface falloff threshold #
    threshold 0.6 
    
    #declare ticker = 0;
    #while (ticker<Sizaehler)

        #declare P1 = Silizium [ticker];                    //P1 refers to the upper layer of silicon atoms...

        #declare P2 =P1 + <0, 4.9, 5.27/(2*cos(pi/6))>;      //...P2 refers to the lower layer of silicon atoms
                                                                  //...here the lower layer is created
       

        sphere { 
            <0, 0, 0>, SiRadius,1                            //here the upper layer is created...
            texture {
                SiTextur
            }
            translate P1
        } 
        sphere { 
            <0, 0, 0>, SiRadius,1 
            texture {
                SiTextur
            }
            translate P2
        }
                
    #declare ticker = ticker + 1;
    #end 
    
    

//...then the oxygen atoms


    #declare ticker = 0;
    #while (ticker<Oxyzaehler)

            #declare P1 = Sauerstoff [ticker];               //Oxygen atoms for the lower silicate sheet

            sphere { 
                <0, 0, 0>, ORadius,1 
                texture {
                    OTextur
                }
                translate P1
            } 
            
            
            #declare P2 =P1 + <0, 2.5 + 2.5-P1.y, 5.27/(2*cos(pi/6))>;         //Oxygen atoms for the upper silicate sheet


            sphere { 
                <0, 0, 0>, ORadius,1 
                texture {
                    OTextur
                }
                translate P2
            }

 
            
    #declare ticker = ticker + 1; 
    #end            


//and the aluminium atoms

    
    #declare ticker = 0;
    #while (ticker<Alzaehler)


        #declare P1 = Aluminium [ticker];

        sphere { 
            <0, 0, 0>, AlRadius,1 
            texture {
                AlTextur
            }
            translate P1
        }

    #declare ticker = ticker + 1;
    #end


//Oxygen atoms from the Al-layer

    #declare ticker = 0;
    #while (ticker<OHzaehler)

        #declare P1 = Hydroxy [ticker];

        sphere { 
            <0, 0, 0>, ORadius,1 
            texture {
                OTextur
            }
            translate P1
        }

    #declare ticker = ticker + 1;
    #end

} 





//-------------------------Anordnung der Schichten----------------------------



object {                       //this is the sandwich layer consisting of two layers silicate and one layer made from Al-ions
    Silikatschicht
    translate <0, 10, 0>
}


union{                         //Ions loosely attached to the sandwich system. 
    Ionen()
    translate <0, 10, 0>
}
object {
    Silikatschicht
    translate <0, 20, 0>
}

union{
    Ionen()
    translate <0, 20, 0>
}

object {
    Silikatschicht
    translate <0, 30, 0>
}

union{
    Ionen()
    translate <0, 30, 0>
}

object {
    Silikatschicht
    translate <0, 40, 0>
}

union{
    Ionen()
    translate <0, 40, 0>
}

object {
    Silikatschicht
    translate <0, 50, 0>
}

union{
    Ionen()
    translate <0, 50, 0>
}

object {
    Silikatschicht
    translate <0, 60, 0>
}

union{
    Ionen()
    translate <0, 60, 0>
}


