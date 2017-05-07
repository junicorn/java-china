import com.blade.kit.HashidKit;
import com.javachina.kit.Utils;

public class TestMain {

    public static void main(String[] args) {
        for (int i = 0; i < 100; i++) {
            System.out.println(Utils.genTopicID());
        }
    }

}
