//declare bacteria variables here
int size = 10;
int hue;
Bacteria[] paint = new Bacteria[500/size];

 
void setup()
{     
  //initialize bacteria variables here
  size(500,500);
  noStroke();
  colorMode(HSB,360,100,100,100);
  hue = color(210,100,100,100);
  for(int i = 0; i < paint.length; i++){
    paint[i] = new Bacteria(size/2+i*size,250,hue);
  }
}
 
void draw()
{    
  //move and show the bacteria
  //background(0,0,50);
  for(int i = 0; i < paint.length; i++){
    if(mousePressed && (mouseButton == RIGHT)){
      hue = color(210,mouseX/5,(500-mouseY)/5,100);
      paint[i].c = hue;
    }
    if(mousePressed && (mouseButton == LEFT)){
      paint[i].blur();
    }
    else{
      //paint[i].focus(i);
    }
    paint[i].show();
  }
}
 
class Bacteria
{     
  int x,y,c;
  
  Bacteria(int xx,int yy,int cc){
    x = xx;
    y = yy;
    c = cc;
  }
  
  void blur(){
    x += (int)((Math.random()-0.5)*20);
    y += (int)((Math.random()-0.5)*20);
  }
  
  void focus(int i){
    if(x!=size/2+i*size){
      x += (int)((Math.random()-0.5)*10)+(size/2+i*size - x)/abs(size/2+i*size - x);
    }
    else if(y!=250){
      x += (int)((Math.random()-0.5)*10);
    }
    if(y!=250){
      y += (int)((Math.random()-0.5)*10)+(250 - y)/abs(250 - y);
    }
    else if(x!=size/2+i*size){
      y += (int)((Math.random()-0.5)*10);
    }
  }
  
  void show(){
  fill(c);
    ellipse(x,y,size,size);
  }
}
