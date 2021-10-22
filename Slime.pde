class Slime
{
  float posx;
  float posy;
  Boolean ouchie = false;
  Animation slime;
  Animation slimedeath;
  Slime()
  {
    slime = new Animation("slime_",6);
    slimedeath = new Animation("slimedeath_",6);
  }
  void summon()
  {
    posx = mouseX;
    posy = mouseY;
    slime.display(posx,posy);
  }
  void animate()
  {
    slime.display(posx,posy);
  }
  float getX()
  {
    return posx;
  }
  float getY()
  {
    return posy;
  }
  void perish()
  {
      slimedeath.display(posx,posy);
  }
}

//"borrowed" this slime thingamadoohicker from https://ivess.itch.io/slime-animations-pack
