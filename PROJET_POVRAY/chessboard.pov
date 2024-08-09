#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "glass.inc"
#include "metals.inc"
#include "functions.inc" 
#include "stones1.inc"
#include "skies.inc"

#declare Pi = 3.1415926535897932384626;

#declare axe=1;
#declare sca=3;
camera {
location <8.5,0,5>
look_at <0,0,0>
sky   <0,0,1>
right <-image_width/image_height,0,0>
}




light_source { <0, 0, 5> color White }

light_source { <0 , 5 , 5 > color  Black}
light_source { <10 , 10 , 10 > color  rgb <0.825,0.5,0.9>}
light_source { <15 , -15 , 15 > color rgb <0.5,0.25,0.49>}

#declare use_phot=0;
#declare use_area=0;

background {White} // fond blanc


global_settings{
  max_trace_level 60//32*3
  ambient_light 1.00
  assumed_gamma 2.0
  #if (use_phot)
  photons{
   spacing .025
   autostop 0
  }
  #end
}


     
     
     
   

                
         
                
      
 // couleurs de pions
#declare n=rgb <0.2,0.2,0.2>;
#declare b=rgb <1,235/255,205/255>;              



                             
                             
                  // TABLE           

       // contour de table d'echec
  box {<4.15,4.15,0>,<-4.1,-4.1,0.49>
        texture{ pigment {
                    color Brown}}  }
       
                         
                                  
                                  
          // cases de table d'echec                        
   box {<4.00,4.00,0.01>,<-4.00,-4.00,0.5> 
        texture{ pigment{ checker
                   color rgb<1,1,1>
                    color rgb<0,0,0>} 
                         
              } 
    }     









              // PION
                        
       #macro pion(caz,couleur)
union{

    lathe {
        bezier_spline 4,                             // base
        <3,0.5> <3,5/2.5> <3,2.5> <2.5,3>
        }
    lathe {
        bezier_spline 4,
        <2.5,3> <2.2,2.5> <1,4.5> <1,5>              // corp
        } 
    lathe {
        bezier_spline 4,
        <1,5> <3,6.5> <2,10> <-0.9,9>              // tête
        }
    pigment {color couleur} 
    rotate<90,0,0>
    scale 0.10                                  // paramètres de couleur,rotation et positionement
    translate<caz.x,caz.y,caz.z>    
    }             
#end                                            // fin macro pion                           

                        
                      
                        
                        
                        
                        
                        
                        
                        
          // coordonées de cases pour les pions             
           // blanc             

#declare A2= <3.5,2.5,0.5>;
#declare B2= <2.5,2.5,0.5>;
#declare C2= <1.5,2.5,0.5>;
#declare D2= <0.5,2.5,0.5>;
#declare E2= <-0.5,2.5,0.5>;
#declare F2= <-1.5,2.5,0.5>;
#declare G2= <-2.5,2.5,0.5>;
#declare H2= <-3.5,2.5,0.5>; 
                             
           // noir                     
#declare A7= <3.5,-2.5,0.5>;
#declare B7= <2.5,-2.5,0.5>;
#declare C7= <1.5,-2.5,0.5>;
#declare D7= <0.5,-2.5,0.5>;
#declare E7= <-0.5,-2.5,0.5>;
#declare F7= <-1.5,-2.5,0.5>;
#declare G7= <-2.5,-2.5,0.5>;
#declare H7= <-3.5,-2.5,0.5>;   
             
             
             
             
             
             
             
        // Animation , pion blanc vertical 2 cases  ( tour n°1)
                    
        #if ((clock>=0.5)&(clock<1))                          // le pion se lève pour commencer l'animation
        #declare A2= <3.5,2.5,0.7>;
        #end   
                                  
        #if ((clock>=1)&(clock<3))                             // le pion avance de 2 cases
          
       #declare A2= <3.5,2.5-clock+1,0.7>;
        
        #end 
        
        #if (clock>=3)                                        // le pion se pose sur la case après le déplacement
        #declare A2= <3.5,0.5,0.5>; 
        #end                        
        
         // Animation , pion noir vertical 1 case        ( tour n°2
                    
        #if ((clock>=4.5)&(clock<5))                          // le pion se lève pour commencer l'animation
        #declare D7= <0.5,-2.5,0.7>;
        #end   
                                  
        #if ((clock>=5)&(clock<6))                             // le pion avance de 1 case
        #declare D7= <0.5,-2.5+clock-5,0.7>;     
        #end 
        
        #if (clock>=6)                                        // le pion se pose sur la case après le déplacement
        #declare D7= <0.5,-1.5,0.5>; 
        #end 
        
        
          
        // initialisation des pions à leurs cases avec leurs couleur  
        //blanc  
