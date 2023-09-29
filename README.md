# パスワードマネージャー

シェルスクリプトのパスワードマネージャーです。
アプレンティスの選考 Web テストの課題で作成しました。

## 機能

-   サービス名、ユーザー名、パスワードを保存する。
-   サービス名で検索をかけ、保存した情報を参照する。

## 特徴

-   GnuPG ( GNU Privacy Guard ) を利用し、ファイルを暗号化することで、安全にパスワード管理ができる。

## 事前準備

-   GnuPG に登録する。
-   下記コマンドを実行し、GnuPG のパスフレーズをファイルに保存しておく。
    ```
    echo <your_passphrase> > passphrase.txt
    ```
-   機密性を保つために、下記コマンドを実行し、パスフレーズのファイルの権限管理をしておく。
    ```
    chmod go-rwx passphrase.txt
    ```
