// CArtAgO artifact code for project room_cleaner

package room_cleaner;

import java.util.Random;

import cartago.*;

public class Rooms extends Artifact {
	// Room possible states
	// 0 : clean
	// 1 : dirty
	// 2 : locked
	private int rooms[][] = null;
	private int[] robotAt = {0,0};
	private Random random = new Random(System.currentTimeMillis());
	private int columns;
	private int rows;
	
	void init(int columns, int rows) {
		this.columns = columns;
		this.rows = rows;
		
		rooms = new int[columns][rows];
		
		defineObsProperty("at", 0);
		
		for(int i = 0; i < columns; i++)
		{
			for (int j = 0; j < rows; j++) {
				rooms[i][j] = random.nextInt(3);
			}
		}

		execInternalOp("run");
	}

	@INTERNAL_OPERATION
	void run() 
	{
		while(true) {
			if(random.nextDouble() <= 0.75)
			{
				int x = random.nextInt(columns);
				int y = random.nextInt(rows);
				rooms[x][y] = 1;
			}

			await_time(4000);
		}
	}
	
	private void search(int x, int y) {
		if (rooms[x][y] == 1)
			signal("dirty");
		else if (rooms[x][y] == 2)
			signal("locked");
		else
			signal("clean");
	}
	
	private void updatePosition() {
		getObsProperty("at").updateValue(this.robotAt);
		signal("currentPosition");
		search(robotAt[0], robotAt[1]);
	}
	
	@OPERATION
	void goLeft() {
		if(robotAt[0] - 1 >= 0)
		{
			robotAt[0]--;
			updatePosition();
		}
		else
			signal("columnBorder");
	}
	
	@OPERATION
	void goRight() {
		if(robotAt[0] + 1 < columns)
		{
			robotAt[0]++;
			updatePosition();
		}
		else
			signal("columnBorder");
	}
	
	@OPERATION
	void goUp() {
		if(robotAt[1] + 1 < rows)
		{
			robotAt[1]++;
			updatePosition();
		}
		else
			signal("rowBorder");
	}
	
	@OPERATION
	void goDown() {
		if(robotAt[1] - 1 >= 0)
		{
			robotAt[1]--;
			updatePosition();
		}
		else
			signal("rowBorder");
	}

	@OPERATION
	void clean() {
		if (rooms[robotAt[0]] [robotAt[1]] == 1)
			rooms[robotAt[0]] [robotAt[1]] = 0;
		else
			signal("clean");
	}
}