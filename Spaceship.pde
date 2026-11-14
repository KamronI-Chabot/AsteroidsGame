class Spaceship extends Floater
{
  private int flameTimer;

  public Spaceship()
  {
    corners = 5;
    xCorners = new int[] {20, 10, -12, -12, 10};
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
    noStroke();

    if (flameTimer > 0)
    {
      fill(255, 140, 0);
      triangle(-15, -3, -27, 0, -15, 3);
      flameTimer--;
    }

    fill(90);
    rect(-15, -3, 3, 6);

    fill(220, 30, 30);
    triangle(4, -5, -14, -13, -12, -5);
    triangle(4, 5, -14, 13, -12, 5);

    fill(myColor);
    beginShape();
    for (int i = 0; i < corners; i++)
    {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);

    fill(220, 30, 30);
    triangle(20, 0, 14, -3, 14, 3);

    fill(120, 200, 255);
    ellipse(3, 0, 7, 7);

    rotate(-1 * dRadians);
    translate(-1 * (float)myCenterX, -1 * (float)myCenterY);
  }
}
