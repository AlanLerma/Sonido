import processing.sound.*;     

cancion flor_danzante;

PImage B0, B1, B2, B3, B4, B5, B6, Flor1, Flor2, Flor3, Flor4, Flor5, Inst;
int frame = 0;
Amplitude rms1, rms2, rms3, rms4;
SoundFile musica1 , musica2, musica3, musica4;  
int pista = 0;
WhiteNoise noise;
float sum;
float smoothingFactor = 0.8;

void setup() {
  size(960, 540);    
  B0 = loadImage("1.jpg");
  B1 = loadImage("2.jpg");
  B2 = loadImage("3.jpg");
  B3 = loadImage("4.jpg");
  B4 = loadImage("5.jpg");
  B5 = loadImage("6.jpg");
  B6 = loadImage("7.jpg");
  Inst = loadImage("Instrucciones.png");  
  Flor1 = loadImage("flor.png");
  Flor2 = loadImage("flor2.png");
  Flor3 = loadImage("flor3.png");
  Flor4 = loadImage("flor4.png");
  Flor5 = loadImage("Inter.png");
  
  musica1 = new SoundFile(this,"mattdeguia-daylight.mp3");   
  rms1 = new Amplitude(this);
  rms1.input(musica1);
  
  musica2 = new SoundFile(this,"nvthvn-when-you-said-hi.mp3");   
  rms2 = new Amplitude(this);
  rms2.input(musica2);
  
  musica3 = new SoundFile(this,"soho-drifting.mp3");   
  rms3 = new Amplitude(this);
  rms3.input(musica3);
  
  musica4 = new SoundFile(this,"aimless-sailway.mp3");   
  rms4 = new Amplitude(this);
  rms4.input(musica4);
  
  noise = new WhiteNoise(this);
  
}

void draw() {
  scale(.75);
  imageMode(CORNER);
  if ( frame >= 0 && frame <=100){
  image(B0,0,0);
  }else if (frame <=200){
  image(B1,0,0);
  }else if (frame <=300){
  image(B2,0,0);
  }else if (frame <=400){
  image(B3,0,0);
  }else if (frame <=500){
  image(B4,0,0);
  }else if (frame <=600){
  image(B5,0,0);
  }else if (frame <=700){
  image(B6,0,0);
  }else if (frame > 700){
  frame = 0;
  }
  frame+=10;
  
  if (pista > 5){
    pista = 0;
  }
  if (pista <0){
    pista = 5;
  }
  
  
  
  float aleatorio = random(height-mouseY-40,height-mouseY); 
  imageMode(CENTER);
  textMode(CENTER);
  textSize(40);
  
  flor_danzante = new cancion(Flor1, pista, 1, musica1,rms1, "1.- Daylight");
  flor_danzante = new cancion(Flor2, pista, 2, musica2,rms2,"2.- When you said hi");
  flor_danzante = new cancion(Flor3, pista, 3, musica3,rms3,"3.- Drifting");
  flor_danzante = new cancion(Flor4, pista, 4, musica4,rms4,"4.- Sailway");
  
  
  if (pista == 5){
    text("5.- No signal",width/2,40);
  noise.play();
  noise.pan(map(mouseX, 0, width, -1.0, 1.0));
  noise.amp(map(mouseY, 0, height, 0.3, 0.0));
  image(Flor5, width/2-170, height/2+50,aleatorio,aleatorio);
  }else{
  noise.stop();
  }
  if (pista == 0){
  text("OFF",width/2+100,40);
  }
  
  scale(.60);
  image(Inst,1985,1100);
}

void keyPressed() {
    if (key == 'a') {
     pista --;
    }
    if (key == 'd') {
      pista ++;     
    }
}
