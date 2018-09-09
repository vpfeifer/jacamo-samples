// Agent vinicius in project aulaUnesp_ex1

/* Initial beliefs and rules */
raining.						 // Está chovendo.
name(vinicius).					 // O nome é Vinicius.
isAt(vinicius, unesp).			 // O Vinicius está na UNESP.
car("Palio").					 // O carro é um Palio.
has(vinicius, car("Palio")).	 // O Vinicius tem um Palio.
temperature(10).				 // A temperatura é de 10 graus.
intensetraffic.					 // O trânsito está intenso.

/* Initial goals */

!start.

/* Plans */

+!start : name(Name) & isAt(Name, Location) <- .println("Hello ", Name,"! How are you ?");
											   .println("I see you are now at ", Location)
											   !checkWeather;
											   !checkTemperature.

+!checkWeather : raining <- .println("Today is raining.\nTake your umbrella!");
							!goByCar.
+!checkWeather : sunny <- .println("Today is a sunny day.\nProtect your skin with sun blocker.").

+!checkTemperature : temperature(T) & T < 15 <- .println("The current temperature is ", T, "\n I suggest you get your coat!").
+!checkTemperature : temperature(T) & T > 25 <- .println("The current temperature is ", T, "\n It is really hot today! Turn on your ar condicionado").
-!checkTemperature : .println("It is a normal temperature day.").

+!goByCar : name(Name) & has(Name,car(Model)) & intensetraffic <- .println(Name, ", you should go with your car ", Model," because the traffic is intense").
-!goByCar.

// Tratamento da recepção de uma nova crença
+hi[source(A)] <- .println("The agent ", A, " said hi");
				  .send(jamesBond, tellHow, "+!sayHi <- .println(\"Vinicius told me how to say hi\").");
				  .send(jamesBond, achieve, sayHi).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
