class Sound
{
  AudioPlayer sound;
  Sound(String soundFile)
  {
    AudioPlayer newSound =   minim.loadFile(soundFile);
    this.sound = newSound;
  }
  
  void playSound()
  {
    sound.rewind();
    sound.play();
    played = true;
  }
  
  void lowerVolume()
  {
    sound.setGain(-20);
  }
  
  boolean isPlaying()
  {
    if(sound.isPlaying())
    {
      return true;
    }
    return false;
  }
  
  void stopPlayback()
  {
    if(sound.isPlaying())
    {
      sound.pause();
    }  
  }
}