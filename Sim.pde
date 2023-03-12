Board b; // Handles tile placement and logic
Tile t; // Placeholder variable for tiles returned by the board
Ant a; // Lil duder

void setup() {
  size(1000, 1000);
  background(122);
  b = new Board(100, 100);
  a = new Ant(width / b.getCols(), height / b.getRows()); }

void draw() {
  background(122);
  b.render(); 
  a.render();
  a.run();
  if (mousePressed) { editTile(); } }

// Edits any tile that the mouse touches
void editTile() {
  if (t != b.getTile(mouseX, mouseY)) {
    b.getTile(mouseX, mouseY).changeStatus(); 
    t = b.getTile(mouseX, mouseY); } }

// Clears the value of T so that you can change the same tile again
void mouseReleased() {
  t = null; }

void keyPressed() { a.start(); }