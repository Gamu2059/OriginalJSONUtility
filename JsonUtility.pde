public final class JsonUtility {
    public JsonUtility() {
    }

    /**
     @param path Jsonファイルのパス。パスはdataフォルダをルートとして参照される。
     */
    public JsonObject loadJsonObject(String path) {
        try {
            String[] jsonText = loadStrings(path);
            String json = join(trim(jsonText), "");
            createJsonObject(json);
        } 
        catch (Exception e) {
            println(e);
        }
        return null;
    }

    /**
     @param path Jsonファイルのパス。パスはdataフォルダをルートとして参照される。
     */
    public JsonObject loadJsonArray(String path) {
        try {
            String[] jsonText = loadStrings(path);
            String json = join(trim(jsonText), "");
            createJsonArray(json);
        } 
        catch (Exception e) {
            println(e);
        }
        return null;
    }

    private JsonObject createJsonObject(String jsonContents) {
        if (jsonContents == null) return null;
        JsonObject jsonObj = new JsonObject();
        println(jsonContents);

        // 最初の '{'を探す
        int firstToken = -1;
        char temp;
        boolean isLiteral = false;
        for (int i=0; i<jsonContents.length(); i++) {
            temp = jsonContents.charAt(i);
            if (temp == '"') {
                if (isLiteral && jsonContents.charAt(i-1) == '\\') {
                    continue;
                }
                isLiteral = !isLiteral;
            } else if (temp == '{' && !isLiteral) {
                firstToken = i;
                break;
            }
        }
        if (firstToken < 0) return null;

        // '{'と等しい深度の'}'を探す
        // ただし、文字列リテラルの中身は無視する
        int depth = 0;
        int endToken = -1;
        isLiteral = false;
        for (int i=firstToken; i<jsonContents.length(); i++) {
            temp = jsonContents.charAt(i);

            if (temp == '"') {
                if (isLiteral && jsonContents.charAt(i-1) == '\\') {
                    continue;
                }
                isLiteral = !isLiteral;
            }
            if (!isLiteral) {
                if (temp == '{') {
                    depth++;
                } else if (temp == '}') {
                    depth--;
                    if (depth == 0) {
                        endToken = i;
                        break;
                    }
                }
            }
        }
        if (endToken < 0) return null;

        ArrayList<String> jsonPair = splitJsonPair(jsonContents.substring(firstToken + 1, endToken));
        String[] pair = new String[2];
        for (int i=0; i<jsonPair.size(); i++) {
            String jsonElem = jsonPair.get(i);
            for (int j=0; j<jsonElem.length(); j++) {
                temp = jsonElem.charAt(j);
                if (temp == ':') {
                    pair[0] = trim(jsonElem.substring(0, j));
                    pair[1] = trim(jsonElem.substring(j+1));
                    for (int k=0; k<pair.length; k++) {
                        if (pair[k].charAt(0) == '"') {
                            pair[k] = pair[k].substring(1, pair[k].length()-1);
                        }
                    }
                    
                    if (pair[1].charAt(0) == '{') {
                        // JsonObjectの再帰生成
                        jsonObj.setObject(pair[0], createJsonObject(pair[1]));
                    } else if (pair[1].charAt(0) == '[') {
                        // JsonArrayの生成
                    } else {
                        jsonObj.setObject(pair[0], pair[1]);
                    }
                    break;
                }
            }
        }
        
        return jsonObj;
    }

    /**
     渡された文字列からJsonのタグと値が一対になった文字列をリストにして返す。
     */
    private ArrayList<String> splitJsonPair(String jsonContents) {
        ArrayList<String> jsonPair = new ArrayList<String>();
        boolean isLiteral = false, isArray = false;
        char temp;
        int lastSplitIdx = 0;
        for (int i=0; i<jsonContents.length(); i++) {
            temp = jsonContents.charAt(i);

            if (temp == '"') {
                if (i == 0 || jsonContents.charAt(i - 1) != '\\') {
                    isLiteral = !isLiteral;
                }
            }
            if (!isLiteral) {
                if (temp == '[') {
                    isArray = true;
                } else if (temp == ']') {
                    isArray = false;
                }
            }

            if (temp == ',' && !isLiteral && !isArray) {
                jsonPair.add(trim(jsonContents.substring(lastSplitIdx, i)));
                lastSplitIdx = i + 1;
            }
        }
        jsonPair.add(trim(jsonContents.substring(lastSplitIdx)));

        return jsonPair;
    }
    
    private void createJsonArray(String jsonContents) {
        
    }
}