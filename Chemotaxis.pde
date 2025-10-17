//declare bacteria variables here
Bacteria[] paint = new Bacteria[50];
int hue;

void setup()
{     
  //initialize bacteria variables here
  size(500,500);
  noStroke();
  colorMode(HSB,360,100,100,100);
  background(0,0,100);
  for(int i = 0; i < paint.length; i++){
    hue = color(210,100,100,100);
    paint[i] = new Bacteria(5+i*10,250);
  }
}
 
void draw()
{    
  //move and show the bacteria
  for(int i = 0; i < paint.length; i++){
    if(mousePressed && (mouseButton == LEFT)){
      paint[i].attract();
    }
    else{
      paint[i].rndWalk();
    }
    paint[i].show();
  }
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
  
  Bacteria(float xx,float yy){
    x = xx;
    y = yy;
    c = hue;
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
