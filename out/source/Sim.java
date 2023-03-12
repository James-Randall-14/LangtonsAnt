/* autogenerated by Processing revision 1289 on 2023-03-12 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Sim extends PApplet {

Board b; // Handles tile placement and logic
Tile t; // Used for editing tile status during simulation

public void setup() {
  // Tweak these to adjust window size and resolution
  int rows = 100;
  int cols = 100;

  /* size commented out by preprocessor */;
  b = new Board(rows, cols); }

public void draw() {
  b.run(); 
  if (mousePressed) { editTile(); } }

// Edits any tile that the mouse touches
public void editTile() {
  if (t != b.getTile(mouseX, mouseY)) {
    b.getTile(mouseX, mouseY).changeStatus(); 
    t = b.getTile(mouseX, mouseY); } }

// Clears the value of T so that you can change the same tile again
public void mouseReleased() {
  t = null; }

// Starts simulation when a key is pressed
public void keyPressed() { b.start(); }
public class Ant{
  
  // Variable Declaration
  private int x, y, w, h, dxn; // dxn is the orientation
  private boolean on;
  private Tile tile;
  private PImage[] icon;

  public Ant(int x, int y, int w, int h) {
    imageMode(CENTER);
    this.x = x; this.y = y; 
    this.w = w; this.h = h;
    dxn = 0; 
    icon = new PImage[4];
    for (int i = 0; i < icon.length; i++) {
      icon[i] = loadImage(i + ".png"); } }

  // Rotate clockwise or counter-clockwise
  public void rotateR() { dxn += 1; if (dxn > 3) { dxn = 0; } }
  public void rotateL() { dxn -= 1; if (dxn < 0) { dxn = 3 ; } }

  // Move in the direction faced
  public void move() {
    if (dxn == 0) { y -= h; }
    else if (dxn == 1) { x += w; }
    else if (dxn == 2) { y += h; }
    else if (dxn == 3) {  x -= w; }
  }

  // Draws the ant with correct rotation
  public void render() {
    fill(150);
    image(icon[dxn], x, y, w, h); }

  // Getters
  public int getX() { return x; }
  public int getY() { return y; }
}
public class Board {
  
  // Variable Declaration
  private int rows, cols;
  private Tile[][] grid;
  private Tile activeTile;
  private Ant a;
  private boolean on;

  // Constructor
  public Board(int rows, int cols) {
    grid = new Tile[rows][cols];
    this.rows = rows; this.cols = cols; 
    this.populate(); 
    activeTile = getTile(width / 2, height / 2);
    a = new Ant(activeTile.getX(), activeTile.getY(),
      width / cols, height / rows); 
    on = false; }

  // Fill With Tiles
  public void populate() {
    int tileW = width / cols; 
    int tileH = height / rows;
    int tileX = 0; int tileY = 0;
    for (int r = 0; r < grid.length; r++) {
      tileX = 0;
      for (int c = 0; c < grid[r].length; c++) {
        grid[r][c] = new Tile(tileX, tileY, tileW, tileH);
        tileX += tileW; }
      tileY += tileH; } }
  
  // Display the Board
  public void render(){
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        grid[r][c].render(); } } }

  // Returns tile at given cordinates
  public Tile getTile(int x, int y) {
    return grid[y / (height / rows)][x / (width / cols)]; }

  // Getters
  public int getRows() { return this.rows; }
  public int getCols() { return this.cols; }

  // Starts the simulation
  public void start() { on = true; }

  // Runs the simulation
  public void run() {
    render();
    a.render();
    if (!on) { return; }
    if (activeTile.getStatus() <= 1) { a.rotateL(); }
    else { a.rotateR(); }
    activeTile.changeStatus();
    a.move();
    activeTile = getTile(a.getX(), a.getY());

  }
}
public class Tile {

  // Variable Declaration
  private int x, y, w, h;
  private int status;
  
  // Parameterized Contructor
  public Tile (int x, int y, int w, int h) {
    this.x = x; this.y = y; this.w = w; this.h = h; status = 0;
    noStroke(); }

  // Getters
  public int getX () { return x + w / 2; }
  public int getY () { return y + h / 2; }
  public int getStatus () { return status; }

  // Cycles tile status
  public void changeStatus() {
    status += 1; if (status > 3) { status = 0; } } 

  public void render() { 
    if (status == 0) { fill(255); }
    else if (status == 1) { fill(136, 192, 208); }
    else if (status == 2) { fill(129, 161, 193); }
    else { fill(94, 129, 172); }
    rect(x, y, w, h); }
}


  public void settings() { size(1000, 1000); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sim" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
