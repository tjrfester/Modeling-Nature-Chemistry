# Modeling-Nature-Chemistry
Here I will store Pov-Ray scripts and -approaches for modeling chemical structures. 

Let's start with modeling atoms! Or let's better say modeling electron envelopes. I will include scripts and images for the 1s, the 2s and the 2py-orbital. Here is the link for a youtube-video covering the theoretical background: https://www.youtube.com/watch?v=BfG_aMN3F-U

1s-Orbital (section)
![1SOrbital](https://github.com/tjrfester/Modeling-Nature-Chemistry/assets/153545618/aa16ec50-9b81-4075-ad75-6855ffb747c8)
2s-Orbital (section)
![2SOrbital](https://github.com/tjrfester/Modeling-Nature-Chemistry/assets/153545618/0fe65219-5e03-4ef3-9c90-1bfc5ee3a968)
2py-Orbital (section)
![POrbital](https://github.com/tjrfester/Modeling-Nature-Chemistry/assets/153545618/6481eb9e-bdc6-4a89-a4cb-a9757cc54e20)
For modeling the s-orbitals you need a method for evenly distributing elements on a sphere - here is one: 
![SphericDistribution](https://github.com/tjrfester/Modeling-Nature-Chemistry/assets/153545618/e9ca050c-8ff0-48d6-84ba-7648cd3bf571)
Now let`s take a look at molecules: the rules how atoms are combined and arranged into molecules are pretty complex - too complex for me 
for modeling in Pov-Ray in most cases. (There are some exceptions presented at the end of this readme.) So in most cases you have to proceed in three steps: 
A) Obtain steric data of the molecule in question either from software like Avogadro or from a database, B) Integrate these data into a pov-ray script either manually or 
by using some software. (I have been doing this about 20 years ago and have been using Perl for this purpose. Nowadays Python probably is more appropriate.) and C) Render the whole 
thing in pov-ray and think about textures, light, background etc. Here are two examples, where I produced structural data myself by using Avogadro: First comes the structure of Penicillin G. 
![02Penicillinc](https://github.com/user-attachments/assets/66d4bb76-ad6e-4fb4-8830-ab4873d9fc34)
And second the structure of the human red blood pigment heme. 
![03Häm](https://github.com/user-attachments/assets/f8d2f887-dfcb-473e-be9a-750f0a149d5b)
Oxytocin, shown below is a medium sized molecule - I obtained structural data from the RSCB Protein Data Bank
![04Oxytocinc](https://github.com/user-attachments/assets/bed37b9e-6429-4745-81fe-cbea8bf70418)
All molecules given above are modeled using a "ball and stick" approach. Sphere are used for representing atoms and cylinders for representing bonds. While data for positioning the spheres can 
be extracted directly from Avogadro xyz-files, this is not the case for the cylinders. xyz-files do not contain information about which atoms are connected with each other and in case of database files, 
I always have problems finding this information as well. My work-around was to give a number to each atom and to display these numbers close to the atoms. From looking at these dot clouds from several 
angles you can infer the chemical structure and which atom has to be connected to which. Then you can introduce the cylinders. 
Another problem with transferring data from xyz- and other files into pov-ray was that in my hands pov-ray always displayed precisely the wrong chirality. Unfortunately I have not been able to solve this problem 
but by producing the "wrong" enantiomer in Avogadro and then obtaining the right one in Pov-Ray. (I did not use this approach for penicillin G, so the structure above should be the wrong enantiomer.) If anyone has 
an idea about this problem, please tell me... 
With larger structures, like this endoglucanase below together with its substrate, the "ball and stick" approach no longer makes much sense, so here I am only displaying the position of atoms. Data, again, have been obtained from the Protein Data Bank. 
![05endoglucanasej](https://github.com/user-attachments/assets/ad6187dd-954f-48f6-a53c-e5c9e0b61f6e)
Apart from this more or less chaotic chemical structures, there are also very regular structures, which can be modeled in pov-ray directly. Below I am presenting two examples: 
A fullerene - for a description of this structure, have a look at this youtube video: https://www.youtube.com/watch?v=wqR_b8usU4Q
![FullerenNeuBlob](https://github.com/tjrfester/Modeling-Nature-Chemistry/assets/153545618/308f053d-ecd4-4561-a12b-598367c74690)
And a clay mineral: individual layers are composed of two layers of phyllosilicate (orange-red colours) sandwiching one layer of aluminium (blue colour) and oxygen ions. Layers are surrounded by loosely attached cations (yellow colour) on their upper and lower side. 
(In soil science these minerals are important because they serve as buffers for binding these cations which are important plant nutrients.) 
![06Silikat10b](https://github.com/user-attachments/assets/55ff2478-d1ca-4777-9311-616d2811396d)