pion(A2,b) 
pion(B2,b)
pion(C2,b)
pion(D2,b)
pion(E2,b)
pion(F2,b)
pion(G2,b)
pion(H2,b) 
        //noir
pion(A7,n) 
pion(B7,n)
pion(C7,n)                               
pion(D7,n)
pion(E7,n)
pion(F7,n)
pion(G7,n)
pion(H7,n)                


 




                      
   // --------------------------------------------------------------------------------------------                   
                      
                                
           
        
           
           
           // FOU
                                
#macro fou(caz,couleur,rotat)
union{  
    blob {  
        threshold 1                                 // Blob suppérieur 
            sphere {<0,0,3.3>,0.2,1} 
        cylinder{<0,0,3.5>,<0,0,0>,1,1}  
        scale <1.2,0,0>
        sturm true
        hierarchy true
    }              
    
    
    
    
    difference { 
    blob {
        threshold 1                                      // Blob " tête "
        sphere {<0,0,2.3>,1,1}
        cylinder{<0,0,2.9>,<0,0,3>,1,1}
        sturm true
        hierarchy true
    }    
           box{                                 
  <0.45, 0.2, 2.6> <-0.45,0.26,3.3>                                  
   }       
      }
           
           
           
      
        difference {
    
    blob {
        threshold 1                                     // blob  " corp "
        sphere {<0,0,0.22>,3,1.035}
        cylinder{<0,0,2.04>,<0,0,0>,1/3,1}
        sturm true
        hierarchy true
    }  
        box {<1,1,0>,<-1,-1,-0.5>                           
    }     
               }
               
               
               
               
               
       
    blob {
        threshold 1
        sphere {<0,0,0>,1.2,1}                          // blob " pied "
        cylinder {<0,0,0>, <0,0,1>,1,1}
        scale <0,0,0.2>
        sturm false
        hierarchy false     
        } 
        
        box {<1,1,0>,<1,1,-0.5>               
    } 
    
    pigment{color couleur}                       // paramètres de couleur,rotation et positionement
    rotate (rotat)     
    scale 0.5
    translate<caz.x,caz.y,caz.z>      
}           
                                        
  #end   // fin macro FOU
                              
                              
                                      
                                      
                                      
                                      
                                      
          // coordonées de cases pour les fous                          
                                   
 #declare C1= <1.5,3.5,0.5>;                // noir
 #declare F1= <-1.5,3.5,0.5>;  
 
 
 #declare C8= <1.5,-3.5,0.5>;              // blanc
 #declare F8= <-1.5,-3.5,0.5>;              
                                                   
                                                   
               
               
                                                   
                              
     // animation fou ( tour n°4 )
      
      #if (clock>18)                                     // début de l'animation après le tour n° 3
                          
      #declare C8= <1.5,-3.5,1>;                         // la pièce monte à partir de sa place initiale
                                
     #end
      
                      
     #if ((clock>=19)&(clock<22))
                                                            // déplacement en diagonale une fois que la pièce est levée
      #declare C8= <1.5-clock+19,-3.5+clock-19,1>;                    
                                
     #end
     
      
      #if (clock>22)                                       // la pièce se postionne sur la case après le déplacement en diagonale
                          
      #declare C8= <-1.5,-0.5,0.5>;                    
                                
     #end                                       
                                                   
                                                   
                                
          // initialisation des fous à leurs cases avec leurs couleur et leurs rotation  
                             
fou(C1,b,<0,0,180>)                        // noir
fou(F1,b,<0,0,180>)
                              
