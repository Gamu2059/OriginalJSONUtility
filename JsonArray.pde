public final class JsonArray {
    private ArrayList<Object> _array;

    public JsonArray() {
        _array = new ArrayList<Object>();
    }
    
    public void add(Object obj) {
        _array.add(obj);
    }
}