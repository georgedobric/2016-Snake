/*********************************************************
*  Names: George Dobric & Keyi Chen                      *
*  Course: ICS3U1-02  Pd. 3                              *
*  Assignment #6                                         *
*  Purpose: To create a custom game of snake.            *
*  Due Date: May 25, 2016                                *
*********************************************************/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//import processing.video.*;

//Movie mov;

Minim centipede;
Minim macintosh;
Minim clickmarker;
AudioPlayer player, player2, player3;
AudioMetaData meta;
boolean playing = true;

int snakeX = 345;
int snakeY = 195;
int snakeLength = 0;
int trailX [] = new int [1000];
int trailY [] = new int [1000];
Snake tail [] = new Snake [1000];
boolean up, down, left, right;
int dir;
int snakeUnits;
int snakeSpeed = 2;
float appleX = random (35, 655);
float appleY = random (45, 345);
boolean consumed;
float mountaindewX = -100;
float mountaindewY = -100;
float mountaindewSpawn = 0;
boolean mountaindewConsumed;
int score;
int gameScore;
int screen = 0;
int currency = 0;
int currencyEarned = 0;
int highScore = 0;
int diabetesW = 0;
int triggerW = 0;
int difficultyLevel = 1;
int character = 0;
int tempSnakeX;
int tempSnakeY;
color colour1;
boolean jabba;
boolean hillary;
boolean obama;
boolean bernie;
boolean trump;
boolean cruz;
PImage menu;
PImage instructions;
PImage highscore;
PImage coloursBlue;
PImage coloursRed;
PImage coloursYellow;
PImage coloursPurple;
PImage coloursOrange;
PImage coloursGreen;
PImage pause;
PImage gameover;
PImage options;
PImage difficulty;
PImage difficultyeasy;
PImage difficultynormal;
PImage difficultyhard;
PImage difficultyextreme;
PImage checkmark;
PImage customization;
PImage characterselection;
PImage colourselection;
PImage background;
PImage mountaindew;
PImage jabbabio;
PImage obamabio;
PImage sandersbio;
PImage clintonbio;
PImage cruzbio;
PImage trumpbio;
PImage marketplace;
PImage marketjabba;
PImage markethillary;
PImage marketobama;
PImage marketbernie;
PImage markettrump;
PImage marketcruz;
PImage selectjabba;
PImage selecthillary;
PImage selectobama;
PImage selectbernie;
PImage selecttrump;
PImage selectcruz;
PImage lock;
PImage bluescreen;
PImage hitmarker;
PImage jabbahead;
PImage clintonhead;
PImage obamahead;
PImage sandershead;
PImage trumphead;
PImage cruzhead;
PImage doublexp;
boolean mouseCheck;
boolean doublePoints = false;

int z;
int a = 1;
int b = 1;
int tempSpeed;

int prevX, prevY, prevX2, prevY2;

void setup ()
{
  size (700, 400);
  menu = loadImage ("mainmenu.png");
  instructions = loadImage ("instructions.png");
  highscore = loadImage ("highscore.png");
  coloursBlue = loadImage ("coloursblue.png");
  coloursRed = loadImage ("coloursred.png");  
  coloursYellow = loadImage ("coloursyellow.png");
  coloursPurple = loadImage ("colourspurple.png");  
  coloursOrange = loadImage ("coloursorange.png");
  coloursGreen = loadImage ("coloursgreen.png");  
  pause = loadImage ("paused.png");
  gameover = loadImage ("gameover.png");
  options = loadImage ("options.png");
  difficulty = loadImage ("difficulty.png");
  difficultyeasy = loadImage ("difficultyeasy.png");
  difficultynormal = loadImage ("difficultymedium.png");  
  difficultyhard = loadImage ("difficultyhard.png");  
  difficultyextreme = loadImage ("difficultyextreme.png");  
  checkmark = loadImage ("checkmark.png");
  customization = loadImage ("customization.png");
  characterselection = loadImage ("characterselection.png");
  colourselection = loadImage ("colourselection.png");
  background = loadImage ("background.png");
  mountaindew = loadImage ("mountaindew.png");
  jabbabio = loadImage ("jabbabio.png");
  obamabio = loadImage ("obamabio.png");
  sandersbio = loadImage ("sandersbio.png");
  clintonbio = loadImage ("clintonbio.png");
  cruzbio = loadImage ("cruzbio.png");
  trumpbio = loadImage ("trumpbio.png");
  marketplace = loadImage ("marketplace.png");
  marketjabba = loadImage ("marketjabba.png");
  markethillary = loadImage ("markethillary.png");
  marketobama = loadImage ("marketobama.png");
  marketbernie = loadImage ("marketbernie.png");  
  markettrump = loadImage ("markettrump.png");
  marketcruz = loadImage ("marketcruz.png");  
  selectjabba = loadImage ("selectjabba.png");
  selecthillary = loadImage ("selecthillary.png");
  selectobama = loadImage ("selectobama.png");
  selectbernie = loadImage ("selectbernie.png");
  selecttrump = loadImage ("selecttrump.png");
  selectcruz = loadImage ("selectcruz.png");
  lock = loadImage ("lock.png");
  bluescreen = loadImage ("bluescreen.jpg");
  hitmarker = loadImage ("hitmarker.png");
  jabbahead = loadImage ("jabbahead.png");
  clintonhead = loadImage ("clintonhead.png");
  obamahead = loadImage ("obamahead.png");
  sandershead = loadImage ("sandershead.png");
  trumphead = loadImage ("trumphead.png");
  cruzhead = loadImage ("cruzhead.png");
  doublexp = loadImage ("doublexp.png");
  colour1 = GREEN;
  macintosh = new Minim(this);
  player = macintosh.loadFile("macintosh.mp3");
  centipede = new Minim(this);
  player.play();
  player2 = centipede.loadFile("centipede.mp3");
  clickmarker = new Minim(this);
  player3 = clickmarker.loadFile("hitmarker.mp3"); 

  //mov = new Movie(this, "compsciproject.mp4");
  //mov.play();
}
//void movieEvent(Movie m) {
//  m.read();
//}

