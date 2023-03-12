public class Tile {

  // Variable Declaration
  private int x, y, w, h;
  private boolean status;

  // Default contstructor for inheritance
  public Tile() {};
  
  // Parameterized Contructor
  public Tile (int x, int y, int w, int h) {
    this.x = x; this.y = y; this.w = w; this.h = h;
    status = false;
    noStroke(); }

  // Getters
  public int getX () { return x + w / 2; }
  public int getY () { return y + h / 2; }
  public boolean getStatus () { return status; }

  public void changeStatus() { status = !status; } // Turns the tile on or off

  public void render() { 
    if (status) { fill(60); }
    else { fill(255); }
    rect(x, y, w, h); }
}
