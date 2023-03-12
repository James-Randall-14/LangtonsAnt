public class Tile {

  // Variable Declaration
  private int x, y, w, h;
  private boolean status;
  
  // Parameterized Contructor
  public Tile (int x, int y, int w, int h) {
    this.x = x; this.y = y; this.w = w; this.h = h; status = false;
    noStroke(); }

  // Getters
  public int getX () { return x + w / 2; }
  public int getY () { return y + h / 2; }
  public boolean getStatus () { return status; }

  // Cycles tile status
  public void changeStatus() { status = !status; } 

  public void render() { 
    if (status) { fill(94, 129, 172); }
    else { fill(46, 52, 64); }
    rect(x, y, w, h); }
}
