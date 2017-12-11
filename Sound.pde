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
  
  void stopPlayback()
  {
    if(sound.isPlaying())
    {
      sound.pause();
    }  
  }
}