class cancion {
  
  cancion(PImage imagen, int pista, int can, SoundFile musica, Amplitude rms, String songname){
    
  if (pista == can && musica.isPlaying()){  
    text(songname,width/2,40);
     
  sum += (rms.analyze() - sum) * smoothingFactor;
  float rms_scaled = sum * (height/2) * 2;  
  
  image(imagen, width/2-170, height/2+50, rms_scaled, rms_scaled );
  
  }else if (pista == can){
  musica.play();
  
  sum += (rms.analyze() - sum) * smoothingFactor;
  float rms_scaled = sum * (height/2) * 2;  
  image(imagen, width/2-170, height/2+50, rms_scaled, rms_scaled );
  
  }else{
  musica.stop();  
  }
  }
}
