// CArtAgO artifact code for project aulaUnesp_ex1

package aulaUnesp_ex1;

import cartago.*;

public class Counter extends Artifact {
	void init(int initialValue) {
		defineObsProperty("count", initialValue);
	}

	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

