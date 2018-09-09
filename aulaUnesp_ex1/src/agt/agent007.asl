// Agent agent007 in project aulaUnesp_ex1

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .send(vinicius, tell, hi); 					// Envia uma nova crença hi para o agente vinicius.
				  .wait(1000);									// Espera 1 segundo.
				  .send(vinicius, achieve, checkTemperature);	// Solicita a execução do plano checkTemperature pelo agente vinicius.
				  .send(vinicius, askOne, temperature(T));		// Solicita o valor da crença temperatura ao agente Vinicius.
				  !createCounter.

+temperature(T) <- .println("Vinicius believes that is ", T," degrees outside.").

+!createCounter <- makeArtifact("counter", "aulaUnesp_ex1.Counter", [0], ID);
				   focus(ID);
				   inc.

+tick <- .println("The counter was incremented!").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }