public class StringArrayTest {
    public static List<String> generateStringArray(Integer num) {
        List<String> TestArray = new List<String>();
        for(Integer i = 0; i < num; i++) {
            TestArray.add('Test ' + i);
        }
        return TestArray;
    }
}