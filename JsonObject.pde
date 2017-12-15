public final class JsonObject {
    private HashMap<String, Object> _objects;
    private ArrayList<String> _names;

    public JsonObject() {
        _objects = new HashMap<String, Object>();
        _names = new ArrayList<String>();
    }

    public Object getObject(String name) {
        return _objects.get(name);
    }

    public void setObject(String name, Object obj) {
        if (!_objects.containsKey(name)) {
            _names.add(name);
        }
        _objects.put(name, obj);
    }
}