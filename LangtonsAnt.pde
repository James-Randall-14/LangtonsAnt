Board b; // Handles tile placement and logic
Tile t; // Used for editing tile status during simulation

void setup() {
  // Tweak these to adjust window size and resolution
  int rows = 200;
  int cols = 200; 
  size(1000, 1000);
  b = new Board(rows, cols); }

void draw() {
  b.run(); 
  if (mousePressed) { editTile(); } }

// Edits any tile that the mouse touches
void editTile() {
  if (t != b.getTile(mouseX, mouseY)) {
    b.getTile(mouseX, mouseY).changeStatus(); 
    t = b.getTile(mouseX, mouseY); } }

// Clears the value of T so that you can change the same tile again
void mouseReleased() { t = null; }

// Starts simulation when a key is pressed
void keyPressed() { b.start(); }