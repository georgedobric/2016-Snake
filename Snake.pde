class Snake
{
  int locationX;
  int locationY;
  int dir;
  color colour;
  int i;
  boolean dir1, dir2, dir3, dir4 = false;
  int howlongtail;
  /*** Snake ****************************************************************
  * Purpose: Initialize x & y location, direction, and colour of snake unit *
  * Parameters: x - x location of snake unit                                *
  *             y - y location of snake unit                                *
  *             direction - direction of snake unit                         *
  *             clr - colour of snake unit                                  *
  * Returns: none                                                           *
  ***************************************************************************/
  Snake (int x, int y, int direction, color clr)
  {
    locationX = x;
    locationY = y;
    dir = direction;
    colour = clr;
  }

  /*** display ******************************************
  * Purpose: Display snake unit                         *
  * Parameters: none                                    *
  * Returns: none                                       *
  ******************************************************/
  void display ()
  {
    fill (colour);
    rect (locationX, locationY, 10, 10);
  }

  /*** trailGrowth *************************************************************************************
  * Purpose: Manage X and Y location of tail snake units                                               * 
  * Parameters: num - the number of the snake unit in array                                            *
  *             clr - colour of snake unit                                                             *
  *             check1 - to check if last direction was up once the snake moves either left or right   *
  *             check2 - to check if last direction was down once the snake moves either left or right * 
  *             check3 - to check if last direction was left once the snake moves either up or down    *
  *             check4 - to check if last direction was right once the snake moves either up or down   *
  * Returns: none                                                                                      *
  ******************************************************************************************************/
  /*
  void trailGrowth (int num, color clr, boolean check1, boolean check2, boolean check3, boolean check4) {
    dir1 = check1;
    dir2 = check2;
    dir3 = check3;
    dir4 = check4;   
    i = num;
    colour = clr;
    fill (colour);
    if (dir == 1) {
      if (dir4 == true)
        trailX[i] = snakeX - (10 * i);
      else if (dir3 == true)
        trailX[i] = snakeX + (10 * i);
      do {
        if (dir4 == true) {
          trailX[i] += 1;
          //      rect (trailX[i], trailY[i], 10, 10);
        } else if (dir3 == true) {
          trailX[i] -= 1;
          //     rect (trailX[i], trailY[i], 10, 10);
        }          
        //     rect (trailX[i], trailY[i], 10, 10);
      } while (trailX[i] != snakeX); 
      if (trailX[i] == snakeX) {
        trailY[i] = snakeY + (10 * i);
      }
    } else if (dir == 2) { 
      if (dir4 == true)
        trailX[i] = snakeX - (10 * i);
      else if (dir3 == true)
        trailX[i] = snakeX + (10 * i);        
      do {
        if (dir4 == true) {
          trailX[i] += 1;
          //      rect (trailX[i], trailY[i], 10, 10);
        } else if (dir3 == true) {
          trailX[i] -= 1;
          //       rect (trailX[i], trailY[i], 10, 10);
        }                   
        //   rect (trailX[i], trailY[i], 10, 10);
      } while (trailX[i] != snakeX); 
      if (trailX[i] == snakeX) {
        trailY[i] = snakeY - (10 * i);
      }
    } else if (dir == 3) {     
      if (dir1 == true)
        trailY[i] = snakeY + (10 * i);
      else if (dir2 == true)
        trailY[i] = snakeY - (10 * i);           
      do {
        if (dir1 == true) {
          trailY[i] -= 1;
          //      rect (trailX[i], trailY[i], 10, 10);
        } else if (dir2 == true) {
          trailY[i] += 1;
          //     rect (trailX[i], trailY[i], 10, 10);
        }             
        //   rect (trailX[i], trailY[i], 10, 10);
      } while (trailY[i] != snakeY); 
      if (trailY[i] == snakeY) {
        trailX[i] = snakeX + (10 * i);
      }
    } else if (dir == 4) {  
      if (dir1 == true )
        trailY[i] = snakeY + (10 * i);
      else if (dir2 == true)
        trailY[i] = snakeY - (10 * i);           
      do {
        if (dir1 == true) {
          trailY[i] -= 1;
          //     rect (trailX[i], trailY[i], 10, 10);
        } else if (dir2 == true) {
          trailY[i] += 1;
          //     rect (trailX[i], trailY[i], 10, 10);
        }             
        //   rect (trailX[i], trailY[i], 10, 10);
      } while (trailY[i] != snakeY); 
      if (trailY[i] == snakeY) {
        trailX[i] = snakeX - (10 * i);
      }
    }
  }
}*/



  /*** trailGrowth *************************************************************************************
  * Purpose: Manage X and Y location of tail snake units                                               * 
  * Parameters: num - the number of the snake unit in array                                            *
  *             clr - colour of snake unit                                                             *
  *             check1 - to check if last direction was up once the snake moves either left or right   *
  *             check2 - to check if last direction was down once the snake moves either left or right * 
  *             check3 - to check if last direction was left once the snake moves either up or down    *
  *             check4 - to check if last direction was right once the snake moves either up or down   *
  * Returns: none                                                                                      *
  ******************************************************************************************************/
  void trailGrowth (int num, color clr, boolean check1, boolean check2, boolean check3, boolean check4) {
    dir1 = check1;
    dir2 = check2;
    dir3 = check3;
    dir4 = check4;   
    i = num;
    colour = clr;
    fill (colour);
    prevX2 = trailX[i];
    prevY2 = trailY[i];
    trailX[i] = prevX;
    trailY[i] = prevY;
    prevX = prevX2;
    prevY = prevY2;
  }
}
