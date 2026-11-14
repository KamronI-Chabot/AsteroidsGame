class Star
{
  private int myX, myY, mySize;
  private int myR, myG, myB;
  private double myPhase;

  public Star()
  {
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);
    mySize = (int)(Math.random() * 3) + 1;
    myPhase = Math.random() * 6.28;
    int pick = (int)(Math.random() * 3);
    if (pick == 0)
    {
      myR = 255;
      myG = 255;
      myB = 255;
    }
    else if (pick == 1)
    {
      myR = 170;
      myG = 200;
      myB = 255;
    }
    else
    {
      myR = 255;
      myG = 240;
      myB = 180;
    }
  }

  public void show()
  {
    int alpha = (int)(180 + 75 * Math.sin(frameCount * 0.05 + myPhase));
    noStroke();
    fill(myR, myG, myB, alpha);
    ellipse(myX, myY, mySize, mySize);
  }
}
