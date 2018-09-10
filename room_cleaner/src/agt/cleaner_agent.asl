// Agent cleaner_agent in project room_cleaner

/* Initial beliefs and rules */
horizontalDirection(right).
verticalDirection(up).

/* Initial goals */

!initialize.

/* Plans */

+!initialize <- .println("Cleaner initialized.").
-!initialize <- .println("Can't initialize cleaner.").

+startCleaner[source(Src)] <- .println(Src, " started this cleaner");
				  			   lookupArtifact("rooms", Rooms);
				  			   focus(Rooms);
				  			   !searchTrash.

+!searchTrash <- .drop_all_intentions;
				 !moveHorizontal;
				 .wait(1000);
				 !searchTrash.

+!moveHorizontal : at(Room) & horizontalDirection(right) <- goRight.
+!moveHorizontal : at(Room) & horizontalDirection(left) <- goLeft.

+!moveVertical : at(Room) & verticalDirection(down) <- goDown.
+!moveVertical : at(Room) & verticalDirection(up) <- goUp.

+dirty : at(Room) <- .println("Cleaning room ", Room);
					clean.

+columnBorder : horizontalDirection(left)  <- .println("Left border reached.");
											  !moveVertical; 
											  -+horizontalDirection(right).
							 
+columnBorder : horizontalDirection(right) <- .println("Right border reached.");
											  !moveVertical;
				   							  -+horizontalDirection(left).
				   
+rowBorder : verticalDirection(down) <- .println("Bottom border reached"); 
									    -+verticalDirection(up).
							 
+rowBorder : verticalDirection(up)   <- .println("Top border reached");
									    -+verticalDirection(down).

+currentPosition : at(Room) <- .println("Searching for trash at room ", Room).

+locked : at(Room) <- .println("The room", Room," is locked, can't search.").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
