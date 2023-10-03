# パスワードマネージャー

シェルスクリプトのパスワードマネージャーです。

## 機能

-   サービス名、ユーザー名、パスワードを保存する。
-   サービス名で検索をかけ、保存した情報を参照する。

## 特徴

GnuPG ( GNU Privacy Guard ) を利用し、ファイルを暗号化することで、安全にパスワード管理ができる。

## 事前準備

1. 本リポジトリをクローンする。
    ```
    git clone https://github.com/SayuriOkuyama/password_manager.git
    ```
2. パスワードマネージャーのディレクトリに移動。
    ```
    cd password_manager
    ```
3. パスワードマネージャーのファイルの実行権限を付与する。
    ```
    chmod 700 ./password_manager.sh
    ```
    ※上記では読み込み、書き込み、実行の全権限をユーザーに付与していますが、謝ってファイルを変更しないようにしたい場合は上記ではなく下記コマンドを実行し、ファイルの読み込み、実行権限のみを付与してください。
    ```
    chmod 500 ./password_manager.sh
    ```
4. GnuPG に未登録の場合は、登録の上パスフレーズを準備する。
   GnuPG User guides
   https://www.gnupg.org/documentation/guides.html
5. 下記コマンドを実行し、GnuPG のパスフレーズをファイルに保存する。
    ```
    echo <your_passphrase> > passphrase.txt
    ```
6. 機密性を確保するために、下記コマンドを実行し、パスフレーズのファイルの管理権限を変更する。
    ```
    chmod go-rwx passphrase.txt
    ```

## 使用方法

1. 下記ファイルを実行。
    ```
    ./password_manager.sh
    ```
2. 画面遷移

    ```
    パスワードマネージャーへようこそ！
    次の選択肢から入力してください(Add Password/Get Password/Exit)： //3つのうちから選んで入力

    // Add Password を入力した場合
    サービス名を入力してください： // 登録したいサービス名を入力 → Enter
    ユーザー名を入力してください： // ユーザー名を入力 → Enter
    パスワードを入力してください： // ユーザー名を入力 → Enter

    パスワードの追加は成功しました。
    次の選択肢から入力してください(Add Password/Get Password/Exit)：

    // Get Password を入力した場合
    サービス名を入力してください： // 登録したサービス名を入力
    サービス名: // 入力したサービス名が出力される
    ユーザー名: // 該当のユーザー名が出力される
    パスワード: // 該当のパスワードが出力される

    次の選択肢から入力してください(Add Password/Get Password/Exit)：

    // Exit を選択した場合
    Thank you! // プログラムが終了
    ```
