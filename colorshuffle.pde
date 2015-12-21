int[] changed;

void colorShuffle() {
  int n_ind,m_ind;
  float old_n_dist,old_m_dist,new_n_dist,new_m_dist;
  color n,m;
  loadPixels();
  n_ind = int(random(0,pixels.length));
  m_ind = int(random(0,pixels.length));
  n = pixels[n_ind];
  m = pixels[m_ind];
  old_n_dist = cDist(n,pixels[n_ind-1])+cDist(n,pixels[n_ind+1]);
  new_n_dist = cDist(n,pixels[m_ind-1])+cDist(n,pixels[m_ind+1]);
  old_m_dist = cDist(m,pixels[m_ind-1])+cDist(m,pixels[m_ind+1]);
  new_m_dist = cDist(m,pixels[n_ind-1])+cDist(m,pixels[n_ind+1]);
  if ((old_n_dist+old_m_dist)<(new_n_dist+new_m_dist)) {
    for (int i=0;i<pixels.length;i+=1) {
      if (changed[i]==0) {
        if (cDist(n,pixels[i])<5) {
          pixels[i]=m;
          changed[i]=1;
        }
        if (cDist(m,pixels[i])<5) {
          pixels[i]=n;
          changed[i]=1;
        }
      }
    }
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

void draw() {
  colorShuffle();
  println(frameCount);
}

void setup() {
  //size(630,433);
  //size(770,513);
  size(885,497);
  colorMode(RGB,255,255,255);
  changed = new int[width*height];
  for (int i=0;i<width*height;i++) {
    changed[i]=0;
  }
  PImage img;
  //img = loadImage("sundown.jpg");
  //img = loadImage("flag.png");
  img = loadImage("bugs.jpg");
  image(img,0,0);
}