package examples.users;

import com.intuit.karate.junit5.Karate;

class GorestRunner {
    
    @Karate.Test
    Karate testGorest() {
        return Karate.run("users").relativeTo(getClass());
    }    

}
