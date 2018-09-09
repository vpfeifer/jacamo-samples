// Agent perception_agent in project room_cleaner

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- makeArtifact("rooms", "room_cleaner.Rooms", [30], ID);
				 .println("Rooms environment created.").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
