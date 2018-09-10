// Agent rooms_builder_agent in project room_cleaner

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .println("Creating rooms."); 
				  makeArtifact("rooms", "room_cleaner.Rooms", [30], Rooms);
				  focus(Rooms);
				  .println("Rooms created.");
				  .broadcast(tell, startCleaner).

-!start : .println("Error trying to create rooms.").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