void draw ()
{
  cursor(CROSS); 
  if (screen == -2) {
    player2.pause();
    player.pause();
//    image (mov, 0, 0, width, height);
    text ("Click to begin...", 5, 395);
  }
  if (screen == -1)
  {
    clear();
    image (difficulty, 0, -5, width, height+25);
  }   
  if (screen == 0)
  {
    //mov.pause();
    player2.pause();
    player2.rewind();
    player.play();
    image (menu, 0, 0, width/1, height/1);
    fill (BLACK);
    textSize (16);
    text (currency, 30, 20);
    score = 0; 
    mountaindewSpawn = 0; 
    dir = 0;
    snakeX = 345;
    snakeY = 195;
    triggerW = 0;
    diabetesW = 0; 
    score = 0;
    snakeLength = 0;
    currencyEarned = 0;
    appleX = random (0, 690);
    appleY = random (0, 345);   
    doublePoints = false;
  } else if (screen == 1)
  { 
    int s = second();
    int s2 = second();
    player.pause();
    player.rewind();
    player2.play();
    clear();    
    image (background, 0, 0, width/1, height/1);
    if (mountaindewSpawn == 1)
    {      
      image (mountaindew, mountaindewX, mountaindewY, width/35, height/10);
    }        
    fill (BLACK);
    textSize (24);
    text (score, 100, 32);
    fill (BLUE);
    rect (0, 374, diabetesW, 25);    
    fill (RED);
    rect (513, 374, triggerW, 25);      
    Snake snake = new Snake(snakeX, snakeY, dir, colour1);
    if (character == 0)
      snake.display(); 
    else if (character == 1) {
      if (dir == 0 || dir == 2 || dir == 4)
        image (jabbahead, snakeX - 10, snakeY, width/20, height/20);
      else if (dir == 3)
        image (jabbahead, snakeX - 15, snakeY, width/20, height/20);
      else if (dir == 1)
        image (jabbahead, snakeX - 10, snakeY - 5, width/20, height/20);
    } else if (character == 2) {
      if (dir == 0)
        image (clintonhead, snakeX - 12, snakeY - 10, width/20, height/10);
      else if (dir == 4)
        image (clintonhead, snakeX - 7, snakeY - 10, width/20, height/10);  
      else if (dir == 3)
        image (clintonhead, snakeX - 17, snakeY - 10, width/20, height/10);
      else if (dir == 2)
        image (clintonhead, snakeX - 12, snakeY - 5, width/20, height/10);
      else if (dir == 1)
        image (clintonhead, snakeX - 12, snakeY - 15, width/20, height/10);
    } else if (character == 3) {
      if (dir == 0 || dir == 2 || dir == 4)
        image (obamahead, snakeX - 10, snakeY, width/20, height/20);  
      else if (dir == 1)
        image (obamahead, snakeX - 10, snakeY - 10, width/20, height/20);
      else if (dir == 3)
        image (obamahead, snakeX - 15, snakeY, width/20, height/20);
    } else if (character == 4) {
      if (dir == 4 || dir == 0)
        image (sandershead, snakeX - 10, snakeY - 5, width/20, height/20);    
      else if (dir == 2)
        image (sandershead, snakeX - 10, snakeY, width/20, height/20);  
      else if (dir == 3)
        image (sandershead, snakeX - 15, snakeY - 5, width/20, height/20);  
      else if (dir == 1)
        image (sandershead, snakeX - 12, snakeY - 7, width/20, height/20);
    } else if (character == 5) {
      if (dir == 0 || dir == 4)
        image (trumphead, snakeX - 5, snakeY - 5, width/25, height/20);
      else if (dir == 1)
        image (trumphead, snakeX - 7, snakeY - 5, width/25, height/20);
      else if (dir == 2)
        image (trumphead, snakeX - 7, snakeY, width/25, height/20);      
      else if (dir == 3)
        image (trumphead, snakeX - 12, snakeY - 5, width/25, height/20);
    } else if (character == 6) {
      if (dir == 0)  
        image (cruzhead, snakeX - 10, snakeY, width/15, height/15); 
      else if (dir == 4)
        image (cruzhead, snakeX - 10, snakeY - 2, width/15, height/15);  
      else if (dir == 3)
        image (cruzhead, snakeX - 19, snakeY - 2, width/15, height/15);
      else if (dir == 2)
        image (cruzhead, snakeX - 15, snakeY, width/15, height/15);
      else if (dir == 1)
        image (cruzhead, snakeX - 15, snakeY - 10, width/15, height/15);
    }
    if (dir == 1)
    {
      prevX = snakeX;
      prevY = snakeY;
      snakeY -= snakeSpeed;
    } else if (dir == 2)
    {
      prevX = snakeX;
      prevY = snakeY;
      snakeY += snakeSpeed;
    } else if (dir == 3)
    {
      prevX = snakeX;
      prevY = snakeY;
      snakeX -= snakeSpeed;
    } else if (dir == 4)
    {
      prevX = snakeX;
      prevY = snakeY;
      snakeX += snakeSpeed;
    }

    if (snakeLength > 0) {
      for (int i = 1; i <= snakeLength; i++) {
        tail[i] = new Snake(trailX[i], trailY[i], dir, colour1);
        tail[i].trailGrowth (i, colour1, up, down, left, right);
        tail[i].display();
      }
    }




    if ((appleX >= snakeX && appleX <= (snakeX + 10)) && (appleY >= snakeY && appleY <= (snakeY + 10)) || (appleX + 10 >= snakeX && appleX + 10 <= (snakeX + 10)) && (appleY >= snakeY && appleY <= (snakeY + 10)) || (appleX >= snakeX && appleX <= (snakeX + 10)) && (appleY + 10 >= snakeY && appleY <= (snakeY + 10)) || (appleX + 10 >= snakeX && appleX <= (snakeX + 10)) && (appleY + 10 >= snakeY && appleY <= (snakeY + 10)))
      consumed = true;
    else
      consumed = false;

    if (consumed == false)
    {
      fill (RED);
      rect (appleX, appleY, 10, 10);
    } else if (consumed == true)
    {
      appleX = random (0, 690);
      appleY = random (0, 345);
      if (doublePoints != true) {
        if (character != 5)
          score += 50;
        snakeLength += 1;
        if (snakeSpeed == 2) {
          if (character == 0 || character == 1 || character == 2 || character == 3 || character == 6) 
            currency += 10;
          else if (character == 4)
            currencyEarned += 10;
          else if (character == 5) {
            currency += 20;
            score += 100;
          }
        }
        if (snakeSpeed == 3) {
          if (character == 0 || character == 1 || character == 2 || character == 3 || character == 6)         
            currency += 20; 
          else if (character == 4)
            currencyEarned += 20;
          else if (character == 5) {
            currency += 40;
            score += 100;
          }
        }
        if (snakeSpeed == 4) {
          if (character == 0 || character == 1 || character == 2 || character == 3 || character == 6) 
            currency += 30;    
          else if (character == 4)
            currencyEarned += 30;
          else if (character == 5) {
            currency += 60;
            score += 100;
          }
        }
        if (snakeSpeed == 5) {
          if (character == 0 || character == 1 || character == 2 || character == 3 || character == 6)         
            currency += 40;   
          else if (character == 4)
            currencyEarned += 40;
          else if (character == 5) {
            currency += 80;
            score += 100;
          }
        }
      }

      if (triggerW >= 0 && triggerW < 184) {
        triggerW += 23;      
        a = 1;
      } else if (triggerW >= 184) {
        s2 = 0;
        a = 1;
      }
      if (mountaindewSpawn != 1)
      {
        mountaindewSpawn = (int)random(1, 5);
        if (mountaindewSpawn == 1) {
          mountaindewX = (int)random(35, 655);
          mountaindewY = (int)random(45, 345);
        } else if (mountaindewSpawn != 1) { 
          mountaindewX = -100;
          mountaindewY = -100;
        }
      } else if (mountaindewSpawn == 1)
      {
      }
    }

    if ((mountaindewX >= snakeX && mountaindewX <= (snakeX + 10)) && (mountaindewY >= snakeY && mountaindewY <= (snakeY + 10)) || (mountaindewX + 10 >= snakeX && mountaindewX + 10 <= (snakeX + 10)) && (mountaindewY >= snakeY && mountaindewY <= (snakeY + 10)) || (mountaindewX >= snakeX && mountaindewX <= (snakeX + 10)) && (mountaindewY + 10 >= snakeY && mountaindewY <= (snakeY + 10)) || (mountaindewX + 20 >= snakeX && mountaindewX <= (snakeX + 10)) && (mountaindewY + 40 >= snakeY && mountaindewY <= (snakeY + 10))) {
      mountaindewConsumed = true;
      doublePoints = true;
      s = 0;
    } else
      mountaindewConsumed = false;    

    if (doublePoints == true) {
      if (s % 6 < 5) {
        image (doublexp, 550, 0, width/6, height/6); 
        if (consumed == true) {
          if (character != 5)
            score += 100;
          snakeLength += 1;
          if (snakeSpeed == 2) {
            if (character == 0 || character == 1 || character == 2 || character == 3 || character == 6) 
              currency += 20;
            else if (character == 4)
              currencyEarned += 20;
            else if (character == 5) {
              currency += 40;
              score += 200;
            }
          }
          if (snakeSpeed == 3) {
            if (character == 0 || character == 1 || character == 2 || character == 3 || character == 6)         
              currency += 40; 
            else if (character == 4)
              currencyEarned += 40;
            else if (character == 5) {
              currency += 80;
              score += 200;
            }
          }
          if (snakeSpeed == 4) {
            if (character == 0 || character == 1 || character == 2 || character == 3 || character == 6) 
              currency += 60;    
            else if (character == 4)
              currencyEarned += 60;
            else if (character == 5) {
              currency += 120;
              score += 200;
            }
          }
          if (snakeSpeed == 5) {
            if (character == 0 || character == 1 || character == 2 || character == 3 || character == 6)         
              currency += 80;   
            else if (character == 4)
              currencyEarned += 80;
            else if (character == 5) {
              currency += 160;
              score += 200;
            }
          }
        }
      } else
        doublePoints = false;
    }


    if (mountaindewConsumed == true)
    {
      if (diabetesW <= 184) {
        diabetesW += 23;   
        b = 1;
      } else if (diabetesW >= 184) 
        s = 0;
      mountaindewSpawn = 0;
      mountaindewX = -100;
      mountaindewY = -100;
    }

    if (diabetesW >= 184)
    {
      if (character == 1)
        if (b == 1) {
          score += 250;
          b = 0;
        }
      if (s % 6 < 5) {
        fill (BROWN, 250);
        rect (0, 0, 700, 400);
      } else
        diabetesW = 0;
    }


    if (triggerW >= 184)
    {
      if (s2 % 6 < 5) {
        if (a == 1) {
          if (character == 3)
            score += 250;
          else if (character == 2) {
            if (snakeX > 699) {
              snakeX = 1;
            } else if (snakeX < 1)
              snakeX = 699;
            else if (snakeY > 399)
              snakeY = 1;
            else if (snakeY < 1)
              snakeY = 399;
          } else if (character == 6) {
            score += 50;
            appleX = random (0, 690);
            appleY = random (0, 345);
            if (mountaindewSpawn == 1) {
              diabetesW += 23;         
              mountaindewSpawn = 0;
              mountaindewX = -100;
              mountaindewY = -100;
            }
            if (snakeSpeed == 2)
              currency += 10;
            else if (snakeSpeed == 3)
              currency += 20;
            else if (snakeSpeed == 4)
              currency += 30;
            else if (snakeSpeed == 5)
              currency += 40;
          }            
          snakeSpeed *= 2;
          a = 0;
        }
      } else {
        triggerW = 0;
        snakeSpeed = tempSpeed;
      }
    } else if (triggerW < 184) {
    }

    boolean outofbounds;
    if (snakeX < 0 || snakeX + 10 > 700 || snakeY < 0 || snakeY + 10 > 373)
      outofbounds = true;
    else
      outofbounds = false;

    if (outofbounds == true && !(triggerW >= 184 && character == 2))
    {
      if (character == 4) {
        score += (int(score * 0.25));
        currencyEarned += (int(currencyEarned * 0.25));
        currency += currencyEarned;
      }
      screen = 11;
    }
  }
  if (screen == 2)
  {
    image (instructions, 0, 0, width/1, height/1);
  }  
  if (screen == 3)
  {
    image (highscore, 0, 0, width/1, height/1);
    fill (WHITE);
    textSize (24);
    text (highScore, 410, 217);
  } 
  if (screen == 4)
  {
    image (coloursBlue, 0, 0, width/1, height/1);
  }   
  if (screen == 5)
  {
    image (coloursRed, 0, 0, width/1, height/1);
  }
  if (screen == 6)
  {
    image (coloursYellow, 0, 0, width/1, height/1);
  }   
  if (screen == 7)
  {
    image (coloursPurple, 0, 0, width/1, height/1);
  }
  if (screen == 8)
  {
    image (coloursOrange, 0, 0, width/1, height/1);
  }  
  if (screen == 9)
  {
    image (coloursGreen, 0, 0, width/1, height/1);
  }  
  if (screen == 10)
  {
    image (pause, 0, 0, width/1, height/1);
  }   
  if (screen == 11)
  {
    image (gameover, 0, 0, width/1, height/1);
    if (score >= highScore)
      highScore = score;  
    fill (WHITE);
    textSize (24);
    text (gameScore, 410, 165);
    text (highScore, 390, 210);    
    text (currency, 350, 250);    
    snakeX = 345;
    snakeY = 195;
    dir = 0;
    snakeSpeed = 2;
    diabetesW = 0;
    triggerW = 0;
    gameScore = score;
    snakeLength = 0;
  }  
  if (screen == 12)
  {
    clear();
    image (marketplace, 0, -5, width/1, height/1 + 4); 
    text (currency, 30, 110);
  } 
  if (screen == 13)
  {
    clear();
    image (options, 0, 0, width, height);
  } 
  if (screen == 14)
  {
    clear();
    image (difficulty, 0, -5, width, height+25); 
    image (checkmark, 478, -5, width/10, height/7);
    snakeSpeed = 2;
  } 
  if (screen == 15)
  {
    clear();
    image (difficulty, 0, -5, width, height+25); 
    image (checkmark, 478, 95, width/10, height/7);    
    snakeSpeed = 3;
  } 
  if (screen == 16)
  {
    clear();
    image (difficulty, 0, -5, width, height+25); 
    image (checkmark, 478, 195, width/10, height/7); 
    snakeSpeed = 4;
  } 
  if (screen == 17)
  {
    clear();
    image (difficulty, 0, -5, width, height+25); 
    image (checkmark, 478, 295, width/10, height/7);    
    snakeSpeed = 5;
  }   
  if (screen == 18)
  {
    clear();
    image (customization, 0, 0, width, height+10);
  }   
  if (screen == 19)
  {
    clear();
    image (characterselection, -1, -5, width, height+4); 
    if (jabba == false)
      image (lock, 150, 205, width/22, height/15);
    if (hillary == false)
      image (lock, 287, 205, width/22, height/15);      
    if (obama == false)
      image (lock, 423, 205, width/22, height/15);      
    if (bernie == false)
      image (lock, 150, 292, width/22, height/15);      
    if (trump == false)
      image (lock, 287, 292, width/22, height/15);      
    if (cruz == false)
      image (lock, 423, 292, width/22, height/15);
  }     
  if (screen == 20)
  {
    clear();
    image (customization, 0, 0, width, height+10);
  }     
  if (screen == 21)
  {
    clear();
    image (selectjabba, -1, -5, width, height+4);  
    if (hillary == false)
      image (lock, 287, 205, width/22, height/15);      
    if (obama == false)
      image (lock, 423, 205, width/22, height/15);      
    if (bernie == false)
      image (lock, 150, 292, width/22, height/15);      
    if (trump == false)
      image (lock, 287, 292, width/22, height/15);      
    if (cruz == false)
      image (lock, 423, 292, width/22, height/15);
  } 
  if (screen == 22)
  {
    clear();
    image (selecthillary, -1, -5, width, height+4);  
    if (jabba == false)
      image (lock, 150, 205, width/22, height/15);   
    if (obama == false)
      image (lock, 423, 205, width/22, height/15);      
    if (bernie == false)
      image (lock, 150, 292, width/22, height/15);      
    if (trump == false)
      image (lock, 287, 292, width/22, height/15);      
    if (cruz == false)
      image (lock, 423, 292, width/22, height/15);
  }     
  if (screen == 23)
  {
    clear();
    image (selectobama, -1, -5, width, height+4);  
    if (jabba == false)
      image (lock, 150, 205, width/22, height/15);
    if (hillary == false)
      image (lock, 287, 205, width/22, height/15);           
    if (bernie == false)
      image (lock, 150, 292, width/22, height/15);      
    if (trump == false)
      image (lock, 287, 292, width/22, height/15);      
    if (cruz == false)
      image (lock, 423, 292, width/22, height/15);
  }     
  if (screen == 24)
  {
    clear();
    image (selectbernie, -1, -5, width, height+4);  
    if (jabba == false)
      image (lock, 150, 205, width/22, height/15);
    if (hillary == false)
      image (lock, 287, 205, width/22, height/15);      
    if (obama == false)
      image (lock, 423, 205, width/22, height/15);          
    if (trump == false)
      image (lock, 287, 292, width/22, height/15);      
    if (cruz == false)
      image (lock, 423, 292, width/22, height/15);
  }     
  if (screen == 25)
  {
    clear();
    image (selecttrump, -1, -5, width, height+4);   
    if (jabba == false)
      image (lock, 150, 205, width/22, height/15);
    if (hillary == false)
      image (lock, 287, 205, width/22, height/15);      
    if (obama == false)
      image (lock, 423, 205, width/22, height/15);      
    if (bernie == false)
      image (lock, 150, 292, width/22, height/15);        
    if (cruz == false)
      image (lock, 423, 292, width/22, height/15);
  }     
  if (screen == 26)
  {
    clear();
    image (selectcruz, -1, -5, width, height+4);
    if (jabba == false)
      image (lock, 150, 205, width/22, height/15);
    if (hillary == false)
      image (lock, 287, 205, width/22, height/15);      
    if (obama == false)
      image (lock, 423, 205, width/22, height/15);      
    if (bernie == false)
      image (lock, 150, 292, width/22, height/15);      
    if (trump == false)
      image (lock, 287, 292, width/22, height/15);
  }
  if (screen == 27)
  {
    clear();
    image (marketjabba, 0, -5, width/1, height/1 + 4); 
    text (currency, 30, 110);
  }
  if (screen == 28)
  {
    clear();
    image (markethillary, 0, -5, width/1, height/1 + 4); 
    text (currency, 30, 110);
  }
  if (screen == 29)
  {
    clear();
    image (marketobama, 0, -5, width/1, height/1 + 4); 
    text (currency, 30, 110);
  }  
  if (screen == 30)
  {
    clear();
    image (marketbernie, 0, -5, width/1, height/1 + 4); 
    text (currency, 30, 110);
  }  
  if (screen == 31)
  {
    clear();
    image (markettrump, 0, -5, width/1, height/1 + 4); 
    text (currency, 30, 110);
  }  
  if (screen == 32)
  {
    clear();
    image (marketcruz, 0, -5, width/1, height/1 + 4); 
    text (currency, 30, 110);
  }  
  if (screen == 33)
  {
    clear ();
    image (jabbabio, 0, -16, width/1 + 2, height/1 + 14);
  }
  if (screen == 34)
  {
    clear ();
    image (clintonbio, 0, -16, width/1 + 2, height/1 + 24);
  }  
  if (screen == 35)
  {
    clear ();
    image (obamabio, 0, -16, width/1 + 2, height/1 + 24);
  }    
  if (screen == 36)
  {
    clear ();
    image (sandersbio, 0, -16, width/1 + 2, height/1 + 24);
  }    
  if (screen == 37)
  {
    clear ();
    image (trumpbio, 0, -16, width/1 + 10, height/1 + 24);
  }    
  if (screen == 38)
  {
    clear ();
    image (cruzbio, 0, -16, width/1 + 2, height/1 + 24);
  }    
  mouseCheck = false;
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP && dir != 2)
    {
      dir = 1;
      up = true;
      down = false;
    } else if (keyCode == DOWN && dir != 1)
    {
      dir = 2;
      down = true;
      up = false;
    } else if (keyCode == LEFT && dir != 4)
    {
      dir = 3;
      left = true;
      right = false;
    } else if (keyCode == RIGHT && dir != 3)
    {
      dir = 4;
      right = true;
      left = false;
    }
  } else if (screen == 1 && key == ' ')
  {
    screen = 10;
  } else if (screen == 10 && key == ' ')
  {
    screen = 1;
  }
}

