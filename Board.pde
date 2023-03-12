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
    if (activeTile.getStatus() >= 1) { a.rotateXCW(); }
    else { a.rotateCW(); }
    activeTile.changeStatus();
    a.move();
    activeTile = getTile(a.getX(), a.getY());

  }
}
