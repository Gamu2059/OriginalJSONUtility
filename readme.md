# 概要
- processingにはJsonを標準で取り扱う関数があるのに、processing.jsには無いので、統一して取り扱えるようにするために作成したユーティリティパッケージ。
- 基本的にはprocessingのJsonObjectやJsonArrayと同じ使い方が出来ます。

# 取り込み方
- OriginalJSONUtility.pdeを自身のスケッチフォルダ直下に配置します。
- 先頭についている使用例を含むsetup関数を取り除きます。
- 完了です！

# 使用上の注意
- 現在、作者のPCにおいて、processing.js上で実行した際にSaveメソッドが使えない現象が発生しています。
  - 実際は、processing.js標準搭載のsaveStrings関数が機能していないだけでSaveメソッドは正常です。
- processing.jsで実行し、かつSaveメソッドを使用する場合は、予め使用できるかどうかを確認しておくと良いです。
