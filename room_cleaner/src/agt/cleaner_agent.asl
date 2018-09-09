// Agent cleaner_agent in project room_cleaner

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .wait(500);
				  lookupArtifact("rooms", Rooms);
				  focus(Rooms);
				  initPosition(Pos);
				  !searchTrash.

+!searchTrash <- .drop_all_intentions;
				 .println("Current position ", Pos);
				 updatePosition(Pos).
				 //.wait(1000);
				 //!searchTrash.

+!move : at(Room) & Room < 29 <- .println("Moving to room ", Room + 1);
								 goNextRoom.

+!move : at(Room) & Room == 29 <- .println("Moving to first room");
								 goFirstRoom.

+dirty: at(Room) <- .println("Cleaning room ", Room);
					clean.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
