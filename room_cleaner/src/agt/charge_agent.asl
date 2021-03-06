// Agent charge_agent in project room_cleaner

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .wait(1000);
				  lookupArtifact("rooms", Rooms);
				  focus(Rooms).

+chargerFound: at(Room) <- .println("Charger found at ", Room).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
