//declare bacteria variables here

void setup()
{     
  //initialize bacteria variables here
  size(500,500);
  noStroke();
  colorMode(HSB,360,100,100,100);
}
 
void draw()
{    
  background(100,100,100);
}
 
class Bacteria
{     
  float x,y;
  int c;
  
  Bacteria(int xx,int yy,int cc){
    x = xx;
    y = yy;
    c = cc;
  }
  
  void attract(){
    if(abs(mouseX - x)<20){
      x += (mouseX - x)/10;
    }
    else{
      x += (mouseX - x)/50;
    }
    if(abs(mouseY - y)<20){
      y += (mouseY - y)/10;
    }
    else{
      y += (mouseY - y)/50;
    }
    x += (Math.random()-0.5)*10;
    y += (Math.random()-0.5)*10;
  }
  
  void rndWalk(){
    x += (Math.random()-0.5)*10;
    y += (Math.random()-0.5)*10;
  }
  
  void show(){
  fill(c);
    ellipse(x,y,size,size);
  }
}
