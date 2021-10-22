class Person
{
  float xpos;
  float ypos;
  float xend;
  float yend;
  PImage man = loadImage("Skeleton.png");
  Animation bonewalk;
  Animation bone;
  Animation kill;
  
  Person()
  {
    xpos = width/2;
    ypos = height/2;
    bonewalk = new Animation ("skeletonwalk_",13);
    bone = new Animation ("skeleton_",11);
    kill = new Animation ("skeletonkill_",21);
  }
  void display()
  {
    rectMode(CENTER);
    fill(255);
    smooth();
    image(man,xpos,ypos,25,35);
  }
  void look()
  {
    xend = int(random(15,width-15));
    yend = int(random(15,height-15));
  }
  void move()
  {
    rectMode(CENTER);
    fill(255);
    xpos = lerp(xpos,xend,0.025);
    ypos = lerp(ypos,yend,0.025);
    displayWalk();
  }
  void displayWalk()
  {
    bonewalk.display(xpos,ypos);
  }
  void lazy()
  {
    bone.display(xpos,ypos);
  }
  void walkto(int x, int y)
  {
    xend = x;
    yend = y;
  }
  float getX ()
  {
    return xpos;
  }
  float getY ()
  {
    return ypos;
  }
  void kill()
  {
      kill.display(xpos,ypos);
  }
}

//skeleton assets respectfully yoinked from https://jesse-m.itch.io/skeleton-pack
