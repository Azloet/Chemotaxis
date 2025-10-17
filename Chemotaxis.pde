//declare bacteria variables here

void setup()
{     
  //initialize bacteria variables here
  size(500,500);
}
 
void draw()
{    
  background(100,100,100);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  int temp = (int)(hue(hue)-e*10)%360;
  if(temp<0){
    temp+=360;
  }
  hue = color(temp,saturation(hue),brightness(hue),alpha(hue));
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
