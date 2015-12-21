int[] changed;
color[][] colorMap;

void colorShuffle(int n) {
  color old_color,new_color;
  boolean done = false;
  loadPixels();
  n = int(random(0,pixels.length));
  old_color = pixels[n];
    
  if (changed[n]==1) {
    done = true;
  }
    
  if (done==false) {
    for (int i=0;i<colorMap.length;i++) {
      if (cDist(old_color,colorMap[i][0])<5) {
        pixels[n]=colorMap[i][1];
        changed[n]=1;
        done = true;
        break;
      }
    }
  }
  
  if (done==false) {
   new_color = color(random(255),random(255),random(255));
   colorMap = (color[][])append(colorMap, new color[]{old_color,new_color});
   //colorMap[colorMap.length+1][0] = old_color;
   //colorMap[colorMap.length+1][1] = new_color;
   pixels[n] = new_color;
   changed[n] = 1;
  }
  
  updatePixels();
}

float cDist(color c1, color c2) {
  // Calculate the distance between two colors
  float r_dist,g_dist,b_dist;
  r_dist = abs(red(c1)-red(c2));
  g_dist = abs(green(c1)-green(c2));
  b_dist = abs(blue(c1)-blue(c2));
  return r_dist+g_dist+b_dist;
}

//void draw() {
//  colorShuffle();
//  println(frameCount);
//}

void setup() {
  //size(630,433);
  //size(770,513);
  size(885,497);
  colorMode(RGB,255,255,255);
  changed = new int[width*height];
  for (int i=0;i<width*height;i++) {
    changed[i]=0;
  }
  
  colorMap = new color[1][2];
  colorMap[0][0] = color(0,0,0);
  colorMap[0][1] = color(255,255,255);
  
  PImage img;
  //img = loadImage("sundown.jpg");
  //img = loadImage("flag.png");
  img = loadImage("bugs.jpg");
  image(img,0,0);
  
  for (int n=0;n<width*height;n++) {
    colorShuffle(n);
  }
}