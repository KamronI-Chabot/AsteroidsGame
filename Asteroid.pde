class Asteroid extends Floater
{
  private double myRotSpeed;
  private int mySize;
  private int[] craterX, craterY, craterSize;

  public Asteroid()
  {
    mySize = (int)(Math.random() * 14) + 10;
    corners = (int)(Math.random() * 5) + 7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < corners; i++)
    {
      double angle = i * 2 * Math.PI / corners;
      double r = mySize * (0.7 + Math.random() * 0.5);
      xCorners[i] = (int)(r * Math.cos(angle));
      yCorners[i] = (int)(r * Math.sin(angle));
    }

    int pick = (int)(Math.random() * 3);
    if (pick == 0) myColor = color(150, 150, 155);
    else if (pick == 1) myColor = color(140, 105, 75);
    else myColor = color(160, 85, 65);

    craterX = new int[3];
    craterY = new int[3];
    craterSize = new int[3];
    for (int i = 0; i < 3; i++)
    {
      craterX[i] = (int)(Math.random() * mySize) - mySize / 2;
      craterY[i] = (int)(Math.random() * mySize) - mySize / 2;
      craterSize[i] = (int)(Math.random() * mySize / 3) + 3;
    }

    if (Math.random() < 0.5) myCenterX = Math.random() * 150;
    else myCenterX = 350 + Math.random() * 150;
    myCenterY = Math.random() * 500;
    myXspeed = Math.random() * 2 - 1;
    myYspeed = Math.random() * 2 - 1;
    myPointDirection = Math.random() * 360;
    myRotSpeed = Math.random() * 4 - 2;
  }

  public void move()
  {
    turn(myRotSpeed);
    super.move();
  }

  public void show()
  {
    float dRadians = (float)(myPointDirection * (Math.PI / 180));
    translate((float)myCenterX, (float)myCenterY);
    rotate(dRadians);

    fill(myColor);
    noStroke();
    beginShape();
    for (int i = 0; i < corners; i++)
    {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);

    fill(0, 0, 0, 70);
    for (int i = 0; i < 3; i++)
    {
      ellipse(craterX[i], craterY[i], craterSize[i], craterSize[i]);
    }

    rotate(-1 * dRadians);
    translate(-1 * (float)myCenterX, -1 * (float)myCenterY);
  }

  public double getX()
  {
    return myCenterX;
  }

  public double getY()
  {
    return myCenterY;
  }

  public int getSize()
  {
    return mySize;
  }
}