void mousePressed()
{
  mouseCheck = true;
  image (hitmarker, mouseX - 57, mouseY - 50, width/6, height/4);
  player3.play();
  player3.rewind();
  if (screen == -2 && mouseX > 0 && mouseX < 700 && mouseY > 0 && mouseY < 400)
    screen = 0;

  else if (screen == 0 && mouseX >= 260 && mouseX <= 440 && mouseY >= 157 && mouseY <= 205)
    screen = -1;
  else if ((screen == -1) && mouseX >= 176 && mouseX <= 522 && mouseY >= 7 && mouseY <= 85)
  {
    screen = 1;
    difficultyLevel = 1;
    snakeSpeed = 2;
    tempSpeed = 2;
  } else if ((screen == -1) && mouseX >= 176 && mouseX <= 522 && mouseY >= 107 && mouseY <= 185)
  {
    screen = 1;
    difficultyLevel = 2;
    snakeSpeed = 3;  
    tempSpeed = 3;
  } else if ((screen == -1) && mouseX >= 176 && mouseX <= 522 && mouseY >= 207 && mouseY <= 285)
  {
    screen = 1;
    difficultyLevel = 3;
    snakeSpeed = 4;   
    tempSpeed = 4;
  } else if ((screen == -1) && mouseX >= 176 && mouseX <= 522 && mouseY >= 307 && mouseY <= 385)
  {
    screen = 1;
    difficultyLevel = 4;
    snakeSpeed = 5;  
    tempSpeed = 5;
  } else if (screen == 0 && mouseX >= 260 && mouseX <= 440 && mouseY >= 217 && mouseY <= 265)
    screen = 2;  
  else if (screen == 0 && mouseX >= 260 && mouseX <= 440 && mouseY >= 277 && mouseY <= 325)
    screen = 3;       
  else if (screen == 0 && mouseX >= 260 && mouseX <= 440 && mouseY >= 337 && mouseY <= 385)
  {
    screen = 13;
  } else if (screen == 13 && mouseX >= 202 && mouseX <= 499 && mouseY >= 15 && mouseY <= 174)
  {
    if (difficultyLevel == 1)
      screen = 14;
    else if (difficultyLevel == 2)
      screen = 15;
    else if (difficultyLevel == 3)
      screen = 16;
    else if (difficultyLevel == 4)
      screen = 17;
  } else if (screen == 13 && mouseX >= 202 && mouseX <= 499 && mouseY >= 222 && mouseY <= 382)
  {
    screen = 18;
  } else if ((screen == 15 || screen == 16 || screen == 17) && mouseX >= 176 && mouseX <= 522 && mouseY >= 7 && mouseY <= 85)
  {
    screen = 14;
    difficultyLevel = 1;
  } else if ((screen == 14 || screen == 16 || screen == 17) && mouseX >= 176 && mouseX <= 522 && mouseY >= 107 && mouseY <= 185)
  {
    screen = 15;
    difficultyLevel = 2;
  } else if ((screen == 14 || screen == 15 || screen == 17) && mouseX >= 176 && mouseX <= 522 && mouseY >= 207 && mouseY <= 285)
  {
    screen = 16;
    difficultyLevel = 3;
  } else if ((screen == 14 || screen == 15 || screen == 16) && mouseX >= 176 && mouseX <= 522 && mouseY >= 307 && mouseY <= 385)
  {
    screen = 17;
    difficultyLevel = 4;
  } else if ((screen > 1 || screen < 0) && mouseX >= 0 && mouseX <= 60 && mouseY >= 0 && mouseY <= 60) {
    screen = 0;
  } else if ((screen == 4 || screen == 5 || screen == 6 || screen == 7 || screen == 8 || screen == 9) && mouseX >= 163 && mouseX <= 277 && mouseY >= 230 && mouseY <= 290)
  {
    screen = 4;
    colour1 = BLUE;
  } else if ((screen == 4 || screen == 5 || screen == 6 || screen == 7 || screen == 8 || screen == 9) && mouseX >= 300 && mouseX <= 414 && mouseY >= 230 && mouseY <= 290)
  {
    screen = 5;
    colour1 = RED;
  } else if ((screen == 4 || screen == 5 || screen == 6 || screen == 7 || screen == 8 || screen == 9) && mouseX >= 437 && mouseX <= 551 && mouseY >= 230 && mouseY <= 290)
  {
    screen = 6;
    colour1 = YELLOW;
  } else if ((screen == 4 || screen == 5 || screen == 6 || screen == 7 || screen == 8 || screen == 9) && mouseX >= 163 && mouseX <= 277 && mouseY >= 315 && mouseY <= 375)
  {
    screen = 7;
    colour1 = PURPLE;
  } else if ((screen == 4 || screen == 5 || screen == 6 || screen == 7 || screen == 8 || screen == 9) && mouseX >= 300 && mouseX <= 414 && mouseY >= 315 && mouseY <= 375)
  {
    screen = 8;
    colour1 = ORANGE;
  } else if ((screen == 4 || screen == 5 || screen == 6 || screen == 7 || screen == 8 || screen == 9) && mouseX >= 437 && mouseX <= 551 && mouseY >= 315 && mouseY <= 375)
  {
    screen = 9;
    colour1 = GREEN;
  } else if (screen == 0 && mouseX >= 0 && mouseX <= 60 && mouseY >= 350 && mouseY <= 400) 
  {
    screen = 12;
  } else if (screen == 18 && mouseX >= 202 && mouseX <= 499 && mouseY >= 15 && mouseY <= 174)
  {
    if (character == 0)
      screen = 19;   
    else if (character == 1)
      screen = 21;
    else if (character == 2)
      screen = 22;      
    else if (character == 3)
      screen = 23;      
    else if (character == 4)
      screen = 24;      
    else if (character == 5)
      screen = 25;      
    else if (character == 6)
      screen = 26;
  } else if (screen == 18 && mouseX >= 202 && mouseX <= 499 && mouseY >= 222 && mouseY <= 382)
  {
    if (colour1 == GREEN)
      screen = 9;
    else if (colour1 == ORANGE)
      screen = 8;
    else if (colour1 == PURPLE)
      screen = 7;      
    else if (colour1 == YELLOW)
      screen = 6;      
    else if (colour1 == RED)
      screen = 5;      
    else if (colour1 == BLUE)
      screen = 4;
  } else if ((screen == 19 || screen == 22 || screen == 23 || screen == 24 || screen == 25 || screen == 26) && mouseX >= 163 && mouseX <= 277 && mouseY >= 230 && mouseY <= 290 && (jabba == true))
  {
    screen = 21;
    character = 1;
  } else if ((screen == 19 || screen == 21 || screen == 23 || screen == 24 || screen == 25 || screen == 26) && mouseX >= 300 && mouseX <= 414 && mouseY >= 230 && mouseY <= 290 && (hillary == true))
  {
    screen = 22;
    character = 2;
  } else if ((screen == 19 || screen == 21 || screen == 22 || screen == 24 || screen == 25 || screen == 26) && mouseX >= 437 && mouseX <= 551 && mouseY >= 230 && mouseY <= 290 && (obama == true))
  {
    screen = 23;
    character = 3;
  } else if ((screen == 19 || screen == 21 || screen == 22 || screen == 23 || screen == 25 || screen == 26) && mouseX >= 163 && mouseX <= 277 && mouseY >= 315 && mouseY <= 375 && (bernie == true))
  {
    screen = 24;
    character = 4;
  } else if ((screen == 19 || screen == 21 || screen == 22 || screen == 23 || screen == 24 || screen == 26) && mouseX >= 300 && mouseX <= 414 && mouseY >= 315 && mouseY <= 375 && (trump == true))
  {
    screen = 25;
    character = 5;
  } else if ((screen == 19 || screen == 21 || screen == 22 || screen == 23 || screen == 24 || screen == 25) && mouseX >= 437 && mouseX <= 551 && mouseY >= 315 && mouseY <= 375 && (cruz == true))
  {
    screen = 26;
    character = 6;
  } else if ((screen == 19 || screen == 21 || screen == 22 || screen == 23 || screen == 24 || screen == 25 || screen == 26) && mouseX >= 25 && mouseX <= 103 && mouseY >= 268 && mouseY <= 359)
  {
    screen = 19;
    character = 0;
  } else if ((screen == 12 || screen == 28 || screen == 29 || screen == 30 || screen == 31 || screen == 32) && mouseX >= 163 && mouseX <= 277 && mouseY >= 230 && mouseY <= 290)
  {
    screen = 27;
  } else if ((screen == 12 || screen == 27 || screen == 29 || screen == 30 || screen == 31 || screen == 32) && mouseX >= 300 && mouseX <= 414 && mouseY >= 230 && mouseY <= 290)
  {
    screen = 28;
  } else if ((screen == 12 || screen == 27 || screen == 28 || screen == 30 || screen == 31 || screen == 32) && mouseX >= 437 && mouseX <= 551 && mouseY >= 230 && mouseY <= 290)
  {
    screen = 29;
  } else if ((screen == 12 || screen == 27 || screen == 28 || screen == 29 || screen == 31 || screen == 32) && mouseX >= 163 && mouseX <= 277 && mouseY >= 315 && mouseY <= 375)
  {
    screen = 30;
  } else if ((screen == 12 || screen == 27 || screen == 28 || screen == 29 || screen == 30 || screen == 32) && mouseX >= 300 && mouseX <= 414 && mouseY >= 315 && mouseY <= 375)
  {
    screen = 31;
  } else if ((screen == 12 || screen == 27 || screen == 28 || screen == 29 || screen == 30 || screen == 31) && mouseX >= 437 && mouseX <= 551 && mouseY >= 315 && mouseY <= 375)
  {
    screen = 32;
  } else if ((screen == 27) && mouseX >= 386 && mouseX <= 498 && mouseY >= 113 && mouseY <= 135 && currency >= 150 && jabba == false)
  {
    currency -= 150;
    jabba = true;
  } else if ((screen == 27) && mouseX >= 386 && mouseX <= 498 && mouseY >= 148 && mouseY <= 170 && currency >= 150 && jabba == false)
  {
    currency -= 150;
    jabba = true;
    character = 1;
  } else if ((screen == 28) && mouseX >= 386 && mouseX <= 498 && mouseY >= 113 && mouseY <= 135 && currency >= 300 && hillary == false)
  {
    currency -= 300;
    hillary = true;
  } else if ((screen == 28) && mouseX >= 386 && mouseX <= 498 && mouseY >= 148 && mouseY <= 170 && currency >= 300 && hillary == false)
  {
    currency -= 300;
    hillary = true;
    character = 2;
  } else if ((screen == 29) && mouseX >= 386 && mouseX <= 498 && mouseY >= 113 && mouseY <= 135 && currency >= 150 && obama == false)
  {
    currency -= 150;
    obama = true;
  } else if ((screen == 29) && mouseX >= 386 && mouseX <= 498 && mouseY >= 148 && mouseY <= 170 && currency >= 150 && obama == false)
  {
    currency -= 150;
    obama = true;
    character = 3;
  } else if ((screen == 30) && mouseX >= 386 && mouseX <= 498 && mouseY >= 113 && mouseY <= 135 && currency >= 300 && bernie == false)
  {
    currency -= 300;
    bernie = true;
  } else if ((screen == 30) && mouseX >= 386 && mouseX <= 498 && mouseY >= 148 && mouseY <= 170 && currency >= 300 && bernie == false)
  {
    currency -= 300;
    bernie = true;
    character = 4;
  } else if ((screen == 31) && mouseX >= 386 && mouseX <= 498 && mouseY >= 113 && mouseY <= 135 && currency >= 300 && trump == false)
  {
    currency -= 300;
    trump = true;
  } else if ((screen == 31) && mouseX >= 386 && mouseX <= 498 && mouseY >= 148 && mouseY <= 170 && currency >= 300 && trump == false)
  {
    currency -= 300;
    trump = true;
    character = 5;
  } else if ((screen == 32) && mouseX >= 386 && mouseX <= 498 && mouseY >= 113 && mouseY <= 135 && currency >= 300 && cruz == false)
  {
    currency -= 300;
    cruz = true;
  } else if ((screen == 32) && mouseX >= 386 && mouseX <= 498 && mouseY >= 148 && mouseY <= 170 && currency >= 300 && cruz == false)
  {
    currency -= 300;
    cruz = true;
    character = 6;
  } else if ((screen == 12 || screen == 19 || screen >= 21 && screen <= 32) && mouseX >= 247 && mouseX <= 275 && mouseY >= 229 && mouseY <= 253)
    screen = 33;
  else if ((screen == 12 || screen == 19 || screen >= 21 && screen <= 32) && mouseX >= 390 && mouseX <= 418 && mouseY >= 229 && mouseY <= 253)
    screen = 34;    
  else if ((screen == 12 || screen == 19 || screen >= 21 && screen <= 32) && mouseX >= 520 && mouseX <= 548 && mouseY >= 229 && mouseY <= 253)
    screen = 35;      
  else if ((screen == 12 || screen == 19 || screen >= 21 && screen <= 32) && mouseX >= 247 && mouseX <= 275 && mouseY >= 317 && mouseY <= 340)
    screen = 36;      
  else if ((screen == 12 || screen == 19 || screen >= 21 && screen <= 32) && mouseX >= 390 && mouseX <= 418 && mouseY >= 317 && mouseY <= 340)
    screen = 37;      
  else if ((screen == 12 || screen == 19 || screen >= 21 && screen <= 32) && mouseX >= 520 && mouseX <= 548 && mouseY >= 317 && mouseY <= 340)
    screen = 38;
}
