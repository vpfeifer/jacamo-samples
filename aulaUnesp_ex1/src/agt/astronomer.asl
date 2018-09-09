// Agent astronomer in project aulaUnesp_ex1

/* Initial beliefs and rules */
planet("Mercury").
planet("Venus").

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("I know the planets : ");
				  .findall(PlanetName, planet(PlanetName), PlanetList);
				  .println(PlanetList);
				  !searchArtifact.

+!searchArtifact <- lookupArtifact("counter", Id);
					focus(Id).

-!searchArtifact <- !searchArtifact.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
