import processing.opengl.*;
float r = 8;
float fr = 20;
PImage tex;
float bg = 255;

void setup()
{
  //frameRate(fr);
  size(512, 512, OPENGL);
  background(bg);
  tex = get();
}

void draw()
{
  background(bg);
  directionalLight(0, 0, 0, -1, 0, 0);
  lights();  
  camera(-25, -25, 1.5, 0, 0, 0, 0, 1, 0);
  
  translate(512/2,512/2);
  rotateY((r)/10);
  rotateZ((r)/3);
  cube(200);
  translate(-512/2,-512/2);
  
  r += PI / fr;
  tex = get();
}

void cube(float sz)
{
  cubeFace(sz);
  rotateX(PI/2);
  cubeFace(sz);
  rotateX(PI/2);
  cubeFace(sz);
  rotateX(PI/2);
  cubeFace(sz);
  rotateY(PI/2);
  cubeFace(sz);
  rotateY(PI);
  cubeFace(sz);
}

void cubeFace(float sz)
{
  noStroke();
  beginShape(QUADS);
  texture(tex);
  vertex(0 - sz / 2, 0 - sz / 2, 0 - sz / 2, 0, 0);
  vertex(0 + sz / 2, 0 - sz / 2, 0 - sz / 2, tex.height, 0);
  vertex(0 + sz / 2, 0 + sz / 2, 0 - sz / 2, tex.height, tex.width);
  vertex(0 - sz / 2, 0 + sz / 2, 0 - sz / 2, 0, tex.width);
  endShape(CLOSE);
}


