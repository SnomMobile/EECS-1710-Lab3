Person guy;
Slime slime;
boolean action = false;
int timer = 0;
PImage background;
char recent;
Boolean interact = true;

float slimex;
float slimey;
float skellx;
float skelly;

int skeledelay = 0;
int slimedelay = 0;
void setup()
{
  size(800,600,P2D);
  guy = new Person();
  slime = new Slime();
  guy.display();
  background = loadImage("bg.png");
}

void draw()
{
  if(action == false)
  {
    guy.look();
    action = true;
    timer = 0;
  }
  background(background);
  if (keyPressed)
  {
    recent = key;
  }
  
  if(timer < 150)
  {
    guy.move(); 
  }
  time();
  if(interact == false)
  {
    slime.animate();
    skellx = guy.getX();
    skelly = guy.getY();
    if (dist(skellx,skelly,slimex,slimey)<25)
    {
      if(skeledelay != 21)
      {
        background(background);
        guy.kill();
        slime.animate();
        skeledelay++;
      }
      if(skeledelay == 21 && slimedelay != 6)
      {
        background(background);
        slime.perish();
        guy.lazy();
        slimedelay++;
      }
      if(skeledelay == 21 && slimedelay == 6)
      {
        timer = 300;
        guy.lazy();
        interact = true;
      }
    }
  }
}
void time()
{
  timer++;
  if(timer >= 150 && timer<550)
  {
    guy.lazy();
  }
  if (timer>=550)
  {
    action = false;
  }
}
void mouseClicked()
{
  if (recent == '0')
  {
    action = true;
    timer = 0;
    guy.walkto(mouseX, mouseY);
  }
  if (recent == '1')
  {
    action = true;
    timer = 0;
    guy.walkto(mouseX-15,mouseY-9);
    slime.summon();
    slimex = slime.getX();
    slimey = slime.getY();
    skeledelay = 0;
    slimedelay = 0;
    interact = false;
  }
}
