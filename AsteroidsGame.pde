Spaceship ship;
Star[] stars;

public void setup()
{
  size(500, 500);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
}

public void draw()
{
  background(8, 8, 35);
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].show();
  }
  ship.move();
  ship.show();
}

public void keyPressed()
{
  if (key == 'a' || key == 'A')
  {
    ship.turn(-10);
  }
  if (key == 'd' || key == 'D')
  {
    ship.turn(10);
  }
  if (key == 'w' || key == 'W')
  {
    ship.accelerate(0.2);
  }
  if (key == 'h' || key == 'H')
  {
    ship.hyperspace();
  }
}
