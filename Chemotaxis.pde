//declare bacteria variables here
Bacteria[] paint = new Bacteria[500/size];
int hue;

void setup()
{     
  //initialize bacteria variables here
  size(500,500);
  noStroke();
  colorMode(HSB,360,100,100,100);
  for(int i = 0; i < paint.length; i++){
    hue = color(210,100,100,1);
    paint[i] = new Bacteria(5+i*10,250,hue);
  }
}
 
void draw()
{    
  //move and show the bacteria
  for(int i = 0; i < paint.length; i++){
    if(mousePressed && (mouseButton == RIGHT)){
      hue = color(hue(hue),mouseX/5,(500-mouseY)/5,alpha(hue));
    }
    paint[i].c = hue;
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
