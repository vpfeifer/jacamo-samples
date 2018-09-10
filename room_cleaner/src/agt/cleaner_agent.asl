// Agent cleaner_agent in project room_cleaner

/* Initial beliefs and rules */

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
				 !move;
				 .wait(1000);
				 !searchTrash.

+!move : at(Room) & Room < 29 <- .println("Moving to room ", Room + 1);
								 goNextRoom.

+!move : at(Room) & Room == 29 <- .println("Moving to first room");
								 goFirstRoom.

+dirty : at(Room) <- .println("Cleaning room ", Room);
					clean.

+noDirty : .println("Room is already clean."). 

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
