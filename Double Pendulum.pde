float x1,y1,x2,y2,X1,Y1,X2,Y2;
float l=100;
float m=0.001;
float theta1=PI/4, theta2=PI/4,THETA1=PI/4,THETA2=PI/4;
float v1=0, v2=0.5, V1=0, V2=0.501;
float a1, a2, A1=0, A2=0;
float dt=0.1;
float g=10;

PGraphics canvas;

void plot()
{
    x1=l*sin(theta1);
    y1=l*cos(theta1);
    
    x2=l*(sin(theta1)+sin(theta2));
    y2=l*(cos(theta1)+cos(theta2));

    fill(0);
    line(0,0,x1,y1);
    ellipse(x1,y1,16,16);
    
    line(x1,y1,x2,y2);
    ellipse(x2,y2,16,16);

    X1=l*sin(THETA1);
    Y1=l*cos(THETA1);
    
    X2=l*(sin(THETA1)+sin(THETA2));
    Y2=l*(cos(THETA1)+cos(THETA2));  

    fill(180);

    line(0,0,X1,Y1);
    ellipse(X1,Y1,16,16);
    
    line(X1,Y1,X2,Y2);
    ellipse(X2,Y2,16,16);
    
}

void setup()
{
   size(600,600);
   canvas=createGraphics(600,600);
   canvas.beginDraw();
   canvas.background(255);
   canvas.endDraw();
}

void draw()
{
   background(255);
   
    image(canvas,0,0);
    stroke(0);
   strokeWeight(2);
    
   translate(300,250);
    
     plot();
    
    theta1+=v1*dt;
    theta2+=v2*dt;
     
            
    THETA1+=V1*dt;
    THETA2+=V2*dt;
            
  //   plot();
      
        //a1=(  l*sin(theta1-theta2)*(v1*v1*cos(theta1-theta2)+v2*v2) + g*(2*sin(theta1)-sin(theta2)*cos(theta1-theta2) )) /  (l*cos(theta1-theta2)*cos(theta1-theta2)-2*l)  ;
        //a2=(  l*sin(theta1-theta2)*(2*v1*v1+v2*v2*cos(theta1-theta2)) -2*g*(sin(theta2)-sin(theta1)*cos(theta1-theta2))) /  (l+l*sin(theta1-theta2)*sin(theta1-theta2))    ;
         
      a1=(  -g*(3*sin(theta1)+sin(theta1-2*theta2))-2*l*sin(theta1-theta2)*(v2*v2+v1*v1*cos(theta1-theta2))  ) / (l*(2+2*sin(theta1-theta2)*sin(theta1-theta2))); 
      a2=(  2*sin(theta1-theta2)*(2*l*v1*v1 +2*g*cos(theta1) + v2*v2*l*cos(theta1-theta2)  )  )/ (l*(2+2*sin(theta1-theta2)*sin(theta1-theta2)));
      
      //  A1=(  l*sin(THETA1-THETA2)*(V1*V1*cos(THETA1-THETA2)+v2*v2) + g*(2*sin(THETA1)-sin(THETA2)*cos(THETA1-THETA2) )) /  (l*cos(THETA1-THETA2)*cos(THETA1-THETA2)-2*l)  ;
      //  A2=(  l*sin(THETA1-THETA2)*(2*V1*V1+V2*V2*cos(THETA1-THETA2)) -2*g*(sin(THETA2)-sin(THETA1)*cos(THETA1-THETA2))) /  (l+l*sin(THETA1-THETA2)*sin(THETA1-THETA2))    ;
      
      
      A1=(  -g*(3*sin(THETA1)+sin(THETA1-2*THETA2))-2*l*sin(THETA1-THETA2)*(V2*V2+V1*V1*cos(THETA1-THETA2))  ) / (l*(2+2*sin(THETA1-THETA2)*sin(THETA1-THETA2))); 
      A2=(  2*sin(THETA1-THETA2)*(2*l*V1*V1 +2*g*cos(THETA1) + V2*V2*l*cos(THETA1-THETA2)  )  )/ (l*(2+2*sin(THETA1-THETA2)*sin(THETA1-THETA2)));

           
      v1+=a1*dt;
      v2+=a2*dt;
      
      
      V1+=A1*dt;
      V2+=A2*dt;
    
          
      float TE1= 0.5*m*l*l*(2*v1*v1+v2*v2+2*v1*v2*cos(theta1-theta2)) + m*g*l*(2*cos(theta1-theta2));
      float TE2= 0.5*m*l*l*(2*V1*V1+V2*V2+2*V1*V2*cos(THETA1-THETA2)) + m*g*l*(2*cos(THETA1-THETA2));
      println(TE1);
      print("\t");
      println(TE2);
      
      
     canvas=createGraphics(600,600);
     canvas.beginDraw();
     canvas.background(255);
     canvas.point(x2,y2);  
     canvas.endDraw();
  
}
    
    
    
