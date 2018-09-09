// CArtAgO artifact code for project room_cleaner

package room_cleaner;

import java.util.Random;

import cartago.*;

public class Rooms extends Artifact {
	private boolean rooms[] = null;
	private int robotAt = 0;
	private Random random = new Random(System.currentTimeMillis());
	private boolean chargers[] = null;
	
	void init(int amountOfRooms) {
		rooms = new boolean[amountOfRooms];
		chargers = new boolean[amountOfRooms];
		
		defineObsProperty("at", 0);
		defineObsProperty("chargeRoomAt", 0);
		
		for(int i = 0; i < amountOfRooms; i++)
		{
			rooms[i] = false;
			chargers[i] = random.nextBoolean();
		}

		execInternalOp("run");
	}

	@INTERNAL_OPERATION
	void run() 
	{
		while(true) {
			if(random.nextDouble() <= 0.5)
				rooms[random.nextInt(rooms.length)] = true;
			
			await_time(4000);
		}
	}
	
	@OPERATION
	void goNextRoom() {
		if(robotAt + 1 < rooms.length)
		{
			robotAt++;
			getObsProperty("at").updateValue(robotAt);
			if(rooms[robotAt])
				signal("dirty");
			if(chargers[robotAt])
			{
				signal("chargerFound");
				getObsProperty("chargeRoomAt").updateValue(robotAt);
			}
		}
		else signal("border");
	}
	
	@OPERATION
	void goFirstRoom() {
		robotAt = 0;
		getObsProperty("at").updateValue(robotAt);
	}
	
	
	@OPERATION
	void clean() {
		if (rooms[robotAt])
			rooms[robotAt] = false;
		else
			signal("noDirty");
	}
	
	@OPERATION
	void initPosition(OpFeedbackParam<Integer> pos) {
		pos.set(0);
	}
	
	@OPERATION
	void updatePosition(OpFeedbackParam<Integer> pos) {
		int currentValue = pos.get();
		currentValue++;
		pos.set(currentValue);
	}
}