fou(C8,n,0)                                // blanc
fou(F8,n,0)   
                                
                                
                                
                                
                                
                                
                                
  
  
  
 // -------------------------------------------------------------------------------------------- 
  
  

  
                
                
                
                
                                
                                
                                
                                
               // TOUR                 
                                
                                
 #macro tour(caz,couleur)         
                                     
                                     
                                     
   #macro croixdiff (rotat,couleur)         // macro génération de box pour créer la muraille                
                                              
    box{
  <-0.57, -0.09, 0.95> <0.57,0.05,1.3>   
  rotate rotat
  pigment{color couleur} }
  #end                                                                 
        
        
        
        
           // MURAILLE
                                   
  union {                              
  difference {
  
   cylinder{<0,0,0.80>,<0,0,1.2>,0.56 
pigment{color couleur}}                        // création d'un cylindre à lequel on soustrait une étoile (*) faite de 4 box 
          
   croixdiff   (<0,0,0>,couleur)     
   croixdiff   (<0,0,90>,couleur)       
   croixdiff   (<0,0,-45>,couleur)
   croixdiff   (<0,0,45>,couleur) 
    
                                               // on soustrait un autre cylindre plus petit à celui de base pour créer l'espace en forme de cercle
  cylinder{<0,0,0.95>,<0,0,1.3>,0.38 
pigment{color couleur}}
              }
    
                        
                       
                        
              
                        
    
                           // MILLIEU   
 cylinder{<0,0,-0.55>,<0,0,0.8>,0.33
pigment{color couleur}}
    
   
    
    
    // PARTIE DU BAS  + 1/2 Haut ( sous muraille)       
              
difference {

intersection{
box{
  <-2, -2, -2> <2,2,2>
} 
quadric{
<1,1,-1/4>,<0,0,0>,<0,0,0>,-1
} //fin quadrique
           scale 0.4                                                            
}                                            
cylinder{<0,0,-0.55>,<0,0,0.55>,0.7 
pigment{color couleur}}                   
}                       

             
             
             
pigment{color couleur}                               // paramètres de couleur,rotation et positionement
    rotate<0,0,0>     
    scale 0.7
    translate<caz.x,caz.y,0.5+caz.z>
                           
}

    #end                
            
             
             
              // coordonées de cases pour les tours  
              
   #declare A1= <3.5,3.5,0.5>;             // noir
   #declare H1= <-3.5,3.5,0.5>;
   
   #declare A8= <3.5,-3.5,0.5>;            // blanc
   #declare H8= <-3.5,-3.5,0.5>;                     
   
   
             
              
              
              
              // initialisation des tours à leurs cases avec leurs couleur 
              
   tour(A1,b)
   tour(H1,b)
   
   tour(A8,n)
   tour(H8,n)     
   
   
              
              
              
              
              
              
              
 // --------------------------------------------------------------------------------------------  
   
   
   
         
         
         
         
         
         
         
         
                 
                 
  #macro reine(caz,couleur)
union{
    
    lathe {bezier_spline 4,<0.6,7> <1.5,7> <1.5,9> <0,9>}     //tête
    lathe {bezier_spline 4,<1.2,7> <2,8> <1,8> <0.5,8>}       //anneau sous tête
    lathe {bezier_spline 4,<2,0.5> <2,2.5> <0.3,1> <1,8>}     // corp
             
             
                      
                      // courrone de reine
                      
    cone {<0,7.5,0.75> 0.3 <0,9.5,2> 0}
    cone {<0,7.5,-0.75> 0.3 <0,9.5,-2> 0}                     // cones dans les coins 
    cone {<0.75,7.5,0> 0.3 <2,9.5,0> 0}
    cone {<-0.75,7.5,0> 0.3 <-2,9.5,0> 0} 
    
    cone {<0.75,8,-0.75> 0.2 <2,9.5,-2> 0}                    // cones de chaque cotés
    cone {<-0.75,8,0.75> 0.2 <-2,9.5,2> 0}                    
    cone {<-0.75,8,-0.75> 0.2 <-2,9.5,-2> 0}
    cone {<0.75,8,0.75> 0.2 <2,9.5,2> 0}   
    
