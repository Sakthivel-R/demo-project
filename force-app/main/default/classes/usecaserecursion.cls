public class usecaserecursion {
    private static boolean isfirst = true;
    public static boolean isfirst(){
        if(isfirst){
            isfirst = false;
            return true;
        }
        return false;
        
    }

}