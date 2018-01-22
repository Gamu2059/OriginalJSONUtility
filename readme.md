# 概要
- processingとprocessing.jsで共通の処理を用いてJSONファイルを扱えるようにするために作成したプログラム。
- 基本的にはprocessingのリファレンスに記載されているJSONObjectとJSONArrayと同様のメソッドを備えています。

# 取り込み方
- リリースページから最新版をダウンロードします。
- 取り込みたいスケッチの中にOriginalJSONUtility.pdeを入れます。
- 完了です！

# 使い方
## Load Parse Save
```java
// data/test_object.json を読み込む場合
JsonObject jsonObject = new JsonObject();
jsonObject.Load("data/test_object.json");

// data/test_array.json を読み込む場合
JsonArray jsonArray = new JsonArray();
jsonArray.Load("data/test_array.json");

// data/output_object.json に保存する場合
jsonObject.Save("data/output_object.json");

// data/output_array.json に保存する場合
jsonArray.Save("data/output_array.json");

// 文字列からJSONObjectにパースする場合
String objectData = "{ \"id\": 0, \"species\": \"Panthera leo\", \"name\": \"Lion\"}";
jsonObject.Parse(objectData);

// 文字列からJSONArrayｎパースする場合
String arrayData = "[ \"Capra hircus\", \"Panthera pardus\", \"Equus zebra\" ]";
jsonArray.Parse(arrayData);
```
## データの取り出し、追加など
- [processing3のリファレンス](https://processing.org/reference/)のJSONObject, JSONArrayを参照して下さい。
  同様のメソッドを備えています。

# 著作権
- 私 Gamu2059 に帰属します。

# 利用規約
- プログラムの改変、追加、削除は自由に行うことができます。
- 再頒布は禁止します。
- 利用する際は、OriginalJSONUtility.pdeの上部のコメントを削除しないようにして下さい。
  ※削除してしまったとしても、制作者がGamu2059であることを明記してある場合は問題ありません。