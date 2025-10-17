//declare bacteria variables here
Bacteria[] paint = new Bacteria[50];
int hue;
int saturation;
int brightness;
int alpha;
int colour;

void setup()
{     
  //initialize bacteria variables here
  size(500,500);
  noStroke();
  colorMode(HSB,360,100,100,100);
  background(0,0,0);
  hue = 210;
  saturation = 100;
  brightness = 100;
  alpha = 100;
  for(int i = 0; i < paint.length; i++){
    colour = color(hue,saturation,brightness,alpha);
    paint[i] = new Bacteria(5+i*10,250,colour);
  }
}
 
void draw()
{    
  //move and show the bacteria
  for(int i = 0; i < paint.length; i++){
    if(mousePressed && (mouseButton == RIGHT)){
      saturation = mouseX/5;
      brightness = (500-mouseY)/5;
    }
    if(mousePressed && (mouseButton == LEFT)){
      paint[i].attract();
    }
    else{
      paint[i].rndWalk();
    }
    colour = color(hue,saturation,brightness,alpha);
    paint[i].c = colour;
    paint[i].show();
  }
}

void mouseWheel() {
  hue = (hue+10)%360;
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
    ellipse(x,y,10,10);
  }
}
