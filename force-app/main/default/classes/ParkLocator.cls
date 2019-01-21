public class ParkLocator {
    public static List<String> country(String loc) {
        ParkService.ParksImplPort parks = 
            new ParkService.ParksImplPort();
        return parks.byCountry(loc);
    }
}