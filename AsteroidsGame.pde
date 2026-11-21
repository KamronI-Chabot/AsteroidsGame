Spaceship ship;
Star[] stars;
ArrayList<Asteroid> rocks = new ArrayList<Asteroid>();

public void setup()
{
  size(500, 500);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
  for (int i = 0; i < 10; i++)
  {
    rocks.add(new Asteroid());
  }
}

public void draw()
{
  background(8, 8, 35);
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].show();
  }
  for (int i = rocks.size() - 1; i >= 0; i--)
  {
    Asteroid a = rocks.get(i);
    float d = dist((float)ship.getX(), (float)ship.getY(), (float)a.getX(), (float)a.getY());
    if (d < a.getSize() + 10)
    {
      rocks.remove(i);
    }
    else
    {
      a.move();
      a.show();
    }
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