    sphere {<0,9.3,0> 0.3}   // dessus de courrone
                       
                       
                       
    
    pigment {color couleur}                                // paramètres de couleur,rotation et positionement
    rotate<90,0,0>
    scale 0.2
    translate<caz.x,caz.y,caz.z> 
    }
    #end                     
    
            // coordonées de cases pour les reines
    
   #declare D1= <0.5,3.5,0.5>;    // blanc
   #declare D8= <0.5,-3.5,0.5>;   // noir
   
            // initialisation des reines à leurs cases avec leurs couleur 
   reine(D1,b)                    // blanc
   reine(D8,n)                    // noir
   
   
    
    
    
         
         
         
         
         
         
         
         
         
         
  // --------------------------------------------------------------------------------------------  
    
          
          
          
          
          
          
          
          
          
    
    
    #macro roi(caz,couleur)
union{
    
    lathe {bezier_spline 4,<0.6,7> <1.5,9.2> <3,9.5> <0,9.5>}    // tête
    lathe {bezier_spline 4,<1.2,7.6> <2,8> <1,8> <0.5,8>}        // anneau sous tête
    lathe {bezier_spline 4,<2,0.5> <2,2.5> <0.3,1> <1,8>}        // corp
             
             
                       // croix de courrone
                       
     box{                                 
  <0.35, 0.35, 9> <-0.35,-0.35,11.5>       // barre verticale
  rotate <-90,0,0> }
  
  box{                                   
  <0.70, 0.35, 10.5> <-0.70,-0.35,11>      // barre horizontale 
  rotate <-90,0,0> }
                       
                       
                       
    
    pigment {color couleur}                        // paramètres de couleur,rotation et positionement
    rotate<90,0,0>
    scale 0.2
    translate<caz.x,caz.y,caz.z> 
    }
    #end         
                                
                                
                                
                                
                // coordonées de cases pour les rois           
   #declare E1= <-0.5,3.5,0.5>;       //blanc
   #declare E8= <-0.5,-3.5,0.5>;      //noir
   
     
                    // initialisation des rois à leurs cases avec leurs couleur 
   roi(E1,b)        // blanc
   roi(E8,n)        // noir
                  
    
    
    
    
    
    
    
    
                  
                  
  // --------------------------------------------------------------------------------------------
  
  
  
  
  
  
  
  
  
                  
                  
   
   
                    // CAVALIER
                    
   #macro cavalier(caz,couleur,rotat)
union{
    
    
    
    lathe {bezier_spline 4,<2,0.5> <2,2.5> <0.3,1> <1,8>}     // corp         
    
      
        cone {<-0.75,9.5,-0.75> 0.5 <-1.3,10.5,-1.3> 0}       // oreille droite
    cone {<0.75,9.5,0.75> 0.5 <1.3,10.5,1.3> 0}               // oreille gauche
    
      // TÊTE
      
       
      
    
            
       sphere {<0.5,9.7,-1.5>0.32}  // oeil droite
       sphere {<1.5,9.7,-0.5>0.32}  // oeil gauche     
       
          
        blob {
        threshold 4                         // tête   + museau 
        sphere {<0.2,8.9,-0.2> 2.6,10}
        sphere {<1.5,8.4,-1.5> 1.8,6} 
        sphere {<1.7,8.2,-1.7> 1.3,6}  
        sturm true
        hierarchy true      
        
    }      
             
    
               
  
  cone {<-0.75,8,0.75> 0.2 <-2,9.5,2> 0}
  cone {<-0.75,8,0.75> 0.2 <-1.8,11,1.8> 0}           // crinière de bas en haut
  cone {<-0.75,8,0.75> 0.2 <-1.5,11.5,1.5> 0}
  cone {<-0.75,8,0.75> 0.2 <-1.,11.7,1.> 0} 
  cone {<-0.75,8,0.75> 0.2 <-0.75,11.7,0.75> 0}
  cone {<-0.75,8,0.75> 0.2 <-0.5,11.7,0.5> 0}
  cone {<-0.75,8,0.75> 0.2 <-0.25,11.7,0.25> 0}                    
                       
                       
    
