class Spaceship extends Floater
{
  private int flameTimer;

  public Spaceship()
  {
    corners = 5;
    xCorners = new int[] {18, 8, -12, -12, 8};
    yCorners = new int[] {0, -5, -5, 5, 5};
    myColor = color(255);
    myCenterX = 250;
    myCenterY = 250;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    flameTimer = 0;
  }

  public void accelerate(double dAmount)
  {
    super.accelerate(dAmount);
    flameTimer = 6;
  }

  public double getX()
  {
    return myCenterX;
  }

  public double getY()
  {
    return myCenterY;
  }

  public void hyperspace()
  {
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = (int)(Math.random() * width);
    myCenterY = (int)(Math.random() * height);
    myPointDirection = (int)(Math.random() * 360);
    flameTimer = 0;
  }

  public void show()
  {
    float dRadians = (float)(myPointDirection * (Math.PI / 180));
    translate((float)myCenterX, (float)myCenterY);
    rotate(dRadians);

    if (flameTimer > 0)
    {
      float len = (float)(Math.random() * 8);
      noStroke();
      fill(255, 140, 0);
      triangle(-12, -4, -26 - len, 0, -12, 4);
      fill(255, 230, 0);
      triangle(-12, -2, -19 - len / 2, 0, -12, 2);
      flameTimer--;
    }

    fill(220, 30, 30);
    stroke(220, 30, 30);
    triangle(4, -5, -14, -13, -12, -5);
    triangle(4, 5, -14, 13, -12, 5);

    fill(myColor);
    stroke(myColor);
    beginShape();
    for (int i = 0; i < corners; i++)
    {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);

    fill(90, 190, 255);
    noStroke();
    ellipse(5, 0, 6, 5);

    rotate(-1 * dRadians);
    translate(-1 * (float)myCenterX, -1 * (float)myCenterY);
  }
}