    pigment {color couleur}
    rotate (rotat)                               // paramètres de couleur,rotation et positionement
    scale 0.15
    translate<caz.x,caz.y,caz.z> 
    }
    #end  
    
    
    
    
    
    
    
    
    
    
    
    
    
       #macro cavalierbl ()             // macro similaire de la macro de cavalier adaptée à l'animation du cavalier blanc B1
       union{
    
    lathe {bezier_spline 4,<2,0.5> <2,2.5> <0.3,1> <1,8>}     // corp         
    
      
        cone {<-0.75,9.5,-0.75> 0.5 <-1.3,10.5,-1.3> 0}       // oreille droite
    cone {<0.75,9.5,0.75> 0.5 <1.3,10.5,1.3> 0}               // oreille gauche
    
      // TÊTE
      
     
            
       sphere {<0.5,9.7,-1.5>0.32}  // oeil droite
       sphere {<1.5,9.7,-0.5>0.32}  // oeil gauche     
       
          
        blob {
        threshold 4                         // tête   + museau 
        sphere {<0.2,8.9,-0.2> 2.6,10}
        sphere {<1.5,8.4,-1.5> 1.8,6} 
        sphere {<1.7,8.2,-1.7> 1.3,6}  
        sturm true
        hierarchy true      
        
    }      
             
    
               
  
  cone {<-0.75,8,0.75> 0.2 <-2,9.5,2> 0}
  cone {<-0.75,8,0.75> 0.2 <-1.8,11,1.8> 0}           // crinière de bas en haut
  cone {<-0.75,8,0.75> 0.2 <-1.5,11.5,1.5> 0}
  cone {<-0.75,8,0.75> 0.2 <-1.,11.7,1.> 0} 
  cone {<-0.75,8,0.75> 0.2 <-0.75,11.7,0.75> 0}
  cone {<-0.75,8,0.75> 0.2 <-0.5,11.7,0.5> 0}
  cone {<-0.75,8,0.75> 0.2 <-0.25,11.7,0.25> 0}                    
                       
                       
    
    pigment {color b}
    rotate <90,0,-135>                              // paramètres de couleur,rotation et positionement
    scale 0.15   
    translate  <0,0,0>
  
    }
    #end 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
    
                          // coordonées de cases pour les cavaliers
                          
    #declare B1= <2.5,3.5,0.5>;           // blanc
     #declare G1= <-2.5,3.5,0.5>;   
     
      #declare B8= <2.5,-3.5,0.5>;          // noir
       #declare G8= <-2.5,-3.5,0.5>;                 
                    
                    
                   
                            
                          // initialisation des cavaliers à leurs cases avec leurs couleur et leurs rotation  
                                
     cavalier(G1,b,<90,0,-135>)  // blanc
     
     cavalier(B8,n,<90,0,45>)    // noir
     cavalier(G8,n,<90,0,45>)                 
                    
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         // animation cavalier     ( tour n° 3 )
                         
                         
                                                     
         
           #if(clock<7)                           // génération de la pièce à son emplacement de départ 
          cavalier(B1,b,<90,0,-135>)
          #end 
                          
           #if (clock>7)                           // démarrage de l'animation on fois que la clock est > à 7 ( après le tour n° 2 )
          #declare splineL =                       // utilisation de courbe pour déplacement de la pièce
          spline { natural_spline  
          
        0.0,<2.5,3.5,0.5>, 
               
       -0.2,<2.5,3.5,1.7>, 
        0.0,<2.5,3.0,1.7>,
        0.2,<2.5,2.5,1.7>, 
        0.4,<2.5,2.0,1.7>, 
        0.6,<2.5,1.5,0.5>, 
        
        
        0.8,<2.0,1.5,1.7>,
         
        1.0,<1.5,1.5,0.5>  
        }
        
        object{ cavalierbl  ()
        translate splineL((clock-7)/10)           //translate des coordonées de la pièce à chaque tour d'horloge pour créer le déplacement
        
        }
        #end
                                  
      
        
                 
                            
                         
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
       
                                                            